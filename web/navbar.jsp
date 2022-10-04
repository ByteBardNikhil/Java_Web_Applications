

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NavBar</title>
    
    </head>
    <body>
        <!--
        Navbar start
    -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
        <a class="navbar-brand" href="#"><i class="fa-solid fa-tower-broadcast"></i> Our Tech Blog</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp"><i class="fa-solid fa-house-chimney"></i> Home <span
                            class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa-solid fa-square-check"></i> Categories
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Programming Languages</a>
                        <a class="dropdown-item" href="#">Project Implementation</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">More..</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="#" tabindex="-1" aria-disabled="true"><i
                            class="fa-solid fa-address-book"></i> Contact Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="LoginPage.jsp" tabindex="-1" aria-disabled="true">
                        <i class="fa-solid fa-user"></i>  <b>Login</b></a>
                </li>
                   <li class="nav-item">
                       <a class="nav-link " href="Registration_Page.jsp" tabindex="-1" aria-disabled="true">
                        <i class="fa-solid fa-user-plus"></i>  <b>Sign Up</b></a>
                </li>
               
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>
    <!--
    NavBAr ENds
-->
    </body>
</html>
