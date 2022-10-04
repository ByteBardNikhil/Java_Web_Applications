<%-- 
    Document   : Registration_Page
    Created on : 31-Jul-2022, 12:30:20 pm
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="com.servlet.Registor_Servlet" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

        <script src="https://kit.fontawesome.com/a3aff8e9ae.js" crossorigin="anonymous"></script>


        <style>
            .card{
                box-shadow: 5px 4px 8px 0 rgba(0, 0, 0, 0.8), 5px 8px 20px 0 rgba(0, 0, 0, 0.19),-5px -8px 20px 0 rgba(0, 0, 0, 0.19);

            }
            .card-header{
                box-shadow: 4px 4px 6px 0 rgba(0, 0, 0, 0.8), 4px 6px 20px 0 rgba(0, 0, 0, 0.19),-4px -6px 20px 0 rgba(0, 0, 0, 0.19);

            }
            button{    box-shadow: 5px 4px 8px 0 rgba(0, 0, 0, 0.8), 5px 8px 20px 0 rgba(0, 0, 0, 0.19),-5px -8px 20px 0 rgba(0, 0, 0, 0.19);
            }


            @media only screen and  (min-width:400px) {
                main{
                     background-image: linear-gradient(to right,#9FA5D5,#E8F5C8);
                   height: 150vh;
                }
            }

            @media only screen and  (max-width:400px) {
                main{
                    height: 80vh;


                }
            }


        </style>

    </head>
    <body>

        <%@include file="navbar.jsp" %>
        <main class="d-flex align-items-center justify-content-center"  >
            <div class="container ">
                <div class="row">
                    <div class="col-md-6 col-sm-8 offset-md-3 offset-sm-2">
                        <div class="card text-white bg-dark " >
                            <div class="card-header text-center bg-secondary "><i class="fa-solid fa-user-plus fa-3x"></i> <br> <h3> Register here </h3></div>
                            <div class="card-body">
                                <form id="reg_form"  method="POST">

                                    <div class="form-group">
                                        <label for="user_name">User Name</label>
                                        <input name="user_name" type="text" class="form-control" id="username" aria-describedby="emailHelp" placeholder="Enter Username">
                                    </div>


                                    <div class="form-group">
                                        <label for="email">Email address</label>
                                        <input  name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email">
                                        <small  id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>



                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter Password">
                                    </div>




                                    <div class="form-group">
                                        <label for="gender">Select Gender</label>
                                        <br>
                                        <input type="radio" name="gender" value="Male"> Male
                                        <input type="radio" name="gender" value="Female"> Female
                                        <input type="radio" name="gender" value="Other"> Other

                                    </div>

                                    <div class="form-group">
                                        <textarea name="about" class="form-control" id="" rows="5" placeholder="Enter something about yourself"></textarea>
                                    </div>
                                    <br>
                                    <div  id="loader" class="container text-center" style="display: none" id="loader" >
                                        <i class="fa-solid fa-rotate fa-spin fa-4x"></i>
                                        <br><br>Please wait ...    
                                    </div>



                                    <div class="form-group form-check">
                                        <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1"><a href="#">agree terms and conditions.</a></label>
                                    </div>





                                    <button id="submit-btn" type="submit" class="btn btn-primary"><i class="fa-solid fa-thumbs-up"></i> Register</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!-- JavaScript Bundle with Popper -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
        <!--Ajax implementation in page-->
        <script>

            $(document).ready(function () {
                console.log("Loaded...");

                $('#reg_form').on('submit', function (event) {

                    event.preventDefault();

                    let form = new FormData(this);

                    $('#loader').show();
                    $('#submit-btn').hide();

                    $.ajax({
                        url: "Registor_Servlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);

                            $('#loader').hide();
                            $('#submit-btn').show();

                            if (data.trim() === 'done') {
                                swal("Registered Succesfully .. redirecting you to the login Page")
                                        .then((value) => {
                                            window.location='LoginPage.jsp';
                                        });
                            }
                            else{swal(data);}


                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR);
                            $('#loader').hide();
                            $('#submit-btn').show();

                        },
                        contentType: false
                        , processData: false


                    });


                });


            });

        </script>

    </body>
</html>
