
<%@page import="models.NotificationModel"%>
<%@page import="models.AuthModel"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entities.User"%>
<%@page import="models.CategoryModel"%>
<%@page import="utilities.Authentication"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%
    String token = Authentication.getTokenFromCookies(request.getCookies());
    User user = null;
    try {
        user = Authentication.getUserInformationByToken(token);

        request.setAttribute("topNotis", new NotificationModel().getByUserID(user.getId(), 5));
        request.setAttribute("isAdmin", new AuthModel().isAdmin(user.getId()));
        request.setAttribute("user", user);
    } catch (Exception e) {
        System.err.print(e);
    }

    request.setAttribute("categories", new CategoryModel().getall());

%>

<div class="hanime-nav-bar__overlay"></div>

<header class="hanime-header d-flex align-items-center justify-content-between">
    <div class="d-flex align-items-center">
        <div class="hanime-header__nav-bar-btn">
            <i class="fa-solid fa-bars fa-2xl hanime-header__nav-bar-btn--icon"></i>
        </div>

        <a class="hanime-header__logo" style="width: 120px" href=".">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76 16" style="width: 100%">
                <path style="fill: red;"  d="M12,2V16H10a2,2,0,0,1-2-2V10H4v6H2a2,2,0,0,1-2-2V0H2a2,2,0,0,0,.59,1.41A2,2,0,0,0,4,2V6H8V0h2a2,2,0,0,0,.59,1.41A2,2,0,0,0,12,2Z"/>
                <path style="fill: #fff;" d="M24.59,1.41A2,2,0,0,1,24,0H16a2,2,0,0,0-1.41.59A2,2,0,0,0,14,2V14a2,2,0,0,0,2,2h2V10h4v4a2,2,0,0,0,2,2h2V2A2,2,0,0,1,24.59,1.41ZM22,4a2,2,0,0,1-2,2H18V4a2,2,0,0,1,2-2h0a2,2,0,0,1,2,2Z"/>
                <path style="fill: #fff;" d="M37,5a3.42,3.42,0,0,0-2.42-1H30a2,2,0,0,0-2,2h0v8h0a2,2,0,0,0,2,2h1V9h0a2,2,0,0,1,2-2h0a2,2,0,0,1,2,2h0v5a2,2,0,0,0,2,2h1V7.42A3.42,3.42,0,0,0,37,5Z"/>
                <rect style="fill: #fff;" x="40" width="4" height="4" rx="2"/>
                <rect style="fill: #fff;" x="40" y="5" width="4" height="11" rx="2"/>
                <path style="fill: #fff;" d="M63,7.42V16H62a2,2,0,0,1-2-2V9a2,2,0,0,0-4,0v7H55a2,2,0,0,1-2-2V9a2,2,0,0,0-4,0v7H48a2,2,0,0,1-2-2V6a2,2,0,0,1,2-2h4.58A3.41,3.41,0,0,1,54,4.29,2,2,0,0,1,55,4h4.58A3.41,3.41,0,0,1,63,7.42Z"/>
                <path style="fill: #fff;" d="M76,6.4a2.2,2.2,0,0,0-.81-1.69A2.87,2.87,0,0,0,73.25,4h-5.5A2.6,2.6,0,0,0,65,6.4v7.2a2.2,2.2,0,0,0,.81,1.69,2.87,2.87,0,0,0,1.94.71h5.5a2.87,2.87,0,0,0,1.94-.71A2.2,2.2,0,0,0,76,13.6H70.5a2.87,2.87,0,0,1-1.94-.71l-.13-.12a2.06,2.06,0,0,1-.42-.56,2.08,2.08,0,0,1-.26-1H76ZM71.88,8.8A1.3,1.3,0,0,1,70.5,7.6a1.39,1.39,0,0,1,2.75,0A1.3,1.3,0,0,1,71.88,8.8Z"/>
                <path style="fill: #ff765f;" d="M76,12.66c0,.06-.06.12-.16.17a.89.89,0,0,1-.38.07,1,1,0,0,1-.39-.07.92.92,0,0,0-.38-.07,1,1,0,0,0-.39.07.89.89,0,0,1-.38.07,1,1,0,0,1-.39-.07,1.07,1.07,0,0,0-.76,0,1,1,0,0,1-.39.07.89.89,0,0,1-.38-.07,1,1,0,0,0-.39-.07.92.92,0,0,0-.38.07,1,1,0,0,1-.39.07.89.89,0,0,1-.38-.07.89.89,0,0,0-.38-.07,1,1,0,0,0-.39.07,1,1,0,0,1-.39.07.89.89,0,0,1-.38-.07,1,1,0,0,0-.49-.06,2.06,2.06,0,0,1-.42-.56l.14,0a1,1,0,0,1,.39-.07.89.89,0,0,1,.38.07.89.89,0,0,0,.38.07,1,1,0,0,0,.39-.07,1,1,0,0,1,.39-.07.89.89,0,0,1,.38.07.89.89,0,0,0,.38.07,1,1,0,0,0,.39-.07.92.92,0,0,1,.38-.07,1,1,0,0,1,.39.07.89.89,0,0,0,.38.07,1,1,0,0,0,.39-.07,1.07,1.07,0,0,1,.76,0,1,1,0,0,0,.39.07.89.89,0,0,0,.38-.07,1,1,0,0,1,.77,0l.39.16.38.17C75.94,12.54,76,12.6,76,12.66Z"/>
            </svg>
        </a>
    </div>

    <form class="hanime-header__search-bar" action="search">
        <input type="text" name="q" value="${searchQueryString}" class="hanime-header__search-bar--input" placeholder="Search" />
        <button type="submit" class="hanime-header__search-bar--button">
            <i class="fa-solid fa-magnifying-glass"></i>
        </button>
    </form>

    <div class="d-flex align-items-center">
        <c:if test="${user != null}">
            <div class="hanime-header__notification">
                <a class="dropdown" role="button" href="#" data-mdb-toggle="dropdown" aria-expanded="false">
                    <i class="fa-solid fa-bell"></i>
                    <div class="hanime-header__notification--dot"></div>
                </a>

                <div class="dropdown-menu dropdown-menu-dark p-2" style="width: 300px">
                    <c:forEach items="${topNotis}" var="notification">
                        <a href="${notification.getNavLink()}" class="dropdown-item rounded" data-mdb-toggle="tooltip" data-mdb-original-title="<c:out value="${notification.getContent()}"/>">
                            <h6 class="fw-normal mb-0 text-truncate"><c:out value="${notification.getContent()}"/></h6>
                            <small>${notification.getTime().toGMTString()}</small>
                        </a>
                    </c:forEach>
                    <c:if test="${topNotis.size() > 0}">
                        <hr class="dropdown-divider"/>
                    </c:if>
                    <a href="notification" class="dropdown-item text-center rounded">See all notifications</a>
                </div>
            </div>

            <div class="hanime-header__account">
                <a class="dropdown" role="button" href="#" data-mdb-toggle="dropdown" aria-expanded="false">
                    <img src="${user.getAvatarUrl()}"
                         alt="avatar" width="30" height="30" class="rounded-circle" style="object-fit: cover; object-position: center;">
                </a>

                <div class="dropdown-menu dropdown-menu-dark p-2">
                    <a href="setting" class="dropdown-item rounded">
                        <i class="fa-solid fa-cog"></i>
                        <span>Setting</span>
                    </a>

                    <c:if test="${isAdmin}">
                        <a href="admin" class="dropdown-item rounded">
                            <i class="fa-solid fa-crown"></i>
                            <span>Admin pages</span>
                        </a>    
                    </c:if>

                    <hr class="dropdown-divider"/>

                    <a href="signout" class="dropdown-item rounded">
                        <i class="fa-solid fa-sign-out-alt"></i>
                        <span>Logout</span>
                    </a>
                </div>
            </div>
        </div>
    </c:if>
