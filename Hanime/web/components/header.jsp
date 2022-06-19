<%-- 
    Document   : header
    Created on : May 31, 2022, 12:46:08 AM
    Author     : yuyu2
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="models.CategoryModel"%>
<%@page import="entities.User"%>
<%@page import="models.CategoryModel"%>
<%@page import="utilities.Authentication"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%
    String token = Authentication.getTokenFromCookies(request.getCookies());
    User user = null;
    try {
        user = Authentication.getUserInformationByToken(token);
    } catch (Exception e) {
        System.err.print(e);
    }

    request.setAttribute("user", user);
%>

<%
    request.setAttribute("categories", new CategoryModel().getall());
%>

<div class="hanime-nav-bar__overlay"></div>

<header class="hanime-header d-flex align-items-center justify-content-between">
    <div class="d-flex align-items-center">
        <div class="hanime-header__nav-bar-btn">
            <i class="fa-solid fa-bars fa-2xl hanime-header__nav-bar-btn--icon"></i>
        </div>

        <div class="hanime-header__logo">
            <object data="assets/logo.svg" width="120"></object>
        </div>
    </div>

    <div class="hanime-header__search-bar">
        <input type="text" name="q" value="" class="hanime-header__search-bar--input" placeholder="Search" />
        <div class="hanime-header__search-bar--button">
            <i class="fa-solid fa-magnifying-glass"></i>
        </div>
    </div>

    <div class="d-flex align-items-center">
        <% if (user != null) {%>
        <div class="hanime-header__notification">
            <i class="fa-solid fa-bell"></i>
            <div class="hanime-header__notification--dot"></div>
        </div>

        <div class="hanime-header__account">
            <img src="${user.getAvatarUrl()}"
                 alt="avatar" width="30" height="30" class="rounded-circle" style="object-fit: cover; object-position: center;">
        </div>
        <% } %>
    </div>
</header>

<nav class="hanime-nav-bar" data-button-class="hanime-header__nav-bar-btn">
    <div class="hanime-nav-bar__nav-btn-and-logo d-flex align-items-center">
        <div class="hanime-header__nav-bar-btn">
            <i class="fa-solid fa-bars fa-2xl hanime-header__nav-bar-btn--icon"></i>
        </div>

        <div class="hanime-header__logo">
            <object data="assets/logo.svg" width="120"></object>
        </div>
    </div>

    <div class="hanime-nav-bar__choices">
        <a href="." class="hanime-nav-bar__link">
            <i class="fa-solid fa-home"></i>
            <span>Trang chủ</span>
        </a>

        <a class="hanime-nav-bar__link position-relative" onmousedown="toggleCategory()">
            <i class="fa-solid fa-list"></i>
            <span>Thể loại</span>

            <i class="fa-solid fa-caret-down" style="position: absolute; right: 0;"></i>
        </a>

        <div class="hanime-nav-bar__category">
            <c:forEach var="category" items="${categories}">
                <a href="category?id=<c:out value="${category.getId()}"></c:out>" class="hanime-nav-bar__category--link">
                    <c:out value="${category.getName()}"></c:out>
                </a>
            </c:forEach>
        </div>

        <% if (user != null) { %>
        <a href="setting" class="hanime-nav-bar__link">
            <i class="fa-solid fa-cog"></i>
            <span>Cài đặt</span>
        </a>
        <% } %>
        <hr>

        <% if (user == null) { %>
        <a href="signin" class="hanime-nav-bar__link">
            <i class="fa-solid fa-right-to-bracket"></i>
            <span>Đăng nhập</span>
        </a>

        <a href="signup" class="hanime-nav-bar__link">
            <i class="fa-solid fa-user-plus"></i>
            <span>Đăng ký</span>
        </a>
        <% } else { %>
        <a href="signout" class="hanime-nav-bar__link">
            <i class="fa-solid fa-sign-out-alt"></i>
            <span>Đăng xuất</span>
        </a>
        <% }%>
    </div>
</nav>

<script src="js/nav-bar.js"></script>