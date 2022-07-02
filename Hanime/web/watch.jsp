<%-- 
    Document   : watch
    Created on : Jun 18, 2022, 3:05:24 AM
    Author     : yuyu2
--%>

<%@page import="utilities.GlobalConstants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hanime</title>

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/watch.css">

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />

        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.1.0/mdb.min.css" rel="stylesheet" />


        <!-- Comment Websocket Script -->
        <script src="js/comment-websocket.js"></script>
        <script src="js/html-encode.js"></script>
    </head>

    <body>
        <%@include file="components/header.jsp" %>

        <hr class="hanime-hr">
        <section class="hanime-body">
            <div class="container text-white">
                <div class="row">
                    <div class="col-md-8">
                        <div class="ratio ratio-16x9">
                            <iframe src="<c:out value="${video.getVideoUrl()}"></c:out>" title="YouTube video player"
                                    frameborder="0"
                                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                    allowfullscreen
                                    name="video-frame"></iframe>
                            </div>

                            <div class="pt-4 pb-4">
                                <strong><c:out value="${video.getName()}"></c:out></strong>
                            <p class="text-white-50"><span id="video-view"><c:out value="${video.getView()}"></c:out></span> views</p>

                                <div class="hanime-rating" data-value="<c:out value="${rate.getRate()}" default="0"></c:out>">
                                    <div class="hanime-rating__star" data-value="1">
                                        <i class="fa-star fa-sm text-primary far" data-mdb-toggle="tooltip"
                                           data-mdb-original-title="Bad" aria-label="Bad"></i>
                                    </div>

                                    <div class="hanime-rating__star" data-value="2">
                                        <i class="fa-star fa-sm text-primary far" data-mdb-toggle="tooltip"
                                           data-mdb-original-title="Poor" aria-label="Poor"></i>
                                    </div>

                                    <div class="hanime-rating__star" data-value="3">
                                        <i class="fa-star fa-sm text-primary far" data-mdb-toggle="tooltip"
                                           data-mdb-original-title="OK" aria-label="OK"></i>
                                    </div>

                                    <div class="hanime-rating__star" data-value="4">
                                        <i class="fa-star fa-sm text-primary far" data-mdb-toggle="tooltip"
                                           data-mdb-original-title="Good" aria-label="Good"></i>
                                    </div>

                                    <div class="hanime-rating__star" data-value="5">
                                        <i class="fa-star fa-sm text-primary far" data-mdb-toggle="tooltip"
                                           data-mdb-original-title="Excellent" aria-label="Excellent"></i>
                                    </div>
                                </div>
                            </div>

                            <p class="text-white-50"><c:out value="${film.getDescription()}"></c:out></p>

                            <hr class="m-0">

                            <div class="pt-2">
                                <h5>Comments - <span class="text-white-50" id="comment-count"></span></h5>
                                <form class="d-flex flex-row align-items-center mb-4" id="comment-form" autocomplete="off">
                                    <img src="${user.getAvatarUrl()}"
                                     alt="avatar" width="30" height="30" class="rounded-circle m-1">
                                <div class="form-outline flex-fill m-1 form-white">
                                    <input type="text" class="form-control" id="comment-input" data-mdb-showcounter="true" maxlength="100" pattern=".+"/>
                                    <label class="form-label">Your comment here</label>
                                    <div class="form-helper text-white"></div>
                                </div>

                                <button class="btn btn-primary m-1" type="submit">Comment</button>
                            </form>
                            <div class="border border-dark" id="hanime-comments">

                            </div>

                            <a class="m-2" id="load-more-comments" onclick="loadMoreComments()">
                                Load more comments
                            </a>
                        </div>
                    </div>

                    <div class="col-md-4 border border-dark p-0 d-flex flex-column">
                        <div class="overflow-y-scroll flex-fill" data-mdb-perfect-scrollbar='true'
                             style="height: 0; min-height: 400px;">

                            <c:forEach var="v" items="${videos}">
                                <div class="text-white m-2 row g-0 hanime-recommended-videos__video" onclick="location.href = 'watch?id=${v.getId()}'" 
                                     <c:if test="${v.getId() == video.getId()}">style="background-color: #ffffff21"</c:if>
                                         >
                                         <div class="col-2 col-sm-3 col-md-4 p-1">
                                             <img src="${v.getThumbnailUrl()}" class="rounded"
                                              style="object-fit: cover; object-position: center; width: 100%; height: 70px" />
                                     </div>
                                     <div class="col-10 col-sm-9 col-md-8 p-1">
                                         <p class="card-title text-truncate h-100"><c:out value="${v.getName()}"></c:out></p>
                                         </div>
                                     </div>
                            </c:forEach>

                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- MDB -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.1.0/mdb.min.js"></script>
    </body>

    <script>
                                    var commentPage = 0;
                                    var ws = null;

                                    function loadMoreComments() {
                                        ws.get(commentPage);
                                        commentPage++;
                                    }

                                    function createComment(avatar, name, level, content) {
                                        return `<div class="d-flex flex-column hanime-comment"><div class="d-flex align-items-center"><img src="` + avatar + `" alt="avatar" width="30" height="30" class="rounded-circle m-2"><strong>` + htmlEncode(name) + `</strong><div class="border rounded p-1 m-2">Cấp ` + level + `</div></div><p class="text-white-50" style="font-size: 14px; margin-left: 45px;">` + htmlEncode(content) + `</p></div>`;
                                    }

                                    window.addEventListener('load', () => {
                                        ws = new CommentWebSocket('ws://<%= GlobalConstants.HOST + GlobalConstants.COMMENT_WSPATH%>', ${video.getId()}, '<%= token%>');
                                        ws.onopen = loadMoreComments;
                                        ws.onmessage = (event) => {
                                            const data = JSON.parse(event.data);
                                            const commentList = document.getElementById('hanime-comments');
                                            // Insert comment into list 
                                            if (data.action === 'get') {
                                                data.comments.forEach(([cUser, comment]) => {
                                                    commentList.innerHTML += createComment(cUser.avatar_url, cUser.fullname || cUser.email, cUser.level, comment.content);
                                                });
                                            } else if (data.action === 'post') {
                                                const [cUser, comment] = data.comment;
                                                commentList.innerHTML = createComment(cUser.avatar_url, cUser.fullname || cUser.email, cUser.level, comment.content) + commentList.innerHTML;
                                            }

                                            // Update comment count
                                            document.getElementById('comment-count').innerHTML = data.size;
                                            // Hide load-more-comments when all comments loaded
                                            if (document.getElementsByClassName('hanime-comment').length >= data.size)
                                                document.getElementById('load-more-comments').style.display = 'none';
                                        };
                                        document.getElementById('comment-form').onsubmit = function (e) {
                                            e.preventDefault();
                                            ws.post(document.getElementById('comment-input').value);
                                            document.getElementById('comment-input').value = "";
                                        };
                                    });
    </script>

    <script src="js/watch.js" video-id="${video.getId()}" user-id="${user.getId()}"></script>
</html>