</div>
</header>

<nav class="hanime-nav-bar" data-button-class="hanime-header__nav-bar-btn">
    <div class="hanime-nav-bar__nav-btn-and-logo d-flex align-items-center">
        <div class="hanime-header__nav-bar-btn">
            <i class="fa-solid fa-bars fa-2xl hanime-header__nav-bar-btn--icon"></i>
        </div>

        <a class="hanime-header__logo" style="width: 120px" href=".">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76 16" style="width: 100%">
                <path style="fill: red;"  d="M12,2V16H10a2,2,0,0,1-2-2V10H4v6H2a2,2,0,0,1-2-2V0H2a2,2,0,0,0,.59,1.41A2,2,0,0,0,4,2V6H8V0h2a2,2,0,0,0,.59,1.41A2,2,0,0,0,12,2Z"/>
                <path style="fill: #fff;" d="M24.59,1.41A2,2,0,0,1,24,0H16a2,2,0,0,0-1.41.59A2,2,0,0,0,14,2V14a2,2,0,0,0,2,2h2V10h4v4a2,2,0,0,0,2,2h2V2A2,2,0,0,1,24.59,1.41ZM22,4a2,2,0,0,1-2,2H18V4a2,2,0,0,1,2-2h0a2,2,0,0,1,2,2Z"/>
                <path style="fill: #fff;" d="M37,5a3.42,3.42,0,0,0-2.42-1H30a2,2,0,0,0-2,2h0v8h0a2,2,0,0,0,2,2h1V9h0a2,2,0,0,1,2-2h0a2,2,0,0,1,2,2h0v5a2,2,0,0,0,2,2h1V7.42A3.42,3.42,0,0,0,37,5Z"/>
                <rect style="fill: #fff;" x="40" width="4" height="4" rx="2"/>
                <rect style="fill: #fff;" x="40" y="5" width="4" height="11" rx="2"/>
                <path style="fill: #fff;" d="M63,7.42V16H62a2,2,0,0,1-2-2V9a2,2,0,0,0-4,0v7H55a2,2,0,0,1-2-2V9a2,2,0,0,0-4,0v7H48a2,2,0,0,1-2-2V6a2,2,0,0,1,2-2h4.58A3.41,3.41,0,0,1,54,4.29,2,2,0,0,1,55,4h4.58A3.41,3.41,0,0,1,63,7.42Z"/>
                <path style="fill: #fff;" d="M76,6.4a2.2,2.2,0,0,0-.81-1.69A2.87,2.87,0,0,0,73.25,4h-5.5A2.6,2.6,0,0,0,65,6.4v7.2a2.2,2.2,0,0,0,.81,1.69,2.87,2.87,0,0,0,1.94.71h5.5a2.87,2.87,0,0,0,1.94-.71A2.2,2.2,0,0,0,76,13.6H70.5a2.87,2.87,0,0,1-1.94-.71l-.13-.12a2.06,2.06,0,0,1-.42-.56,2.08,2.08,0,0,1-.26-1H76ZM71.88,8.8A1.3,1.3,0,0,1,70.5,7.6a1.39,1.39,0,0,1,2.75,0A1.3,1.3,0,0,1,71.88,8.8Z"/>
                <path style="fill: #ff765f;" d="M76,12.66c0,.06-.06.12-.16.17a.89.89,0,0,1-.38.07,1,1,0,0,1-.39-.07.92.92,0,0,0-.38-.07,1,1,0,0,0-.39.07.89.89,0,0,1-.38.07,1,1,0,0,1-.39-.07,1.07,1.07,0,0,0-.76,0,1,1,0,0,1-.39.07.89.89,0,0,1-.38-.07,1,1,0,0,0-.39-.07.92.92,0,0,0-.38.07,1,1,0,0,1-.39.07.89.89,0,0,1-.38-.07.89.89,0,0,0-.38-.07,1,1,0,0,0-.39.07,1,1,0,0,1-.39.07.89.89,0,0,1-.38-.07,1,1,0,0,0-.49-.06,2.06,2.06,0,0,1-.42-.56l.14,0a1,1,0,0,1,.39-.07.89.89,0,0,1,.38.07.89.89,0,0,0,.38.07,1,1,0,0,0,.39-.07,1,1,0,0,1,.39-.07.89.89,0,0,1,.38.07.89.89,0,0,0,.38.07,1,1,0,0,0,.39-.07.92.92,0,0,1,.38-.07,1,1,0,0,1,.39.07.89.89,0,0,0,.38.07,1,1,0,0,0,.39-.07,1.07,1.07,0,0,1,.76,0,1,1,0,0,0,.39.07.89.89,0,0,0,.38-.07,1,1,0,0,1,.77,0l.39.16.38.17C75.94,12.54,76,12.6,76,12.66Z"/>
            </svg>
        </a>
    </div>

    <div class="hanime-nav-bar__choices">
        <a href="." class="hanime-nav-bar__link">
            <i class="fa-solid fa-home"></i>
            <span>Home</span>
        </a>

        <a class="hanime-nav-bar__link position-relative" onmousedown="toggleCategory()">
            <i class="fa-solid fa-list"></i>
            <span>Category</span>

            <i class="fa-solid fa-caret-down" style="position: absolute; right: 0;"></i>
        </a>

        <div class="hanime-nav-bar__category">
            <c:forEach var="category" items="${categories}">
                <a href="category?id=<c:out value="${category.getId()}"></c:out>" class="hanime-nav-bar__category--link">
                    <c:out value="${category.getName()}"></c:out>
                    </a>
            </c:forEach>
        </div>

        <c:if test="${user != null}">
            <a href="setting" class="hanime-nav-bar__link">
                <i class="fa-solid fa-cog"></i>
                <span>Setting</span>
            </a>

            <c:if test="${isAdmin}">
                <a href="admin" class="hanime-nav-bar__link">
                    <i class="fa-solid fa-crown"></i>
                    <span>Admin pages</span>
                </a>    
            </c:if>
        </c:if>
        <hr>

            <% if (user == null) { %>
            <a href="signin" class="hanime-nav-bar__link">
                <i class="fa-solid fa-right-to-bracket"></i>
                <span>Login</span>
            </a>

            <a href="signup" class="hanime-nav-bar__link">
                <i class="fa-solid fa-user-plus"></i>
                <span>Register</span>
            </a>
            <% } else { %>
            <a href="signout" class="hanime-nav-bar__link">
                <i class="fa-solid fa-sign-out-alt"></i>
                <span>Logout</span>
            </a>
            <% }%>
    </div>
</nav>

<script src="js/nav-bar.js"></script>