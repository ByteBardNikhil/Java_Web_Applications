

<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.helper.DatabaseConnection" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main JSP Working Page</title>
        <!-- CSS only -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous"> <link href="CSS/myCSS.css" rel="stylesheet" type="text/css"/>

        <script src="https://kit.fontawesome.com/a3aff8e9ae.js" crossorigin="anonymous"></script>


    </head>
    <body>

        <!-- NavBar -->
        <%@include file="navbar.jsp" %>        

        <!-- NavBar end -->
        <!-- Banner -->
        <!--Banner Starts-->




        <div class="container-fluid ">
            <div class="jumbotron ">
                <div class="container ">
                    <h1 class="display-4">Welcome to OUR TECH BLOG</h1>
                    <p>Welcome to Technical , Blog World of Technology</p>
                    <h3>Our Tech Blog</h3>
                    <hr class="my-4">
                    <p>A programming language is any set of rules that converts strings, or graphical program elements in
                        the case of visual programming languages, to various kinds of machine code output.[citation needed]
                        Programming languages are one kind of computer language, and are used in computer programming to
                        implement algorithms.</p>
                    <a class="btn btn-primary btn-lg" href="#" role="button"><i
                            class="fa-solid fa-arrow-up-right-from-square"></i> Start it's Free</a>
                    <a class="btn btn-primary btn-lg" href="LoginPage.jsp" role="button"> <i class="fa-solid fa-user-check "></i>
                        Login</a>


                </div>
            </div>
        </div>
        <!--Banner Ends-->




        <!--Cards Begins-->
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <img src="https://images.idgesg.net/images/article/2019/05/java_binary_code_gears_programming_coding_development_by_bluebay2014_gettyimages-1040871468_2400x1600-100795798-large.jpg?auto=webp&quality=85,70"
                             class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">JAVA</h5>
                            <p class="card-text">Java is a high-level, class-based, object-oriented programming language
                                that is designed to have as few implementation dependencies as possible</p>
                        </div>

                        <div class="card-body">
                            <a href="#" class="card-link"><i class="fa-solid fa-circle-info"></i> About</a>
                            <a href="#" class="card-link"><i class="fa-solid fa-arrow-up-right-from-square"></i> Get</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <img src="https://images.idgesg.net/images/article/2019/05/java_binary_code_gears_programming_coding_development_by_bluebay2014_gettyimages-1040871468_2400x1600-100795798-large.jpg?auto=webp&quality=85,70"
                             class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">JAVA</h5>
                            <p class="card-text">Java is a high-level, class-based, object-oriented programming language
                                that is designed to have as few implementation dependencies as possible</p>
                        </div>

                        <div class="card-body">
                            <a href="#" class="card-link"><i class="fa-solid fa-circle-info"></i> About</a>
                            <a href="#" class="card-link"><i class="fa-solid fa-arrow-up-right-from-square"></i> Get</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <img src="https://images.idgesg.net/images/article/2019/05/java_binary_code_gears_programming_coding_development_by_bluebay2014_gettyimages-1040871468_2400x1600-100795798-large.jpg?auto=webp&quality=85,70"
                             class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">JAVA</h5>
                            <p class="card-text">Java is a high-level, class-based, object-oriented programming language
                                that is designed to have as few implementation dependencies as possible</p>
                        </div>

                        <div class="card-body">
                            <a href="#" class="card-link"><i class="fa-solid fa-circle-info"></i> About</a>
                            <a href="#" class="card-link"><i class="fa-solid fa-arrow-up-right-from-square"></i> Get</a>
                        </div>
                    </div>
                </div>



            </div>
            <div class="row ">
                <div class="col-md-4"><div class="card" style="width: 18rem;">
                        <img src="https://images.idgesg.net/images/article/2019/05/java_binary_code_gears_programming_coding_development_by_bluebay2014_gettyimages-1040871468_2400x1600-100795798-large.jpg?auto=webp&quality=85,70" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">JAVA</h5>
                            <p class="card-text">Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible</p>
                        </div>

                        <div class="card-body">
                            <a href="#" class="card-link"><i class="fa-solid fa-circle-info"></i> About</a>
                            <a href="#" class="card-link"><i class="fa-solid fa-arrow-up-right-from-square"></i> Get</a>
                        </div>
                    </div></div>
                <div class="col-md-4"><div class="card" style="width: 18rem;">
                        <img src="https://images.idgesg.net/images/article/2019/05/java_binary_code_gears_programming_coding_development_by_bluebay2014_gettyimages-1040871468_2400x1600-100795798-large.jpg?auto=webp&quality=85,70" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">JAVA</h5>
                            <p class="card-text">Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible</p>
                        </div>

                        <div class="card-body">
                            <a href="#" class="card-link"><i class="fa-solid fa-circle-info"></i> About</a>
                            <a href="#" class="card-link"><i class="fa-solid fa-arrow-up-right-from-square"></i> Get</a>
                        </div>
                    </div></div>
                <div class="col-md-4"><div class="card" style="width: 18rem;">
                        <img src="https://images.idgesg.net/images/article/2019/05/java_binary_code_gears_programming_coding_development_by_bluebay2014_gettyimages-1040871468_2400x1600-100795798-large.jpg?auto=webp&quality=85,70" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">JAVA</h5>
                            <p class="card-text">Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible</p>
                        </div>

                        <div class="card-body">
                            <a href="#" class="card-link"><i class="fa-solid fa-circle-info"></i> About</a>
                            <a href="#" class="card-link"><i class="fa-solid fa-arrow-up-right-from-square"></i> Get</a>
                        </div>
                    </div></div>
            </div>


        </div>
    </div>


    <!--Cards Ends-->



    <%!
        Connection con = DatabaseConnection.getConnection();

    %>
    <@=con%>





    <!-- JavaScript Bundle with Popper -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

</body>
</html>
