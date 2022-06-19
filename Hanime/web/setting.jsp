<%-- 
    Document   : setting
    Created on : Jun 11, 2022, 5:27:30 PM
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
        <link rel="stylesheet" href="css/setting.css">

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
        <section class="hanime-body min-vh-100">
            <form method="post">
                <div class="container light-style flex-grow-1 container-p-y">

                    <h4 class="font-weight-bold py-3 mb-4 text-white">
                        Account settings
                    </h4>

                    <div class="card overflow-hidden">
                        <div class="row no-gutters row-bordered row-border-light">

                            <div class="col-md-3 pt-0">
                                <div class="list-group list-group-flush account-settings-links" role="tablist">
                                    <a class="list-group-item list-group-item-action active" data-mdb-toggle="tab"
                                       href="#account-general">General</a>
                                    <a class="list-group-item list-group-item-action" data-mdb-toggle="tab"
                                       href="#account-change-password">Change password</a>
                                    <a class="list-group-item list-group-item-action" data-mdb-toggle="tab"
                                       href="#account-notifications">Notifications</a>
                                </div>
                            </div>

                            <div class="col-md-9">
                                <hr class="d-md-none">
                                <div class="tab-content">
                                    <div class="tab-pane fade active show" id="account-general">

                                        <div class="card-body media align-items-center d-flex justify-content-around">
                                            <img src="${user.getAvatarUrl()}" alt=""
                                                 class="rounded-circle" style="object-fit: cover; object-position: center;" width="80" height="80" id="img-avatar">
                                            <div class="media-body ml-4">
                                                <label class="btn btn-outline-primary">
                                                    Upload new photo
                                                    <input type="file" data-img="img-avatar" data-max-size="5242880" data-error-max-size="File không quá 5MB" data-max-width="256" data-max-height="256" class="account-settings-fileinput file-upload" accept="image/*">
                                                    <input type="hidden" name="avatar" value="">
                                                </label> &nbsp;
                                                <a href="" class="btn btn-default md-btn-flat">Reset</a>
                                            </div>
                                        </div>

                                        <hr class="border-light m-0">

                                        <div class="card-body">
                                            <div class="form-outline mb-4 col-auto">
                                                <input class="form-control" type="text" value="<c:out value="${user.getFullname()}"></c:out>" name="fullname"/>
                                                    <label class="form-label">Fullname</label>
                                                </div>

                                                <div class="btn-group d-flex flex-row align-items-center mb-4">
                                                    <input type="radio" class="btn-check" name="gender" id="gender-female"
                                                           autocomplete="off" value="female" <c:if test="${!user.getGender()}">checked</c:if> />
                                                    <label class="btn btn-light" for="gender-female">
                                                        Female <i class="fa-solid fa-venus"></i>
                                                    </label>

                                                    <input type="radio" class="btn-check" name="gender" id="gender-male"
                                                           autocomplete="off" value="male" <c:if test="${user.getGender()}">checked</c:if> />
                                                    <label class="btn btn-light" for="gender-male">
                                                        Male <i class="fa-solid fa-mars"></i>
                                                    </label>
                                                </div>

                                                <div class="form-outline mb-4">
                                                    <input type="date" class="form-control" value="<c:out value="${user.getDob()}"></c:out>" name="birthdate">
                                                    <label class="form-label">Birthdate</label>
                                                </div>

                                                <div class="form-outline mb-4">
                                                    <input type="tel" class="form-control" value="<c:out value="${user.getPhone()}"></c:out>" name="phone">
                                                    <label class="form-label">Phone</label>
                                                </div>

                                                <div class="form-outline mb-4">
                                                    <input type="email" class="form-control mb-1" value="<c:out value="${user.getEmail()}"></c:out>" name="email">
                                                    <label class="form-label">E-mail</label>
                                                </div>

                                                <!--
                                                <div class="alert alert-warning mt-3">
                                                    Your email is not confirmed. Please check your inbox.<br>
                                                    <a href="javascript:void(0)">Resend confirmation</a>
                                                </div>
                                                -->

                                                <div class="form-outline mb-4">
                                                    <textarea class="form-control mb-1" style="resize: none;" rows="5"
                                                              name="address"><c:out value="${user.getAddress()}"></c:out></textarea>
                                                    <label class="form-label">Address</label>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="tab-pane fade" id="account-change-password">
                                            <div class="card-body pb-2">

                                                <div class="form-outline mb-4">
                                                    <input type="password" class="form-control" name="old-password">
                                                    <label class="form-label">Current password</label>
                                                </div>

                                                <div class="form-outline mb-4">
                                                    <input type="password" class="form-control" name="new-password">
                                                    <label class="form-label">New password</label>
                                                </div>

                                                <div class="form-outline mb-4">
                                                    <input type="password" class="form-control" name="confirm-password">
                                                    <label class="form-label">Repeat new password</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="tab-pane fade" id="account-notifications">
                                            <div class="card-body pb-2">

                                                <h6 class="mb-4">Activity</h6>

                                                <div class="form-group mb-4">
                                                    <label class="switcher">
                                                        <input type="checkbox" class="switcher-input" name="notify-video-upload" <c:if test="${user.isNotifyVideoUpload()}">checked</c:if>>
                                                        <span class="switcher-indicator">
                                                            <span class="switcher-yes"></span>
                                                            <span class="switcher-no"></span>
                                                        </span>
                                                        <span class="switcher-label">Email me when new video is uploads</span>
                                                    </label>
                                                </div>

                                                <div class="form-group mb-4">
                                                    <label class="switcher">
                                                        <input type="checkbox" class="switcher-input" name="notify-friend-request" <c:if test="${user.isNotifyFriendRequest()}">checked</c:if>>
                                                        <span class="switcher-indicator">
                                                            <span class="switcher-yes"></span>
                                                            <span class="switcher-no"></span>
                                                        </span>
                                                        <span class="switcher-label">Email me when someone send add friend
                                                            request</span>
                                                    </label>
                                                </div>
                                            </div>
                                            <hr class="border-light m-0">
                                            <div class="card-body pb-2">

                                                <h6 class="mb-4">Application</h6>

                                                <div class="form-group mb-4">
                                                    <label class="switcher">
                                                        <input type="checkbox" class="switcher-input" name="notify-news" <c:if test="${user.isNotifyNews()}">checked</c:if>>
                                                        <span class="switcher-indicator">
                                                            <span class="switcher-yes"></span>
                                                            <span class="switcher-no"></span>
                                                        </span>
                                                        <span class="switcher-label">News and announcements</span>
                                                    </label>
                                                </div>
                                                <div class="form-group mb-4">
                                                    <label class="switcher">
                                                        <input type="checkbox" class="switcher-input" name="notify-updates" <c:if test="${user.isNotifyUpdates()}">checked</c:if>>
                                                    <span class="switcher-indicator">
                                                        <span class="switcher-yes"></span>
                                                        <span class="switcher-no"></span>
                                                    </span>
                                                    <span class="switcher-label">Weekly product updates</span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="text-right mt-3">
                        <button type="submit" class="btn btn-primary">Save changes</button>&nbsp;
                        <a href="." class="btn btn-outline-white">Cancel</a>
                    </div>

                </div>
            </form>
        </section>
    </body>
    <script src="js/file-upload.js"></script>

    <!-- MDB -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.1.0/mdb.min.js"></script>
</html>