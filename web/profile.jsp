

<%@page import="java.util.ArrayList"%>
<%@page import="com.entities.Categories"%>
<%@page import="com.dao.PostDAO"%>
<%@page import="com.helper.DatabaseConnection"%>
<%@page import="com.entities.Message"%>
<%@page import="com.entities.User"%>
<%@page errorPage="Error_Page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("LoginPage.jsp");
    }

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
                            <a class="dropdown-item"  onclick="getPost(<%=c.getCid()%>)"><%=c.getName().toUpperCase().charAt(0) + c.getName().substring(1)%></a>
                            <%}%>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="profile.jsp">All Posts..</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="ContactUs.jsp" tabindex="-1" aria-disabled="true" data-toggle="modal" data-target="#exampleModal"><i
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


        <%
            Message ms = (Message) session.getAttribute("msg");
            if (ms != null) {


        %>
        <div class="alert <%=ms.getCssClass()%>" role="alert"><%=ms.getContent()%></div>
        <%
            }
            session.removeAttribute("msg");
        %>

        <!--Main Body of the Page Starts-->


        <main>
            <div class="container-fluid ">

                <div class="row mt-4 ">

                    <div class="col-md-3 col-sm-2 mt-3"> 
                        <!--Col -1 Starts--->
                        <div class="row ">
                            <div class="col-md-12 col-sm-8">
                                <div class="list-group " id="list-tab" role="tablist">
                                    <a onclick="getPost(0)" class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">All Post</a>
                                    <%
                                        for (Categories c : al) {
                                    %>
                                    <a onclick="getPost(<%=c.getCid()%>)" class="list-group-item list-group-item-action " id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile"><%=c.getName().toUpperCase().charAt(0) + c.getName().substring(1)%> </a>

                                    <%
                                        }
                                    %>


                                </div>
                            </div>
                            <div class="col-12 ">
                                <div class="tab-content" id="nav-tabContent">
                                    <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list"></div>
                                    <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list"></div>
                                    <div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list"></div>
                                    <div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list"></div>
                                </div>
                            </div>
                        </div>


                        <!--Col -1 ends--->
                    </div>


                    <div class="col-md-9 col-sm-10"  >
                        <!--Col -2 Starts---> 

                        <div class="container text-center" id="loader">
                            <i class="mt-5 fa-solid fa-arrows-rotate fa-spin fa-4x "></i>
                            <h3 class="mt-4">Please wait Loading...</h3>
                        </div>
                        <div class="container-fluid" id="post-container">

                        </div>



                        <!--Col -2 ends--->    
                    </div>


                </div>
            </div>
        </main>


        <!--Main Body of the Page Ends-->



        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade shadow-lg p-3 mb-5  rounded" id="profile" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header " >
                        <h5 class="modal-title text-center" id="exampleModalLabel" >Our Technology Blog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body text-center shadow-lg p-3 mb-5 bg-white rounded">
                        <img style="width: 50px; height: 50px; padding-bottom:  5px; "  src="pics/<%=user.getProfile()%>" alt="<%=user.getProfile()%>"/>
                        <h5 class="lead"> Hello <%=user.getName().toUpperCase().charAt(0) + user.getName().substring(1)%>  </h5>

                        <div id="profile-detail" >
                            <table class="table table-hover">

                                <tbody>
                                    <tr>
                                        <th scope="row">ID :</th>
                                        <td><%=user.getId()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Email :</th>
                                        <td><%=user.getEmail()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Gender :</th>
                                        <td ><%=user.getGender()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">About :</th>
                                        <td ><%=user.getAbout()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Registered Date :</th>
                                        <td ><%=user.getDateTime()%></td>

                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <!-- Table ended--->
                        <div id="profile-edit" style="display: none" >
                            <h2 class="lead mt-2">please edit your profile carefully </h2>

                            <form action="EditServlet" method="post" enctype="multipart/form-data">

                                <table class="table">
                                    <tr>
                                        <td>ID :</td>
                                        <td><%=user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <td>Email :</td>
                                        <td><input type="email" class="form-control" name="user_email" value="<%=user.getEmail()%>"/> </td>
                                    </tr>
                                    <tr>
                                        <td>Name :</td>
                                        <td><input type="username" class="form-control" name="user_name" value="<%=user.getName()%>"/> </td>
                                    </tr>
                                    <tr>
                                        <td>Password :</td>
                                        <td><input type="password" class="form-control" name="user_password" value="<%=user.getPassword()%>"/> </td>
                                    </tr>
                                    <tr>
                                        <td>Gender : </td>  
                                        <td> <%=user.getGender().toUpperCase()%> </td>
                                    </tr>
                                    <tr>
                                        <td>About :</td>
                                        <td> <textarea rows="3" class="form-control" name="user_about" ><%=user.getAbout()%></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                            <td>New Profile </td>
                                        <td>
                                            <input type="file" name="file" class="form-control"/>
                                        </td>
                                    </tr>

                                </table>

                                <div class="container text-center">
                                    <button class="btn btn-outline-primary">Save</button>                                            
                                </div>

                            </form>



                        </div>
                        <div class="modal-footer">
                            <button  type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End of profile Modal-->

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

        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>


        <!--Add Post Javascript starts-->



        <!--*************///////////////////////********-->
        <script>
                                        $(document).ready(function () {

                                            $('#add-post-form').on('submit', function (event) {

                                                event.preventDefault();

                                                let form = new FormData(this);



                                                $.ajax({
                                                    url: "AddPostServlet",
                                                    type: 'POST',
                                                    data: form,
                                                    success: function (data, textStatus, jqXHR) {




                                                        if (data.trim() === 'done') {
                                                            swal("Good job!", "Post saved successfully", "success");
                                                        } else {
                                                            swal("Error!", "Something went Wrong! plz check the form", "error");

                                                        }


                                                    },
                                                    error: function (jqXHR, textStatus, errorThrown) {
                                                        console.log(jqXHR);


                                                    },
                                                    contentType: false
                                                    , processData: false


                                                });


                                            });


                                        });
        </script>
        <!--*************///////////////////////********-->

        <!--Add Post Javascript ends-->    

        <script>
            $(document).ready(function () {

                let x = false;
                $('#edit-profile-button').click(function () {
                    if (x === false)
                    {
                        $('#profile-detail').hide();
                        $('#profile-edit').show();
                        x = true;
                        $(this).text("Back");
                    } else {
                        $('#profile-detail').show();
                        $('#profile-edit').hide();
                        x = false;
                        $(this).text("Edit");
                    }
                });
            });


        </script>

        <!--Function for Calling LoadPost.jsp Starts -->
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


        <!--Loading pages using ajax function START-->
        <script>
            $(document).ready(function (e) {
                getPost(0);
            });
        </script>

        <!--Loading pages using ajax function END-->
        <script src="js/myJS.js"></script>
    </body>
</html>
