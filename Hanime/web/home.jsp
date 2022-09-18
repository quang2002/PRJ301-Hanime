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
            <div class="hanime-body__cards container-fluid">
                <div class="row">
                    <c:forEach var="film" items="${films}">
                        <div class="hanime-body__card-item col-xl-2 col-md-3 col-sm-6 col-xs-12" onmousedown="location.href = 'film?id=${film.getKey().getId()}'">
                            <img class="hanime-body__card-item--thumbnail" style="object-position: center; object-fit: cover;" height="200"
                                 src="${film.getKey().getThumbnailUrl()}">
                            <div class="hanime-body__card-item--body">
                                <p class="hanime-body__card-item--body--title"><c:out value="${film.getKey().getName()}"/></p>
                                <p class="hanime-body__card-item--body--sub"><c:out value="${film.getValue()}" default="0"/> views</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>

        <!-- MDB -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.1.0/mdb.min.js"></script>
    </body>
</html>