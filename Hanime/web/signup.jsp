<%-- 
    Document   : signup
    Created on : Jun 11, 2022, 4:03:26 AM
    Author     : yuyu2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="utilities.GlobalConstants" %>
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

        <!-- Recaptcha -->
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    </head>

    <body>
        <%@include file="components/header.jsp" %>
        <hr class="hanime-hr">
        <section class="hanime-body">
            <div class="hanime-responsive-form">
                <div class="container">
                    <div class="card text-black" style="border-radius: 25px;">
                        <div class="card-body p-md-5">
                            <div class="row justify-content-center">
                                <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                                    <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign up</p>

                                    <form class="mx-1 mx-md-4" id="hanime-signup-form" method="post"
                                          oninput="repassword.setCustomValidity(repassword.value !== password.value ? 'Confirm password does not match': '')">

                                        <div class="d-flex flex-row align-items-center mb-4">
                                            <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                                            <div class="form-outline flex-fill mb-0">
                                                <input type="text" id="username" class="form-control" name="username"
                                                       autocomplete="off" required />
                                                <label class="form-label" for="username" data-error="Your Text"
                                                       data-success="right">Username</label>
                                            </div>
                                        </div>

                                        <div class="d-flex flex-row align-items-center mb-4">
                                            <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                                            <div class="form-outline flex-fill mb-0">
                                                <input type="email" id="email" class="form-control" name="email" required />
                                                <label class="form-label" for="email">Your Email</label>
                                            </div>
                                        </div>

                                        <div class="d-flex flex-row align-items-center mb-4">
                                            <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                                            <div class="form-outline flex-fill mb-0">
                                                <input type="password" id="password" class="form-control" name="password"
                                                       required pattern="\S{8,}"/>
                                                <label class="form-label" for="password">Password</label>
                                            </div>
                                        </div>

                                        <div class="d-flex flex-row align-items-center mb-4">
                                            <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                                            <div class="form-outline flex-fill mb-0">
                                                <input type="password" id="repassword" class="form-control" required />
                                                <label class="form-label" for="repassword">Repeat your
                                                    password</label>
                                            </div>
                                        </div>

                                        <div class="btn-group d-flex flex-row align-items-center mb-4">
                                            <input type="radio" class="btn-check" name="gender" id="gender-female"
                                                   autocomplete="off" value="female" checked />
                                            <label class="btn btn-light" for="gender-female">
                                                Female <i class="fa-solid fa-venus"></i>
                                            </label>

                                            <input type="radio" class="btn-check" name="gender" id="gender-male"
                                                   autocomplete="off" value="male" />
                                            <label class="btn btn-light" for="gender-male">
                                                Male <i class="fa-solid fa-mars"></i>
                                            </label>
                                        </div>

                                        <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                            <button type="button" class="btn btn-primary btn-lg"
                                                    onclick="formSubmit()">Register</button>

                                            <div class="g-recaptcha" data-sitekey="<%= GlobalConstants.GOOGLE_RECAPTCHA_SITE_KEY%>"
                                                 data-size="invisible" data-callback="onSubmit"></div>
                                        </div>

                                    </form>

                                    <span class="d-flex justify-content-center">
                                        Already have an account? <a href="signin">Sign in</a>
                                    </span>
                                </div>
                                <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
                                    <img src="assets/signup-image.jpg" class="img-fluid rounded">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>

    <script>
        function onSubmit() {
            document.getElementById('hanime-signup-form').submit();
        }

        function formSubmit() {
            const form = document.getElementById('hanime-signup-form');
            if (form.checkValidity()) {
                grecaptcha.execute();
            } else {
                form.reportValidity();
            }
        }
    </script>
    <!-- MDB -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.1.0/mdb.min.js"></script>
</html>