<%-- 
    Document   : header
    Created on : May 31, 2022, 12:46:08 AM
    Author     : yuyu2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="utilities.TokenGenerator"%>
<% 
    final String contextPath = request.getContextPath();
    
    boolean isLogin = false;

    if (request.getCookies() != null) {
        for (Cookie cookie : request.getCookies()) {
            if (cookie.getName().equals("token")) {
                isLogin = TokenGenerator.validCheck(cookie.getValue());
                break;
            }
        }
    }
%>
<head>
    <link rel="stylesheet" href="css/web-header.css" />
    <link rel="stylesheet" href="css/web-nav-bar.css" />

    <script src="https://kit.fontawesome.com/9ad676b753.js" crossorigin="anonymous"></script>
</head>
<header class="web__header">
    <div style="display: flex; align-items: center; height: 44px;">
        <nav-bar-btn onclick="toggleNavBar()">
            <div></div>
            <div></div>
            <div></div>
        </nav-bar-btn>

        <nav-bar-component style="margin-left: -400px;">
            <nav-bar-logo>
                <div>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76 16">
                        <defs>
                            <style>
                                .cls-1 {
                                    fill: red;
                                }

                                .cls-2 {
                                    fill: #fff;
                                }

                                .cls-3 {
                                    fill: #ff765f;
                                }
                            </style>
                        </defs>
                        <path class="cls-1"
                              d="M12,2V16H10a2,2,0,0,1-2-2V10H4v6H2a2,2,0,0,1-2-2V0H2a2,2,0,0,0,.59,1.41A2,2,0,0,0,4,2V6H8V0h2a2,2,0,0,0,.59,1.41A2,2,0,0,0,12,2Z" />
                        <path class="cls-2"
                              d="M24.59,1.41A2,2,0,0,1,24,0H16a2,2,0,0,0-1.41.59A2,2,0,0,0,14,2V14a2,2,0,0,0,2,2h2V10h4v4a2,2,0,0,0,2,2h2V2A2,2,0,0,1,24.59,1.41ZM22,4a2,2,0,0,1-2,2H18V4a2,2,0,0,1,2-2h0a2,2,0,0,1,2,2Z" />
                        <path class="cls-2"
                              d="M37,5a3.42,3.42,0,0,0-2.42-1H30a2,2,0,0,0-2,2h0v8h0a2,2,0,0,0,2,2h1V9h0a2,2,0,0,1,2-2h0a2,2,0,0,1,2,2h0v5a2,2,0,0,0,2,2h1V7.42A3.42,3.42,0,0,0,37,5Z" />
                        <rect class="cls-2" x="40" width="4" height="4" rx="2" />
                        <rect class="cls-2" x="40" y="5" width="4" height="11" rx="2" />
                        <path class="cls-2"
                              d="M63,7.42V16H62a2,2,0,0,1-2-2V9a2,2,0,0,0-4,0v7H55a2,2,0,0,1-2-2V9a2,2,0,0,0-4,0v7H48a2,2,0,0,1-2-2V6a2,2,0,0,1,2-2h4.58A3.41,3.41,0,0,1,54,4.29,2,2,0,0,1,55,4h4.58A3.41,3.41,0,0,1,63,7.42Z" />
                        <path class="cls-2"
                              d="M76,6.4a2.2,2.2,0,0,0-.81-1.69A2.87,2.87,0,0,0,73.25,4h-5.5A2.6,2.6,0,0,0,65,6.4v7.2a2.2,2.2,0,0,0,.81,1.69,2.87,2.87,0,0,0,1.94.71h5.5a2.87,2.87,0,0,0,1.94-.71A2.2,2.2,0,0,0,76,13.6H70.5a2.87,2.87,0,0,1-1.94-.71l-.13-.12a2.06,2.06,0,0,1-.42-.56,2.08,2.08,0,0,1-.26-1H76ZM71.88,8.8A1.3,1.3,0,0,1,70.5,7.6a1.39,1.39,0,0,1,2.75,0A1.3,1.3,0,0,1,71.88,8.8Z" />
                        <path class="cls-3"
                              d="M76,12.66c0,.06-.06.12-.16.17a.89.89,0,0,1-.38.07,1,1,0,0,1-.39-.07.92.92,0,0,0-.38-.07,1,1,0,0,0-.39.07.89.89,0,0,1-.38.07,1,1,0,0,1-.39-.07,1.07,1.07,0,0,0-.76,0,1,1,0,0,1-.39.07.89.89,0,0,1-.38-.07,1,1,0,0,0-.39-.07.92.92,0,0,0-.38.07,1,1,0,0,1-.39.07.89.89,0,0,1-.38-.07.89.89,0,0,0-.38-.07,1,1,0,0,0-.39.07,1,1,0,0,1-.39.07.89.89,0,0,1-.38-.07,1,1,0,0,0-.49-.06,2.06,2.06,0,0,1-.42-.56l.14,0a1,1,0,0,1,.39-.07.89.89,0,0,1,.38.07.89.89,0,0,0,.38.07,1,1,0,0,0,.39-.07,1,1,0,0,1,.39-.07.89.89,0,0,1,.38.07.89.89,0,0,0,.38.07,1,1,0,0,0,.39-.07.92.92,0,0,1,.38-.07,1,1,0,0,1,.39.07.89.89,0,0,0,.38.07,1,1,0,0,0,.39-.07,1.07,1.07,0,0,1,.76,0,1,1,0,0,0,.39.07.89.89,0,0,0,.38-.07,1,1,0,0,1,.77,0l.39.16.38.17C75.94,12.54,76,12.6,76,12.66Z" />
                    </svg>
                </div>
            </nav-bar-logo>

            <a href="<%= contextPath %>">
                <i class="fa-solid fa-house"></i>
                <span>Trang chủ</span>
            </a>

            <a onpointerdown="toggleSelectType()" id="select-type">
                <i class="fa-solid fa-list"></i>
                <span>Thể loại</span>

                <i style="float: right;" class="fa-solid"></i>
            </a>

            <div id="select-type-items">
                <a href="">Drama</a>
                <a href="">Comedy</a>
                <a href="">Action</a>
                <a href="">Adventure</a>
                <a href="">Romance</a>
                <a href="">Horror</a>
                <a href="">Thriller</a>
                <a href="">Sci-Fi</a>
                <a href="">Documentary</a>
                <a href="">Animation</a>
                <a href="">Fantasy</a>
                <a href="">Family</a>
                <a href="">Mystery</a>
                <a href="">Crime</a>
                <a href="">History</a>
                <a href="">War</a>
                <a href="">Western</a>
                <a href="">Music</a>
                <a href="">Musical</a>
                <a href="">Sport</a>
                <a href="">News</a>
                <a href="">Short</a>
                <a href="">TV Movie</a>
                <a href="">TV Series</a>
                <a href="">TV Special</a>
                <a href="">TV Mini-Series</a>
                <a href="">Video</a>
                <a href="">Video Game</a>
            </div>

            <a href="<%= contextPath %>/trending">
                <i class="fa-solid fa-fire-flame-curved"></i>
                <span>Top lượt xem</span>
            </a>

            <hr>

            <%
                if (isLogin) {
            %>
                <a href="<%= contextPath %>/signout">
                    <i class="fa-solid fa-right-from-bracket"></i>
                    <span>Đăng xuất</span>
                </a>
            <%
                } else {
            %>
                <a href="<%= contextPath %>/signin">
                    <i class="fa-solid fa-right-to-bracket"></i>
                    <span>Đăng nhập</span>
                </a>

                <a href="<%= contextPath %>/signup">
                    <i class="fa-solid fa-user-plus"></i>
                    <span>Đăng kí</span>
                </a>
            <%
                }
            %>
        </nav-bar-component>

        <nav-bar-background onclick="toggleNavBar()" style="display: none;">

        </nav-bar-background>

        <div class="web__header__logo">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76 16">
                <defs>
                    <style>
                        .cls-1 {
                            fill: red;
                        }

                        .cls-2 {
                            fill: #fff;
                        }

                        .cls-3 {
                            fill: #ff765f;
                        }
                    </style>
                </defs>
                <path class="cls-1"
                      d="M12,2V16H10a2,2,0,0,1-2-2V10H4v6H2a2,2,0,0,1-2-2V0H2a2,2,0,0,0,.59,1.41A2,2,0,0,0,4,2V6H8V0h2a2,2,0,0,0,.59,1.41A2,2,0,0,0,12,2Z" />
                <path class="cls-2"
                      d="M24.59,1.41A2,2,0,0,1,24,0H16a2,2,0,0,0-1.41.59A2,2,0,0,0,14,2V14a2,2,0,0,0,2,2h2V10h4v4a2,2,0,0,0,2,2h2V2A2,2,0,0,1,24.59,1.41ZM22,4a2,2,0,0,1-2,2H18V4a2,2,0,0,1,2-2h0a2,2,0,0,1,2,2Z" />
                <path class="cls-2"
                      d="M37,5a3.42,3.42,0,0,0-2.42-1H30a2,2,0,0,0-2,2h0v8h0a2,2,0,0,0,2,2h1V9h0a2,2,0,0,1,2-2h0a2,2,0,0,1,2,2h0v5a2,2,0,0,0,2,2h1V7.42A3.42,3.42,0,0,0,37,5Z" />
                <rect class="cls-2" x="40" width="4" height="4" rx="2" />
                <rect class="cls-2" x="40" y="5" width="4" height="11" rx="2" />
                <path class="cls-2"
                      d="M63,7.42V16H62a2,2,0,0,1-2-2V9a2,2,0,0,0-4,0v7H55a2,2,0,0,1-2-2V9a2,2,0,0,0-4,0v7H48a2,2,0,0,1-2-2V6a2,2,0,0,1,2-2h4.58A3.41,3.41,0,0,1,54,4.29,2,2,0,0,1,55,4h4.58A3.41,3.41,0,0,1,63,7.42Z" />
                <path class="cls-2"
                      d="M76,6.4a2.2,2.2,0,0,0-.81-1.69A2.87,2.87,0,0,0,73.25,4h-5.5A2.6,2.6,0,0,0,65,6.4v7.2a2.2,2.2,0,0,0,.81,1.69,2.87,2.87,0,0,0,1.94.71h5.5a2.87,2.87,0,0,0,1.94-.71A2.2,2.2,0,0,0,76,13.6H70.5a2.87,2.87,0,0,1-1.94-.71l-.13-.12a2.06,2.06,0,0,1-.42-.56,2.08,2.08,0,0,1-.26-1H76ZM71.88,8.8A1.3,1.3,0,0,1,70.5,7.6a1.39,1.39,0,0,1,2.75,0A1.3,1.3,0,0,1,71.88,8.8Z" />
                <path class="cls-3"
                      d="M76,12.66c0,.06-.06.12-.16.17a.89.89,0,0,1-.38.07,1,1,0,0,1-.39-.07.92.92,0,0,0-.38-.07,1,1,0,0,0-.39.07.89.89,0,0,1-.38.07,1,1,0,0,1-.39-.07,1.07,1.07,0,0,0-.76,0,1,1,0,0,1-.39.07.89.89,0,0,1-.38-.07,1,1,0,0,0-.39-.07.92.92,0,0,0-.38.07,1,1,0,0,1-.39.07.89.89,0,0,1-.38-.07.89.89,0,0,0-.38-.07,1,1,0,0,0-.39.07,1,1,0,0,1-.39.07.89.89,0,0,1-.38-.07,1,1,0,0,0-.49-.06,2.06,2.06,0,0,1-.42-.56l.14,0a1,1,0,0,1,.39-.07.89.89,0,0,1,.38.07.89.89,0,0,0,.38.07,1,1,0,0,0,.39-.07,1,1,0,0,1,.39-.07.89.89,0,0,1,.38.07.89.89,0,0,0,.38.07,1,1,0,0,0,.39-.07.92.92,0,0,1,.38-.07,1,1,0,0,1,.39.07.89.89,0,0,0,.38.07,1,1,0,0,0,.39-.07,1.07,1.07,0,0,1,.76,0,1,1,0,0,0,.39.07.89.89,0,0,0,.38-.07,1,1,0,0,1,.77,0l.39.16.38.17C75.94,12.54,76,12.6,76,12.66Z" />
            </svg>
        </div>
    </div>

    <div class="web__header__searchbar">
        <form action="Hanime/search" method="get" id="search-bar" autocomplete="off">
            <input type="text" name="q" placeholder="Search">
        </form>
        <button onclick="document.getElementById('search-bar').submit();" style="width: 60px; height: 41px;">
            <svg viewBox="0 0 24 24" focusable="false"
                 style="pointer-events: none; display: block; width: 100%; height: 100%;">
                <path style="fill: white;"
                      d="M20.87,20.17l-5.59-5.59C16.35,13.35,17,11.75,17,10c0-3.87-3.13-7-7-7s-7,3.13-7,7s3.13,7,7,7c1.75,0,3.35-0.65,4.58-1.71 l5.59,5.59L20.87,20.17z M10,16c-3.31,0-6-2.69-6-6s2.69-6,6-6s6,2.69,6,6S13.31,16,10,16z">
                </path>
            </svg>
        </button>
    </div>

    <div class="web__header__account">


        <% if (isLogin) { %>
        <div style="width: 25px; height: 25px; cursor: pointer;">
            <svg viewBox="0 0 24 24" focusable="false"
                 style="pointer-events: none; display: block; width: 100%; height: 100%;">
                <path style="fill: white;"
                      d="M10,20h4c0,1.1-0.9,2-2,2S10,21.1,10,20z M20,17.35V19H4v-1.65l2-1.88v-5.15c0-2.92,1.56-5.22,4-5.98V3.96 c0-1.42,1.49-2.5,2.99-1.76C13.64,2.52,14,3.23,14,3.96l0,0.39c2.44,0.75,4,3.06,4,5.98v5.15L20,17.35z M19,17.77l-2-1.88v-5.47 c0-2.47-1.19-4.36-3.13-5.1c-1.26-0.53-2.64-0.5-3.84,0.03C8.15,6.11,7,7.99,7,10.42v5.47l-2,1.88V18h14V17.77z">
                </path>

            </svg>

            <hanime-notify-icon></hanime-notify-icon>
        </div>

        <hanime-account-icon>
            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/Circle-icons-gamecontroller.svg/2048px-Circle-icons-gamecontroller.svg.png" alt="" width="35" height="35">
        </hanime-account-icon>
        <% } else { %>
        <hanime-login-button>
            <a href="<%= contextPath %>/signin">
                <span>Login</span>
            </a>
        </hanime-login-button>
        <% }%>
    </div>
    <script src="js/nav-bar-btn.js"></script>
</header>