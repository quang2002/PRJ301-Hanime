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

                                    <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Forgot Password</p>

                                    <form class="mx-1 mx-md-4" method="post">

                                        <div class="d-flex flex-row align-items-center mb-4">

                                            <div class="form-outline flex-fill mb-0">
                                                <input type="text" id="username" class="form-control" name="username"
                                                       autocomplete="off" pattern="\S{8,}" required />
                                                <label class="form-label" for="username" data-error="Your Text"
                                                       data-success="right">Username</label>
                                                <i class="fas fa-user fa-lg me-3 fa-fw trailing"></i>
                                            </div>
                                        </div>

                                        <div class="g-recaptcha d-flex justify-content-center m-4"
                                             data-sitekey="<%= GlobalConstants.GOOGLE_RECAPTCHA_SITE_KEY%>"></div>

                                        <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                            <button type="submit" class="btn btn-primary btn-lg">SEND EMAIL</button>
                                        </div>

                                    </form>
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

        <!-- Recaptcha -->                                     
        <script src="js/recaptcha.js"></script>

        <!-- MDB -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.1.0/mdb.min.js"></script>
    </body>
</html>