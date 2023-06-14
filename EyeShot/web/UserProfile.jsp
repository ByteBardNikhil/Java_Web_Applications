<%-- 
    Document   : UserProfile
    Created on : 4 Mar, 2023, 3:38:48 PM
    Author     : hp
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.Upload_DAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.helper.DatabaseConnection"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.dao.User_DAO"%>
<%@page import="com.entities.Photo"%>
<%@page import="com.entities.User"%>

<%
    User user = (User) session.getAttribute("csmr");
    User_DAO u = new User_DAO();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User_Profile</title>
        <link href="css/homecss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Trirong">
       
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
        
        <style>
            body, html {
                height: 70%;
                font-family:Trirong,sans-serif;
            }

            * {
                box-sizing: border-box;
            }

            .bg-image {


                background: black;
                border-bottom-style: groove;
                border-radius: 0px 0px 50px 50px;   

                height: 80%;

            }


            .bg-text {

                border: 1px;
                border-radius: 30%;
                position: absolute;

                left: 50%;
                transform: translate(-50%, -50%);
                z-index: 2;

                text-align: center;
            }
            input[type=file]{
                fill: none;
                background: transparent;
                border: none; 
            }
            button{
                background:grey;
                padding: 10px 20px;
                color: #fff;
                border: none;
                border-radius: 10px;
            }
            input[type=file]::file-selector-button {
                margin-right: 20px;
                border: none;
                background-color: grey;
                padding: 10px 20px;
                border-radius: 10px;
                color: #fff;
                cursor: pointer;
                transition: background .2s ease-in-out;

            }

            input[type=file]::file-selector-button:hover {
                background:black;
            }
            .userProfile{
                height: 250px; 
                width: 250px;
                border-radius: 100%;
                object-fit: cover;

            }
            .allUploads{
               
               display: grid;
               grid-auto-flow: row;
               grid-gap: 10px;
               grid-auto-columns:minmax(400px, auto);
               
               grid-auto-rows:minmax(400px, auto);
           
           
            }
            
          .box>img{
               
                object-fit:fill;
                width: 400px;
                max-height: 500px;
                               
            }
                
            
        </style>
    </head>


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



    <!--middle starts-->


    <div class="bg-image"></div>

    <div class="bg-text">
        <form action="EditUserProfile" method="Post" enctype="multipart/form-data">

            <div><img class="userProfile" 
                      <%
                          boolean b = u.isDefault(user.getEmail());

                          if (b == false) {
                      %>

                      src="userPics/default.jpg" alt="Pic"
                      <%
                      } else {

                          String pic = "data:image/jpg;base64," + u.getImage(user.getEmail());

                      %>
                      src=<%=pic%>    

                      <%}%>

                      />

            </div>

            <input class="filed" type="file" name="file" />
            <button type="submit">Submit</button>
        </form>


    </div>





    <!--middle Ends-->      
 <hr style="margin-top: 160px;">
 <div class="allUploads">
     <div class="box">
       


        <%

           
            ArrayList<Photo> al = new Upload_DAO(DatabaseConnection.getConnection()).getImagesByEmail(user.getEmail());
            for (Photo c : al) {
                byte [] imageData = c.getBlobData().getBytes(1, (int) c.getBlobData().length());
            String encoded = Base64.getEncoder().encodeToString(imageData);
            String pic = "data:image/jpg;base64," + encoded;
            
            

        %>

        <img style="width:400px; height: 600px" src=<%=pic%> />

        <%}%>
        </div>


    </div>


</html>
