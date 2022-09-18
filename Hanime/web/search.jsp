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
    </head>

    <body>
        <%@include file="components/header.jsp" %>
        <hr class="hanime-hr">
        <section class="hanime-body">
            <div class="container">

                <!-- START: FILTER -->
                <div class="hanime-search__filter">
                    <div>
                        <button class="btn btn-dark" data-mdb-toggle="collapse" data-mdb-target="#collapse-filter">
                            <i class="fa-solid fa-filter"></i>
                            <span>Filter</span>
                        </button>
                    </div>

                    <div class="collapse show mt-3" id="collapse-filter">
                        <form class="row p-2">
                            <c:if test="${searchQueryString != null}">
                                <input type="hidden" name="q" value="${searchQueryString}">
                            </c:if>
                            
                            <c:if test="${searchUploadDate != null}">
                                <input type="hidden" name="upload-date" value="${searchUploadDate}">
                            </c:if>

                            <c:if test="${searchDuration != null}">
                                <input type="hidden" name="duration" value="${searchDuration}">
                            </c:if>

                            <c:if test="${searchSortBy != null}">
                                <input type="hidden" name="sort-by" value="${searchSortBy}">
                            </c:if>

                            <div class="col-12 col-sm-4 p-2">
                                <p class="text-white">UPLOAD DATE</p>
                                <hr>
                                <button type="submit" name="upload-date" value="0" class="btn d-block text-white-50">Anytime</button>
                                <button type="submit" name="upload-date" value="1" class="btn d-block text-white-50">Last hour</button>
                                <button type="submit" name="upload-date" value="2" class="btn d-block text-white-50">Today</button>
                                <button type="submit" name="upload-date" value="3" class="btn d-block text-white-50">This week</button>
                                <button type="submit" name="upload-date" value="4" class="btn d-block text-white-50">This month</button>
                                <button type="submit" name="upload-date" value="5" class="btn d-block text-white-50">This year</button>
                            </div>

                            <div class="col-12 col-sm-4 p-2">
                                <p class="text-white">DURATION</p>
                                <hr>
                                <button type="submit" name="duration" value="0" class="btn d-block text-white-50">Any Length</button>
                                <button type="submit" name="duration" value="1" class="btn d-block text-white-50">Under 30 minutes</button>
                                <button type="submit" name="duration" value="2" class="btn d-block text-white-50">30-60 minutes</button>
                                <button type="submit" name="duration" value="3" class="btn d-block text-white-50">Over 1 hour</button>
                            </div>

                            <div class="col-12 col-sm-4 p-2">
                                <p class="text-white">SORT BY</p>
                                <hr>
                                <button type="submit" name="sort-by" value="0" class="btn d-block text-white-50">Upload date</button>
                                <button type="submit" name="sort-by" value="1" class="btn d-block text-white-50">View count</button>
                                <button type="submit" name="sort-by" value="2" class="btn d-block text-white-50">Rating</button>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- END: FILTER -->
                <hr class="mt-3 mb-3">

                <!-- START: LIST FILM -->
                <div class="container-fluid">
                    <c:if test="${result == null}">
                        <div class="text-white-50">
                            Your search - <span class="text-danger"><%= request.getParameter("q")%></span> - did not
                            match any documents.
                            <br>
                            <br>
                            Suggestions:
                            <br>
                            <ul>
                                <li>Make sure that all words are spelled correctly.</li>
                                <li>Try different keywords.</li>
                                <li>Try more general keywords.</li>
                                <li>Try fewer keywords.</li>
                            </ul>
                        </div>
                    </c:if>

                    <c:forEach items="${result}" var="video">
                        <a class="btn btn-sm p-0 m-2" href="watch?id=${video.getId()}">
                            <div class="row">
                                <div class="col-12 col-sm-4 col-md-3">
                                    <img class="img-fluid" style="object-fit: cover; object-position: center;"
                                         src="${video.getThumbnailUrl()}"
                                         alt="">
                                </div>

                                <div class="col-12 col-sm-8 col-md-9 mb-2 d-flex flex-column justify-content-center">
                                    <h6 class="text-truncate text-white m-0 mt-2">
                                        <c:out value="${video.getName()}"/>
                                    </h6>

                                    <strong class="mt-2">${video.getView()} views</strong>
                                </div>
                            </div>
                        </a>
                    </c:forEach>

                </div>
                <!-- END: LIST FILM -->
            </div>
        </section>

        <!-- MDB -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.1.0/mdb.min.js"></script>
        
        <script>
            window.addEventListener('load', function () {
                const options = document.querySelectorAll('#collapse-filter > * > div');
                
                options[0].querySelectorAll('button')[${searchUploadDate}].classList.add('btn-primary');
                options[1].querySelectorAll('button')[${searchDuration}].classList.add('btn-primary');
                options[2].querySelectorAll('button')[${searchSortBy}].classList.add('btn-primary');
            });
        </script>
    </body>
</html>