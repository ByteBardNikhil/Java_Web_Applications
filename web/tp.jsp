<%-- 
    Document   : tp
    Created on : 1 Aug, 2022, 1:53:14 AM
    Author     : USER
--%>

<%@page import="com.entities.User"%>
<%@page import="com.dao.PostDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.Post"%>
<%@page import="com.helper.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <div class="row ">

    <%
        // Thread.sleep(1000);
        User user=(User)request.getAttribute("currentUser");
        String s = "Nikhil Mahajan";
        PostDAO d = new PostDAO(DatabaseConnection.getConnection());
        List<Post> post = null;
        int cid = Integer.parseInt(request.getParameter("cid"));

        if (cid == 0) {
            post = d.getAllPost();
        } else {
            post = d.getPostByCatId(cid);
        }

        if (post.size() == 0) {
    %>
    <div class="container text-center mt-5 shadow-lg p-3 mb-5 bg-white rounded">
        <h3 class="lead mt-2">Sorry ! No Post from this category ...</h3>
        <br> <a class="btn btn-primary mb-5 " href="profile.jsp">Home</a>
    </div>
    <%
        }

        for (Post p : post) {

    %>

    <div class="col-md-4 mt-3 ">
        <div class="card" style="width: 18rem;">
            <img src="blog_Pics/<%=p.getpPic()%>" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title"><%=p.getpTitle()%></h5>
                <h6 class="card-subtitle mb-2 text-muted">Subtile</h6>
                <p class="card-text">Description : <%=p.getpContent()%></p>
                <a href="#" class="card-link"><%=p.getpCode()%></a><br>

            </div>
            <div class="card-footer " >
            
                <a href="showBlogPost.jsp?pId=<%= p.getPid()%>" class="btn btn-outline-primary btn-sm">Read More...</a>
                <a href="#" onclick="doLike(<%= p.getPid()%>,<%= user.getId()%>)" class="btn btn-outline-primary btn-sm "><i class="fa-solid fa-thumbs-up"></i> <span>10</span></a>-->-->
                <a href="#" class="btn btn-outline-primary btn-sm"><i class="fa-solid fa-comment"></i> <span>20</span></a>
                
            </div>
        </div>


    </div>

    <%}%>
    
    
</div>
    <script>
        function doLike(pid,uid)
{
    console.log(pid+'  <-- pid  uid-->'+uid);
}

        </script>
    </body>
</html>
