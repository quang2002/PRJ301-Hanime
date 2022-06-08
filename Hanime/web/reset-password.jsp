<%-- 
    Document   : change-password
    Created on : Jun 7, 2022, 2:59:38 AM
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
    </head>
    <body>
        <!-- web content -->
    <hanime-body>
        <form class="web__form" method="post" autocomplete="off">
            <!--object data="assets/frog.svg" width="200"></object-->

            <h1>Khôi phục mật khẩu</h1>

            <div class="web__form__input">
                <input type="password" name="password" id="password" onchange="webFormInputNotEmpty(this)" pattern="\S{8,}" required>
                <label for="password">Mật khẩu mới</label>
            </div>

            <input name="token" value="<%= request.getParameter("token") %>" hidden/>

            <button type="submit">Đổi mật khẩu</button>

        </form>
    </hanime-body>

    <!-- web header -->
    <%@include file="components/header.jsp" %>
</body>
<script src="js/web-form.js"></script>

</html>