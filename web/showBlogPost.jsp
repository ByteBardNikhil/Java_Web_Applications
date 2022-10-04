<%-- 
    Document   : showBlogPost
    Created on : 19 Aug, 2022, 6:54:42 PM
    Author     : USER
--%>

<%@page import="com.entities.Comment"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.CommentDAO"%>
<%@page import="com.helper.ID"%>
<%@page import="com.dao.LikeDAO"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.dao.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entities.Categories"%>
<%@page import="com.entities.Post"%>
<%@page import="com.helper.DatabaseConnection"%>
<%@page import="com.dao.PostDAO"%>
<%@page import="com.entities.User"%>
<%@page errorPage="Error_Page.jsp" %>
<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("LoginPage.jsp");
    }

    int pid = Integer.parseInt(request.getParameter("pId"));
    CommentDAO cdao = new CommentDAO(DatabaseConnection.getConnection());


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

        <script src="https://kit.fontawesome.com/a3aff8e9ae.js" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v14.0" nonce="9oLb9NNj"></script>
</head>
<body>
    <!--
Navbar start
    -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
        <a class="navbar-brand" href="profile.jsp"><i class="fa-solid fa-tower-broadcast"></i> Our Tech Blog</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="profile.jsp"><i class="fa-solid fa-house-chimney"></i> Home <span
                            class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa-solid fa-square-check"></i> Categories
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <%                                PostDAO pdao = new PostDAO(DatabaseConnection.getConnection());
                            ArrayList<Categories> al = pdao.getAllCategories();

                            for (Categories c : al) {
                        %>
                        <a href="profile.jsp" class="dropdown-item" onclick="getPost(<%=c.getCid()%>)"><%=c.getName().toUpperCase().charAt(0) + c.getName().substring(1)%></a>
                        <%}%>
                        <div class="dropdown-divider"></div>
                        <a onclick="getPost(0)" class="dropdown-item" href="profile.jsp">All Posts..</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="#" tabindex="-1" aria-disabled="true" data-toggle="modal" data-target="#exampleModal"><i
                            class="fa-solid fa-address-book"></i> Contact Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " data-toggle="modal" data-target="#add-post-modal" href="#" tabindex="-1" aria-disabled="true">
                        <i class="fa-solid fa-signs-post"></i> Do post</a>
                </li>




            </ul>
            <ul class="navbar-nav ">
                <li class="nav-item bg-light float-right" style="text-decoration: none;">
                    <a data-toggle="modal" data-target="#profile" class="nav-link " href="#!" tabindex="-1" aria-disabled="true"><i
                            <i class="fa-solid fa-user"></i> <%=user.getName()%></a>
                </li>



                <li class="nav-item bg-light float-right" style="text-decoration: none;">
                    <a class="nav-link" href="LogOut" tabindex="-1" aria-disabled="true"><i
                            <i class="fa-solid fa-arrow-right-from-bracket"></i> Log Out</a>
                </li>
            </ul>



        </div>
    </nav>
    <!--
    NavBAr ENds
    -->
    <!--Main content of Body showBlogPost.jsp Start-->
    <div class="container text-center mt-5 shadow-lg p-3 mb-5 bg-white rounded">

        <div class="container">

            <!--Fetching object--> 
            <%
                Post p = pdao.getPostByPostId(pid);

            %>


            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <!--Card Starts-->

                    <div class="card mb-3">
                        <img src="blog_Pics/<%=p.getpPic()%>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title post-title"><%=p.getpTitle()%></h5>
                            <p class="card-text post-content"><%=p.getpContent()%></p>
                            <div class="post-code">
                                <pre class="card-text"><%=p.getpCode()%></pre>
                                <br>
                            </div>  
                            <p class="card-text" style="border: 1px solid #e2e2e2; border-radius: 10px;"><small class="text-muted "><a href="UserProfile.jsp" class="float-left"><%=new UserDAO(DatabaseConnection.getConnection()).getNameById(p.getUserId())%></a> <a class="float-right" style="color: black;">posted on : <%=  DateFormat.getDateTimeInstance().format(p.getpDate())%></a></small></p>

                        </div>
                        <div class="card-footer">

                            <%LikeDAO ldao = new LikeDAO(DatabaseConnection.getConnection());
                                boolean ans = ldao.isLikedByUser(p.getPid(), user.getId());
                                if (ans == false) {
                            %>
                            <button class="like__btn btn btn-outline-primary btn-sm" onclick="doLike(<%=p.getPid()%>,<%=user.getId()%>);">
                                <span class="icon"><i class="far fa-thumbs-up"></i></span>
                                <span class="count"><%=ldao.countLikeOnPost(p.getPid())%></span> Like</button> 
                                <%} else {%>
                            <button class="like__btn_diabled btn btn-outline-success btn-sm"  onclick="doLike(<%=p.getPid()%>,<%=user.getId()%>);">
                                <span class="icon"><i class="fas fa-thumbs-up"></i></span>
                                <span class="count"><%=ldao.countLikeOnPost(p.getPid())%></span> Like</button> 
                                <%}%>


                           

                        </div>


                        <!--Card Ends-->



                    </div>
