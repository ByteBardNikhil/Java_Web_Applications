<%-- 
    Document   : Error_Page
    Created on : 3 Aug, 2022, 4:50:37 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry something went Wrong</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous"> <link href="CSS/myCSS.css" rel="stylesheet" type="text/css"/>
        <style>

        </style>
    </head>
    <body>
        <div class="container text-center mt-5 shadow-lg p-3 mb-5 bg-white rounded">
            <h3 class="lead mt-2">Sorry ! Something went wrong ...</h3>
            <img class="mt-4 w-25 shadow-lg p-3 mb-5 bg-white rounded img-fluid img-thumbnail"  src="img/warning.jpg" alt="Image"/>
            <br> <a class="btn btn-primary mb-5 " href="profile.jsp">Home</a>
        </div>

    </body>
</html>
