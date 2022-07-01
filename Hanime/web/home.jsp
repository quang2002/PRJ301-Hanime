<%-- 
    Document   : home
    Created on : Jun 10, 2022, 11:40:06 PM
    Author     : yuyu2
--%>

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
            <div class="hanime-body__trending">

            </div>

            <div class="hanime-body__cards container-fluid">
                <div class="row">
                    <c:forEach var="video" items="${videos}">
                        <div class="hanime-body__card-item col-xl-2 col-md-3 col-sm-6 col-xs-12" onmousedown="location.href = 'watch?id=${video.getId()}'">
                            <img class="hanime-body__card-item--thumbnail"
                                 src="${video.getThumbnailUrl()}">
                            <div class="hanime-body__card-item--body">
                                <p class="hanime-body__card-item--body--title"><c:out value="${video.getName()}"></c:out></p>
                                <p class="hanime-body__card-item--body--sub"><c:out value="${video.getView()}"></c:out> views</p>
                                </div>
                            </div>
                    </c:forEach>
                </div>
            </div>
        </section>

    </body>
    <!-- MDB -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.1.0/mdb.min.js"></script>
</html>