<!--                            <div class="card-footer">
                                <div class="fb-comments" data-href="http://localhost:8084/Our_Tech_Blog/showBlogPost.jsp?pId=5" data-width="" data-numposts="5"></div>
                            </div>  -->
                    <a class="btn btn-primary mb-5 " href="profile.jsp">Home</a>

                </div> 



            </div>
        </div>
        <!--Main content of Body showBlogPost.jsp ends-->


<!--Modal for do Post Started-->
  <!--Add post Modal Started-->



        <!-- Modal -->


        <div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the Post details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!--modal form start-->

                        <form id="add-post-form" action="AddPostServlet" method="post" enctype="multipart/form-data">




                            <div class="form-group">
                                <select class="form-control" name="cid">

                                    <option selected disabled  >---Select Category---</option>
                                    <%
                                        for (Categories c : al) {
                                    %>
                                    <option name="cid" value="<%=c.getCid()%>"><%=c.getName()%></option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <textarea name="pContent" class="form-control" style="height: 70px" placeholder="Enter your Content"></textarea>

                            </div>
                            <div class="form-group">
                                <textarea name="pCode" class="form-control"  style="height: 70px" placeholder="Enter your Program (if any)"></textarea>

                            </div>
                            <div class="form-group" >
                                Select your pic
                                <br>
                                <input type="file" name="file2" class="form-control"/>
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-primary">Post</button>                                            
                            </div>

                        </form>
                    </div>


                </div>
            </div>
        </div>
        <!--Add post Modal ended-->        

<!--Modal for do Post Ended--> 


<!--Contact Us Modal Starts--> 
 <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Contact Us</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!--table begins-->
        <table class="table table-borderless">
            <tr><td>Email : </td><td>ourtechblog2022@gmail.com</td></tr>
            <tr><td>Address : </td><td>Austin, Texas, United States</td></tr>
            <tr><td>Call Us : </td><td> (800) 662-7232.</td></tr>
                          
            
        </table>
        <!--table Ends--> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
 <!--Contact Us Modal Ends-->        

        
        
        


        <!--Script Starts -->
        
        <script>
            function getPost(catId) {

                $('#loader').show();
                $('#post-container').hide();

                $.ajax({
                    url: "LoadPost.jsp",
                    data: {cid: catId},
                    type: 'POST', success: function (data, textStatus, jqXHR) {
                        $('#loader').hide();
                        $('#post-container').show();
                        $('#post-container').html(data);
                       
                    }, error: function (jqXHR, textStatus, errorThrown) {

                    }



                });
            }
        </script>
        <!--Function for Calling LoadPost.jsp Ends -->


        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

        <div id="fb-root"></div>
        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v14.0" nonce="UxnYv11e"></script>
        <!--Script Ends -->
        <script src="js/js2.js"></script>
        <script src="js/myJS.js"></script>

</body>
</html>
