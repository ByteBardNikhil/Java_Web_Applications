

<%@page import="com.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
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
                    height: 100vh;
                }
            }

            @media only screen and  (max-width:400px) {
                main{
                    height: 80vh;


                }
            }


        </style>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="timepass.css">
        <script src="https://kit.fontawesome.com/a3aff8e9ae.js" crossorigin="anonymous"></script>

    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <main class="d-flex align-items-center justify-content-center"  >
            <div class="container ">
                <div class="row">
                    <div class="col-md-6 col-sm-8 offset-md-3 ">
                        <div class="card text-white bg-dark " >
                            <div class="card-header text-center bg-secondary "><i class="fa-solid fa-user-plus fa-3x"></i> <br> <h3> Login Here </h3></div>

<%
    Message m=(Message)session.getAttribute("msg");
    if(m!=null)
    {
        %>
        
 
                            <div class="alert <%=m.getCssClass()%>" role="alert">
                             <%= m.getContent()%>
                            </div>          

        
        
        <%
       session.removeAttribute("msg");
        
       
    }
    
    
%>
 

                            <div class="card-body">
                                <form action="Login_Servlet" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input   placeholder="Enter Password" name="password" required type="password" class="form-control" id="exampleInputPassword1">
                                    </div>

                                    <div class="container text-center ">
                                        <button type="submit" class="btn btn-primary"><i class="fa-solid fa-thumbs-up"></i> Submit</button>

                                    </div>  
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
    </body>
</html>