<%-- 
    Document   : signin
    Created on : Jun 2, 2022, 4:11:36 PM
    Author     : yuyu2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hanime</title>

        <!-- link css -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/web-form.css">
    </head>
    <body>
        <!-- web content -->
    <hanime-body>
        <form class="web__form" method="post" autocomplete="off" id="signin-form">
            <object data="assets/frog.svg" width="200"></object>

            <h1>Đăng Nhập</h1>

            <div class="web__form__input">
                <input type="text" name="username" id="username" onchange="webFormInputNotEmpty(this)" required>
                <label for="username">Tên đăng nhập</label>
            </div>

            <div class="web__form__input">
                <input type="password" name="password" id="password" onchange="webFormInputNotEmpty(this)" pattern="\S{8,}" required>
                <label for="password">Mật khẩu</label>
            </div>
            
            <button type="submit">Đăng nhập</button>
            <span>Chưa có tài khoản? <a href="signup">Đăng Kí</a></span>

        </form>
    </hanime-body>

    <!-- web header -->
    <%@include file="components/header.jsp" %>
</body>
<script src="js/web-form.js"></script>
</html>