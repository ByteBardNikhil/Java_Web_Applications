<%@page import="com.entities.User"%>
<%
    User user =(User)session.getAttribute("csmr");
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/homecss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Trirong">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
        
    <style>
        body{
            background-image: url("img/homeing.jpg");
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
             font-family:Trirong,sans-serif;
        }
        
    </style>
    </head>
  

    <body>

        <header class="header">
            <h3 class="logo">Eyeshot</h3>                  
            <ul class="navbar">
                <li><a href="explore.jsp">Explore</a>
                    <ul class="dropdown">
                        <li><a href="#">Editors</a></li>
                        <li><a href="#">Contact Us</a></li>
                        <li><a href="#">Popular Images</a></li>
                    </ul>
                </li>
                <li id="signUp"><a href="Logout">Logout</a></li>
                <li ><a href="UserProfile.jsp"><%=user.getName()%></a></li>
                <li><a href="upLoad.jsp">Upload</a></li>
            </ul> 
        </header>

        <p class="quote"> CAPTURE MOMENTS</p>  
        <div class="homeimg">   
            <div class="search">
                <form action="SearchImage.jsp" class="searchbar">
                    <input style="padding: 0px 25px;" type="text"
                           placeholder="Search Images"
                           name="search">
                    <button class="btn">
                        <i class="fa-sharp fa-solid fa-magnifying-glass" style="font-size: 20px"></i>
                    </button>
                </form>
            </div>


        </div>

        
        
    </body>
   
</html>

