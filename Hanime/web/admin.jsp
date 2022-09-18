<%@page import="models.CategoryModel"%>
<%@page import="models.AuthModel"%>
<%@page import="models.NotificationModel"%>
<%@page import="entities.User"%>
<%@page import="utilities.Authentication"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>HAdmin</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link rel="shortcut icon" href="assets/favicon.png">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap"
              rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Template Stylesheet -->
        <link href="css/style-admin.css" rel="stylesheet">


        <script>
            function addCategory(id) {
                document.querySelector(id).innerHTML += `
           <div class="d-flex mb-3">
               <div class="form-floating flex-fill">
                   <select class="form-select" name="category">
                       <option value="0">None</option>
            <c:forEach items="${categories}" var="category">
               <option value="${category.getId()}"><c:out value="${category.getName()}"/></option>
            </c:forEach>
                   </select>
                   <label>Select Category</label>
               </div>
               <button class="btn btn-danger ms-2" type="button" onclick="removeCategory('` + id + `',this.parentNode)">Delete</button>
           </div>
           `;
            }

            function removeCategory(id, node) {
                document.querySelector(id).removeChild(node);
            }

            function clearCategory(id) {
                document.querySelector(id).innerHTML = "";
            }
        </script>
    </head>

    <body>
        <div class="container-fluid position-relative d-flex p-0">
            <!-- Spinner Start -->
            <div id="spinner"
                 class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->


            <!-- Sidebar Start -->
            <div class="sidebar pe-4 pb-3">
                <nav class="navbar bg-secondary navbar-dark">

                    <div class="d-flex align-items-center ms-4 mb-4">
                        <div class="position-relative">
                            <img class="rounded-circle"
                                 src="${user.getAvatarUrl()}" alt=""
                                 style="width: 40px; height: 40px;">
                            <div
                                class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1">
                            </div>
                        </div>
                        <div class="ms-3">
                            <h6 class="mb-0"><c:out value="${user.getFullname()}" default="${user.getEmail()}"/></h6>
                            <span>Admin</span>
                        </div>
                    </div>

                    <div class="navbar-nav w-100 nav">
                        <a href="#" class="nav-item nav-link" data-bs-toggle="tab" data-bs-target="#dashboard">
                            <i class="fa fa-chart-line me-2"></i>
                            Dashboard
                        </a>

                        <a href="#" class="nav-item nav-link " data-bs-toggle="tab" data-bs-target="#category">
                            <i class="fa fa-list me-2"></i>
                            Category
                        </a>

                        <a href="#" class="nav-item nav-link" data-bs-toggle="tab" data-bs-target="#film">
                            <i class="fa fa-film me-2"></i>
                            Film
                        </a>

                        <a href="#" class="nav-item nav-link" data-bs-toggle="tab" data-bs-target="#account">
                            <i class="fa fa-user-alt me-2"></i>
                            Account
                        </a>

                        <a href="." class="nav-item nav-link">
                            <i class="fa fa-arrow-circle-left me-2"></i>
                            Back
                        </a>
                    </div>
                </nav>
            </div>
            <!-- Sidebar End -->


            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <nav class="navbar navbar-expand bg-secondary navbar-dark sticky-top px-4 py-0">
                    <a href="#" class="sidebar-toggler flex-shrink-0">
                        <i class="fa fa-bars"></i>
                    </a>

                    <div class="navbar-nav align-items-center ms-auto">

                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <i class="fa fa-bell me-lg-2"></i>
                                <span class="d-none d-lg-inline-flex">Notification</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
                                <c:forEach items="${topNotis}" var="notification">
                                    <a href="${notification.getNavLink()}" class="dropdown-item">
                                        <h6 class="fw-normal mb-0"><c:out value="${notification.getContent()}"/></h6>
                                        <small>${notification.getTime().toGMTString()}</small>
                                    </a>
                                </c:forEach>

                                <c:if test="${topNotis.size() > 0}">
                                    <hr class="dropdown-divider"/>
                                </c:if>
                                <a href="notification" class="dropdown-item text-center rounded">See all notifications</a>
                            </div>
                        </div>

                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <img class="rounded-circle me-lg-2"
                                     src="${user.getAvatarUrl()}" alt=""
                                     style="width: 40px; height: 40px;">
                                <span class="d-none d-lg-inline-flex">${user.getFullname()}</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
                                <a href="setting" class="dropdown-item">Settings</a>
                                <a href="signout" class="dropdown-item">Log Out</a>
                            </div>
                        </div>
                    </div>
                </nav>
                <!-- Navbar End -->


                <div class="tab-content">

                    <!-- Dashboard Tab -->
                    <div class="tab-pane fade" id="dashboard">
                        <!-- Numbers Start -->
                        <div class="container-fluid pt-4 px-4">
                            <div class="row g-4">
                                <div class="col-sm-6 col-xl-3">
                                    <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                                        <i class="fa fa-chart-line fa-3x text-primary"></i>
                                        <div class="ms-3">
                                            <p class="mb-2">Total View</p>
                                            <h6 class="mb-0">${totalView}</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-xl-3">
                                    <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                                        <i class="fa fa-chart-bar fa-3x text-primary"></i>
                                        <div class="ms-3">
                                            <p class="mb-2">Total Comment</p>
                                            <h6 class="mb-0">${totalComment}</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-xl-3">
                                    <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                                        <i class="fa fa-chart-area fa-3x text-primary"></i>
                                        <div class="ms-3">
                                            <p class="mb-2">Total Rate</p>
                                            <h6 class="mb-0">${totalRate}</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-xl-3">
                                    <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                                        <i class="fa fa-chart-pie fa-3x text-primary"></i>
                                        <div class="ms-3">
                                            <p class="mb-2">Total User</p>
                                            <h6 class="mb-0">${users.size()}</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Numbers End -->


                        <!-- Chart Start -->
                        <div class="container-fluid pt-4 px-4">
                            <div class="row g-4">
                                <div class="col-sm-12 col-xl-12">
                                    <div class="bg-secondary text-center rounded p-4">
                                        <div class="d-flex align-items-center justify-content-between mb-4">
                                            <h6 class="mb-0">Recent Data</h6>
                                        </div>
                                        <canvas id="recent-view"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Chart End -->


                        <!-- Top users Start -->
                        <div class="container-fluid pt-4 px-4">
                            <div class="bg-secondary text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Top Users</h6>
                                </div>
                                <div class="table-responsive">
                                    <table class="table text-start align-middle table-bordered table-hover mb-0">
                                        <thead>
                                            <tr class="text-white">
                                                <th scope="col">Fullname</th>
                                                <th scope="col">Email</th>
                                                <th scope="col">Gender</th>
                                                <th scope="col">Exp</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="item" items="${topUsers}">

                                                <tr>
                                                    <td><c:out value="${item.getFullname()}" default="Unknown"/></td>
                                                    <td>${item.getEmail()}</td>
                                                    <td><c:out value="${item.getGender()}"/></td>
                                                    <td>${item.getExp()}</td>
                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- Top users End -->

                        <!-- Recent Comments Start -->
                        <div class="container-fluid pt-4 px-4">
                            <div class="bg-secondary text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Recent Comments</h6>
                                </div>
                                <div class="table-responsive">
                                    <table class="table text-start align-middle table-bordered table-hover mb-0">
                                        <thead>
                                            <tr class="text-white">
                                                <th scope="col">Identity</th>
                                                <th scope="col">Comment</th>
                                                <th scope="col">Video</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="item" items="${recentComments}">

                                                <tr>
                                                    <td><span style="color:white;">${item.getValue0()}</span><br>${item.getValue1()}</td>
                                                    <td>${item.getValue2()}</td>
                                                    <td><span style="color:white;">${item.getValue4()}</span><br>${item.getValue3()}</td>

                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- Recent comments End -->

                        <!-- Top Film Start -->
                        <div class="container-fluid pt-4 px-4">
                            <div class="bg-secondary text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Top Films</h6>
                                </div>
                                <div class="table-responsive">
                                    <table class="table text-start align-middle table-bordered table-hover mb-0">
                                        <thead>
                                            <tr class="text-white">
                                                <th scope="col">Top</th>
                                                <th scope="col">Film</th>
                                                <th scope="col">View</th>
                                                <th scope="col">Follow</th>
                                                <th scope="col">Rate</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="item" items="${topFilms}">

                                                <tr>
                                                    <td>${item.getValue0()}</td>
                                                    <td>${item.getValue1()}</td>
                                                    <td>${item.getValue2()}</td>
                                                    <td>${item.getValue3()}</td>
                                                    <td><span style="color:white;">${item.getValue4()}</span><br>${item.getValue5()} rates</td>

                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- Top Film End -->

                        <!-- Top Video Start -->
                        <div class="container-fluid pt-4 px-4">
                            <div class="bg-secondary text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Top Videos</h6>
                                </div>
                                <div class="table-responsive">
                                    <table class="table text-start align-middle table-bordered table-hover mb-0">
                                        <thead>
                                            <tr class="text-white">
                                                <th scope="col">Top</th>
                                                <th scope="col">Video</th>
                                                <th scope="col">View</th>
                                                <th scope="col">Rate</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="item" items="${topVideos}">

                                                <tr>
                                                    <td>${item.getValue0()}</td>
                                                    <td><span style="color:white;">${item.getValue1()}</span><br>${item.getValue2()}</td>
                                                    <td>${item.getValue3()}</td>
                                                    <td>${item.getValue4()}</td>

                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- Top Video End -->


                        <!-- Category Tab -->
                        <div class="tab-pane fade" id="category">
                            <div class="container p-3">
                                <form class="bg-secondary rounded h-100 p-4" method="post">
                                    <h6 class="mb-4">Create New Category</h6>

                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" name="name" placeholder="Category Name" required>
                                        <label>Name</label>
                                    </div>

                                    <div class="form-floating mb-3">
                                        <textarea class="form-control" name="description" placeholder="Category Description"
                                                  style="height: 150px;" required></textarea>
                                        <label>Description</label>
                                    </div>

                                    <button class="btn btn-primary m-1" type="submit" name="action" value="create-category">Create</button>
                                    <button class="btn btn-outline-light m-1" type="reset">Clear</button>
                                </form>
                            </div>

                            <div class="container p-3">
                                <h6 class="mb-4">List Category</h6>
                                <table class="table table-striped table-hover">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col" style="width: 100px;">#</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Description</th>
                                            <th scope="col" style="width: 160px;">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${categories}" var="category">
                                            <tr>
                                        <form method="post">
                                            <th scope="row">
                                                <input type="text" class="form-control bg-dark" name="id" value="${category.getId()}" readonly>
                                            </th>

                                            <td>
                                                <input type="text" class="form-control" name="name" value="<c:out value="${category.getName()}"/>" required>
                                            </td>

                                            <td>
                                                <input type="text" class="form-control" name="description" value="<c:out value="${category.getDescription()}"/>" required>
                                            </td>

                                            <td>
                                                <button type="submit" class="btn btn-outline-info" name="action" value="edit-category">
                                                    <i class="fa fa-pen"></i>
                                                </button>
                                                <button type="submit" class="btn btn-outline-danger" name="action" value="delete-category">
                                                    <i class="fa fa-trash"></i>
                                                </button>
                                                <a href="category?id=${category.getId()}" class="btn btn-outline-light">
                                                    <i class="fa fa-eye"></i>
                                                </a>
                                            </td>
                                        </form>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Film Tab -->
                        <div class="tab-pane fade" id="film">
                            <div class="container p-3">
                                <form class="bg-secondary rounded h-100 p-4" method="post">
                                    <h6 class="mb-4">Create New Film</h6>

                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" name="name" placeholder="Category Name" required>
                                        <label>Name</label>
                                    </div>

                                    <div class="form-floating mb-3">
                                        <textarea class="form-control" name="description" placeholder="Category Description"
                                                  style="height: 150px;" required></textarea>
                                        <label>Description</label>
                                    </div>

                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="thumbnail-url" placeholder="Thumbnail URL" required>
                                        <label>Thumbnail URL</label>
                                    </div>

                                    <div class="form-floating mb-3">
                                        <div>
                                            <input type="checkbox" name="notify" id="notify-everyone" class="form-check-input" checked>
                                            <label class="form-check-label ms-2" for="notify-everyone">Notify to everyone</label>
                                        </div>
                                    </div>

                                    <div class="form-floating mb-3">
                                        <button class="btn btn-success" type="button" onclick="addCategory('#category-selectors')">Add
                                            Category</button>
                                    </div>

                                    <div id="category-selectors">

                                    </div>

                                    <button class="btn btn-primary m-1" type="submit" name="action"
                                            value="create-film">Create</button>
                                    <button class="btn btn-outline-light m-1" type="reset"
                                            onclick="clearCategory('#category-selectors')">Clear</button>
                                </form>
                            </div>

                            <div class="container p-3">
                                <h6 class="mb-4">List Film</h6>
                                <table class="table table-striped table-hover">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col" style="width: 100px;">#</th>
                                            <th scope="col">Name</th>
                                            <th scope="col" style="width: 160px;">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${films}" var="film">
                                            <tr>
                                        <form method="post">
                                            <th scope="row">
                                                <span>${film.getId()}</span>
                                                <input type="hidden" name="id" value="${film.getId()}">
                                            </th>

                                            <td>
                                                <p><c:out value="${film.getName()}"/></p>
                                            </td>

                                            <td>
                                                <button type="submit" class="btn btn-outline-info" name="action"
                                                        value="edit-film-form">
                                                    <i class="fa fa-pen"></i>
                                                </button>
                                                <button type="submit" class="btn btn-outline-danger" name="action"
                                                        value="delete-film">
                                                    <i class="fa fa-trash"></i>
                                                </button>
                                                <a href="film?id=${film.getId()}" class="btn btn-outline-light">
                                                    <i class="fa fa-eye"></i>
                                                </a>
                                            </td>
                                        </form>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Edit Film Tab -->
                        <div class="tab-pane fade" id="edit-film">
                            <c:if test="${editFilm != null}">
                                <div class="container p-3">
                                    <form class="bg-secondary rounded h-100 p-4" method="post">
                                        <h6 class="mb-4">Edit Film</h6>

                                        <input type="hidden" name="id" value="${editFilm.getId()}">

                                        <div class="form-floating mb-3">
                                            <input type="text" class="form-control" name="name" value="<c:out value="${editFilm.getName()}" default="N/A"/>" placeholder="Category Name">
                                            <label>Name</label>
                                        </div>

                                        <div class="form-floating mb-3">
                                            <textarea class="form-control" name="description" placeholder="Category Description"
                                                      style="height: 150px;"><c:out value="${editFilm.getDescription()}" default="N/A"/></textarea>
                                            <label>Description</label>
                                        </div>

                                        <div class="form-floating mb-3">
                                            <input class="form-control" name="thumbnail-url" value="<c:out value="${editFilm.getThumbnailUrl()}" default="N/A"/>" placeholder="Thumbnail URL">
                                            <label>Thumbnail URL</label>
                                        </div>

                                        <div class="form-floating mb-3">
                                            <button class="btn btn-success" type="button" onclick="addCategory('#edit-category-selectors')">Add
                                                Category</button>
                                        </div>

                                        <div id="edit-category-selectors">
                                            <c:forEach items="${editFilmCategory}" var="cat">
                                                <div class="d-flex mb-3">
                                                    <div class="form-floating flex-fill">
                                                        <select class="form-select" name="category">
                                                            <option value="0">None</option>
                                                            <c:forEach items="${categories}" var="category">
                                                                <option value="${category.getId()}" <c:if test="${cat.getId() == category.getId()}">selected</c:if>><c:out value="${category.getName()}"/></option>
                                                            </c:forEach>
                                                        </select>
                                                        <label>Select Category</label>
                                                    </div>
                                                    <button class="btn btn-danger ms-2" type="button" onclick="removeCategory('#edit-category-selectors', this.parentNode)">Delete</button>
                                                </div>
                                            </c:forEach>
                                        </div>

                                        <button class="btn btn-primary m-1" type="submit" name="action"
                                                value="edit-film">Edit</button>
                                        <button class="btn btn-outline-light m-1" type="reset">Reset</button>
                                    </form>
                                </div>
                            </c:if>
                        </div>

                        <!-- Video Tab -->
                        <div class="tab-pane fade" id="create-video">
                            <c:if test="${selectedFilm != null}">
                                <div class="container p-3">
                                    <form class="bg-secondary rounded h-100 p-4" method="post">
                                        <h6 class="mb-4">Create New Video - <c:out value="${selectedFilm.getName()}"/></h6>

                                        <input type="hidden" name="id" value="${selectedFilm.getId()}">

                                        <div class="form-floating mb-3">
                                            <input type="text" class="form-control" name="name" value=""
                                                   placeholder="Category Name" required>
                                            <label>Name</label>
                                        </div>

                                        <div class="form-floating mb-3">
                                            <input class="form-control" name="thumbnail-url" value="" placeholder="Thumbnail URL">
                                            <label>Thumbnail URL</label>
                                        </div>

                                        <div class="form-floating mb-3">
                                            <input class="form-control" name="video-url" value="" placeholder="Video URL" required>
                                            <label>Video URL</label>
                                        </div>

                                        <div class="form-floating mb-3">
                                            <input class="form-control" name="length" value="" placeholder="Length" type="number"
                                                   min="0" required>
                                            <label>Video Length (minutes)</label>
                                        </div>

                                        <div class="form-floating mb-3">
                                            <div>
                                                <input type="checkbox" name="notify" id="notify-follower" class="form-check-input" checked>
                                                <label class="form-check-label ms-2" for="notify-follower">Notify to follower</label>
                                            </div>
                                        </div>

                                        <button class="btn btn-primary m-1" type="submit" name="action"
                                                value="create-video">Create</button>
                                        <button class="btn btn-outline-light m-1" type="reset">Clear</button>
                                    </form>
                                </div>
                            </c:if>
                        </div>

                        <div class="tab-pane fade" id="edit-video">
                            <c:if test="${selectedVideo != null}">
                                <div class="container p-3">
                                    <form class="bg-secondary rounded h-100 p-4" method="post">
                                        <h6 class="mb-4">Edit Video</h6>

                                        <input type="hidden" name="id" value="${selectedVideo.getId()}">
                                        <input type="hidden" name="film" value="${selectedVideo.getFilmId()}">

                                        <div class="form-floating mb-3">
                                            <input type="text" class="form-control" name="name" value="<c:out value="${selectedVideo.getName()}"/>"
                                                   placeholder="Category Name" required>
                                            <label>Name</label>
                                        </div>

                                        <div class="form-floating mb-3">
                                            <input class="form-control" name="thumbnail-url" value="<c:out value="${selectedVideo.getThumbnailUrl()}"/>" placeholder="Thumbnail URL">
                                            <label>Thumbnail URL</label>
                                        </div>

                                        <div class="form-floating mb-3">
                                            <input class="form-control" name="video-url" value="<c:out value="${selectedVideo.getVideoUrl()}"/>" placeholder="Video URL" required>
                                            <label>Video URL</label>
                                        </div>

                                        <div class="form-floating mb-3">
                                            <input class="form-control" name="length" value="<c:out value="${selectedVideo.getLength()}"/>" placeholder="Length" type="number"
                                                   min="0" required>
                                            <label>Video Length (minutes)</label>
                                        </div>

                                        <button class="btn btn-primary m-1" type="submit" name="action"
                                                value="edit-video">Edit</button>
                                        <button class="btn btn-outline-light m-1" type="reset">Clear</button>
                                    </form>
                                </div>
                            </c:if>
                        </div>

                        <!-- Account Tab -->
                        <div class="tab-pane fade" id="account">
                            <div class="container p-3">
                                <h6>Accounts List</h6>

                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control bg-secondary" data-yuyu-datatables="#account-table"
                                           data-yuyu-search-col="1">
                                    <label>Search</label>
                                </div>

                                <div class="btn-group mb-5">
                                    <button class="btn btn-outline-light pe-3 ps-3" data-yuyu-datatables="#account-table"
                                            data-yuyu-click="prev-page">&LeftAngleBracket;</button>
                                    <button class="btn btn-outline-light page-number"
                                            data-yuyu-datatables="#account-table">1</button>
                                    <button class="btn btn-outline-light pe-3 ps-3" data-yuyu-datatables="#account-table"
                                            data-yuyu-click="next-page">&RightAngleBracket;</button>
                                </div>

                                <table class="table table-responsive datatables" id="account-table">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="width: 100px;">#</th>
                                            <th scope="col">Username</th>
                                            <th scope="col">Role</th>
                                            <th scope="col" style="width: 150px;">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${accounts}" var="acc">
                                            <tr>
                                                <th scope="row">${acc.getId()}</th>
                                                <td><c:out value="${acc.getUsername()}"/></td>
                                                <td>
                                                    <c:if test="${acc.isAdmin()}">
                                                        Admin
                                                    </c:if>
                                                    <c:if test="${!acc.isAdmin()}">
                                                        User
                                                    </c:if>
                                                </td>

                                                <td>
                                                    <form method="post" class="d-block">
                                                        <input type="hidden" name="id" value="${acc.getId()}">
                                                        <button type="submit" name="action" value="delete-account" class="btn btn-outline-danger">
                                                            <i class="fa fa-trash"></i>
                                                        </button>
                                                        <a href="account?id=${acc.getId()}" class="btn btn-outline-light">
                                                            <i class="fa fa-eye"></i>
                                                        </a>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <script>
                        window.addEventListener('load', () => {
                            document.querySelector("#<c:out value="${startupTab}" default="dashboard"/>").classList.add("show", "active");
                            document.querySelector("a[data-bs-target='#<c:out value="${startupTab}" default="dashboard"/>']").classList.add("active");
                        });
                    </script>

                    <!-- Content End -->
                </div>

                <!-- JavaScript Libraries -->
                <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

                <script src="lib/chart/chart.min.js"></script>
                <script src="lib/easing/easing.min.js"></script>
                <script src="lib/waypoints/waypoints.min.js"></script>
                <script src="lib/owlcarousel/owl.carousel.min.js"></script>
                <script src="lib/tempusdominus/js/moment.min.js"></script>
                <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
                <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

                <!-- Template Javascript -->
                <script src="js/main.js"></script>
                <script src="js/datatables.js"></script>

                </body>

                </html>