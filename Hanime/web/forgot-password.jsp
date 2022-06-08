<%-- 
    Document   : forgot-password
    Created on : Jun 7, 2022, 1:16:20 AM
    Author     : yuyu2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="utilities.GlobalConstants"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hanime</title>

        <!-- link css -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/web-form.css">

        <!-- reCaptcha -->
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    </head>
    <body>
        <!-- web content -->
    <hanime-body>
        <form class="web__form" method="post" autocomplete="off">
            <object data="assets/frog.svg" width="200"></object>

            <h1>Quên Mật Khẩu</h1>

            <div class="web__form__input">
                <input type="text" name="username" id="username" onchange="webFormInputNotEmpty(this)" required>
                <label for="username">Tên đăng nhập</label>
            </div>

            <div class="g-recaptcha" data-sitekey="<%= GlobalConstants.GOOGLE_RECAPTCHA_SITE_KEY %>"></div>

            <button type="submit">Nhận mail khôi phục</button>
        </form>
    </hanime-body>

    <script>
        window.onload = () => {
            document.getElementById("g-recaptcha-response").required = true;
        };
    </script>

    <!-- web header -->
    <%@include file="components/header.jsp" %>
</body>
<script src="js/web-form.js"></script>
</html>