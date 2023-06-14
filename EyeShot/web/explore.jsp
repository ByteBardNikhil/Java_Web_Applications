<%-- 
    Document   : explore
    Created on : 17 Apr, 2023, 8:00:06 PM
    Author     : hp
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.Upload_DAO"%>
<%@page import="com.entities.Photo"%>
<%@page import="com.helper.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    </head>
    <style>
        .allImages{
                height: 400px; 
                width: 300px;               
                object-fit: cover;
                display: flex;
             
        }
        .allImages img{
             padding: 5px;
        }
        body{
            display: block;
            
        }
        .allUploads{
               
               display: grid;
               grid-auto-flow: row;
               grid-gap: 20px;
                grid-auto-columns:minmax(400px, auto);
               
               grid-auto-rows:minmax(400px, auto);
               
           
           
            }
            .box{
                padding: 10px;
            }
          .box>img{
               
                object-fit: cover;
                width: 400px;
                max-height: 600px;
                               
            }
    </style>
    <body>
        <div class="allUploads">
            <div class="box">


        <%

           
            ArrayList<Photo> al = new Upload_DAO(DatabaseConnection.getConnection()).getAllImages();
            for (Photo c : al) {
                byte [] imageData = c.getBlobData().getBytes(1, (int) c.getBlobData().length());
            String encoded = Base64.getEncoder().encodeToString(imageData);
            String pic = "data:image/jpg;base64," + encoded;
            
            

        %>

        <img style="width: 400px; height: 600px" src=<%=pic%> />

        <%}%>
        </div>






    </div>
    </body>
</html>
