<%@page import="com.dao.LikeDAO"%>
<%@page import="com.entities.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.Post"%>
<%@page import="com.helper.DatabaseConnection"%>
<%@page import="com.dao.PostDAO"%>


<div class="row g-3">

    <%
        // Thread.sleep(1000);
        User user = (User) session.getAttribute("currentUser");

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

    <div class="col-lg-4 col-md-6 col-sm-6 mt-3 ">
        <div class="card" style="width: 18rem;">
            <img src="blog_Pics/<%=p.getpPic()%>" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title"><%=p.getpTitle()%></h5>
                <h6 class="card-subtitle mb-2 text-muted">Subtile</h6>
                <p class="card-text">Description : <%=p.getpContent()%></p>
                <div class="card-header border rounded shadow bg-white"><a> <%=p.getpCode()%></a><br></div>

            </div>
            <div class="card-footer " >

                <a href="showBlogPost.jsp?pId=<%= p.getPid()%>" class="btn btn-outline-primary btn-sm">Read More...</a>
                <%LikeDAO ldao = new LikeDAO(DatabaseConnection.getConnection());
                    boolean ans = ldao.isLikedByUser(p.getPid(), user.getId());
                if(ans==false){  
                %>
                <button class="like__btn btn btn-outline-primary btn-sm float-right" onclick="doLike(<%=p.getPid()%>,<%=user.getId()%>);">
                 <span class="icon"><i class="far fa-thumbs-up"></i></span>
                    <span class="count"><%=ldao.countLikeOnPost(p.getPid())%></span> Like</button> 
                    <%}else{%>
                 <button class="like__btn_diabled btn btn-outline-success btn-sm float-right"  onclick="doLike(<%=p.getPid()%>,<%=user.getId()%>);">
                 <span class="icon"><i class="fas fa-thumbs-up"></i></span>
                    <span class="count"><%=ldao.countLikeOnPost(p.getPid())%></span> Like</button> 
                 <%}%>
                    
                 
                

            </div>
        </div>

    </div>

    <%}%>


</div>
<script src="js/js2.js"></script>
<script src="js/myJS.js"></script>
