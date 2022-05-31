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
    </head>
    <body>
        <!-- web header -->
        <%@include file="components/header.jsp" %>

        <!-- web content -->
        <div>
            <form method="POST" autocomplete="off">
                <input name="username" placeholder="Username"><br>
                <input name="password" placeholder="Password"><br>
                <input name="email" placeholder="Email" type="email"><br>
                <select name="gender">
                    <option value="m" selected>Male</option>
                    <option value="f">Female</option>
                </select>
                
                <button type="submit">Submit</button>
            </form>
        </div>
    </body>
</html>