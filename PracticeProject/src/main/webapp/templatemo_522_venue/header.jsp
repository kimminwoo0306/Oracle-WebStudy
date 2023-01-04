<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="wrap">
        <header id="header">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <button id="primary-nav-button" type="button">Menu</button>
                        <a href="index.html"><div class="logo">
                            <img src="img/logo.png" alt="Venue Logo">
                        </div></a>
                        <nav id="primary-nav" class="dropdown cf">
                            <ul class="dropdown menu">
                                <li class='active'><a href="#">Popular</a></li>
                                <li><a href="#">Most Visited</a>
                                    <ul class="sub-menu">
                                        <li><a href="#">Most Visited 1</a>
                                            <ul class="sub-menu">
                                                <li><a href="#">Sub Visited Menu 1</a></li>
                                                <li><a href="#">Sub Visited Two</a></li>
                                                <li><a href="#">Sub Visited Menu 3</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Most Visited 2</a>
                                            <ul class="sub-menu">
                                                <li><a href="#">Sub Visited Menu 4</a></li>
                                                <li><a href="#">Sub Visited Five</a></li>
                                                <li><a href="#">Sub Visited Menu 6</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Most Visited 3</a>
                                            <ul class="sub-menu">
                                                <li><a href="#">Sub Visited Menu 7</a></li>
                                                <li><a href="#">Sub Visited #8</a></li>
                                                <li><a href="#">Sub Visited Menu 9</a></li>
                                                <li><a href="#">Sub Visited #10</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a class="scrollTo" data-scrollTo="blog" href="#">Blog Entries</a></li>
                                <li><a class="scrollTo" data-scrollTo="services" href="#">Our Services</a></li>
                                <li><a class="scrollTo" data-scrollTo="contact" href="#">Contact Us</a></li>
                            </ul>
                        </nav><!-- / #primary-nav -->
                    </div>
                </div>
            </div>
        </header>
    </div>
</body>
</html>