<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hanime</title>
        <link rel="shortcut icon" href="assets/favicon.png">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/style.css">

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />

        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.1.0/mdb.min.css" rel="stylesheet" />

        <style>
            .film-categories {
                padding: 5px;
            }

            .film-categories>a {
                text-align: center;
                margin: 0px;
                padding: 5px;
                border-radius: 5px;
                background-color: #262626;
                color: #ffffff7f;
                font-size: smaller;
            }
        </style>
    </head>

    <body>
        <%@include file="components/header.jsp" %>
        <hr class="hanime-hr">
        <section class="hanime-body">
            <div class="container p-4 text-white-50">
                <div class="row">
                    <div class="col-sm-12 col-md-6 d-flex justify-content-center flex-column">
                        <img src="<c:out value="${film.getThumbnailUrl()}"/>" class="img-fluid img-thumbnail" alt="">
                    </div>

                    <div class="col-sm-12 col-md-6 p-4 d-flex flex-column justify-content-center">
                        <div class="row">
                            <div class="col">Name</div>
                            <div class="col text-truncate" data-mdb-toggle="tooltip" data-mdb-original-title="<c:out value="${film.getName()}"/>">
                                <c:out value="${film.getName()}"/>
                            </div>
                        </div>
                        <hr>

                        <div class="row">
                            <div class="col">Genre</div>

                            <div class="col d-flex flex-wrap">
                                <c:forEach items="${filmCategories}" var="category">
                                    <div class="film-categories">
                                        <a href="category?id=${category.getId()}">
                                            <c:out value="${category.getName()}"/>
                                        </a>
                                    </div>
                                </c:forEach>

                                <c:if test="${filmCategories.size() == 0}">N/A</c:if>
                                </div>
                            </div>
                            <hr>

                            <div class="row">
                                <div class="col">Episodes</div>
                                <div class="col">${videos.size()}</div>
                        </div>
                        <hr>

                        <div class="row">
                            <div class="col">Rate</div>
                            <div class="col"><c:out value="${rate} / 5" default="N/A"/></div>
                        </div>
                        <hr>

                        <div class="row">
                            <div class="col">View</div>
                            <div class="col"><c:out value="${view}"/> views</div>
                        </div>
                        <hr>

                        <div class="row">
                            <c:if test="${followed}">
                                <button class="btn btn-danger w-100" onclick="toggleFollow(this)">unfollow</button>
                            </c:if>

                            <c:if test="${!followed}">
                                <button class="btn btn-success w-100" onclick="toggleFollow(this)">follow</button>
                            </c:if>
                        </div>
                    </div>
                </div>

                <hr>

                <div class="row">
                    <h5>Description</h5>
                    <p class="text-body">
                        <c:out value="${film.getDescription()}" escapeXml="false"/>
                    </p>
                </div>

                <hr>

                <h5 class="d-flex align-items-center">
                    Episodes
                    <c:if test="${isAdmin}">
                        <div class="ms-2">
                            <form method="post" class="p-0 m-0" action="admin">
                                <input type="hidden" name="id" value="${film.getId()}">
                                <button type="submit" class="btn btn-dark" name="action" value="create-video-form">
                                    <div>
                                        <i class="fa fa-plus"></i>
                                    </div>
                                </button>
                            </form>
                        </div>
                    </c:if>
                </h5>
                <div class="row p-2 pt-0">
                    <c:if test="${videos != null && videos.size() > 0}">
                        <c:forEach var="i" begin="${0}" end="${videos.size() - 1}">
                            <div class="col-1 p-1">
                                <a class="btn btn-dark d-block" href="watch?id=${videos.get(i).getId()}">
                                    <c:out value="${i + 1}"/>
                                </a>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
        </section>

        <!-- MDB -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.1.0/mdb.min.js"></script>
    </body>

    <script type="text/javascript" src="js/film.js" uid="${user.getId()}" fid="${film.getId()}"></script>
</html>