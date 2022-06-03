<%-- 
    Document   : signup
    Created on : May 31, 2022, 12:47:27 AM
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
        <form class="web__form" method="post" autocomplete="off" id="signup-form">
            <object data="assets/frog.svg" width="200"></object>

            <h1>Đăng Kí</h1>

            <div class="web__form__input">
                <input type="text" name="username" id="username" onchange="webFormInputNotEmpty(this)" required>
                <label for="username">Tên đăng nhập</label>
            </div>

            <div class="web__form__input">
                <input type="password" name="password" id="password" onchange="webFormInputNotEmpty(this)" pattern="\S{8,}" required>
                <label for="password">Mật khẩu</label>
            </div>

            <div class="web__form__input">
                <input type="password" id="re-password" onchange="webFormInputNotEmpty(this)" required>
                <label for="re-password">Nhập lại mật khẩu</label>
            </div>

            <div class="web__form__input">
                <input type="email" name="email" id="email" 
                    pattern="[A-Za-z][\d\w]+@[\d\w]{2,5}(.*[\d\w]{2,5}){1,3}" 
                    onchange="webFormInputNotEmpty(this)" 
                    required>
                <label for="email">Email</label>
            </div>

            <!-- gender radio -->
            <div class="web__form__radio">
                <h3 style="text-align: center; padding: 10px 0;">Chọn giới tính của bạn</h3>

                <label>
                    <input type="radio" name="gender" value="m" checked onchange="">
                    <div style="background-image: url('https://i.pinimg.com/236x/06/ad/9d/06ad9d293dac0b2ef6f3bef2d8f38c5f.jpg');"></div>
                </label>

                <label>
                    <input type="radio" name="gender" value="f">
                    <div style="background-image: url('https://i.pinimg.com/474x/99/95/3b/99953bbd0978363f62d4b1acf5a67fe1.jpg');"></div>
                </label>
            </div>

            <button type="submit">Đăng kí</button>
            <span>Đã có tài khoản? <a href="signin">Đăng Nhập</a></span>

        </form>
    </hanime-body>

    <!-- web header -->
    <%@include file="components/header.jsp" %>
</body>
<script src="js/web-form.js"></script>
</html>