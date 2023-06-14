 
<%@page import="com.entities.Message"%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"  />
    <link href="css/signUP.css" rel="stylesheet" type="text/css"/>
    <title>Document</title>
</head>

<style>
        body{
            background-image: url("img/homeing.jpg");
            
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }

    </style>
<body>
    
   <div class="container" id="container">
    <div class="form-container sign-up-container">
        <form action="RegisterServlate" method="post">
        <h1>Create Account</h1>
        <div class="social-container">
          <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
          <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
          <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
          
        </div>
        <span>or use your email for registration</span>
        <input type="text"  name="name" placeholder="Name" />
        <input type="email" name="email" placeholder="Email" />
        <input type="password" name="pass" placeholder="Password" />
        <input type="checkbox" id="check" name="check" ><a class="checks"> agree terms and condtion</a>
      
        <button>Sign Up</button>
      </form>
    </div>
    <div class="form-container sign-in-container">
        <% 
               Message m=(Message)session.getAttribute("msg");
               if(m!=null){
                   %>
                   <div class="alert" role="alert">
                   <%= m.getContent()%>
                  </div>
               <%
                   session.removeAttribute("msg");
               }
               %>
        <form action="Login_Servlet" method="post">
            
        <h1>Sign in</h1>
        <div class="social-container">
          <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
          <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
          <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
        </div>
        <span>or use your account</span>
        <input type="email"  name="email" placeholder="Email" />
        <input type="password" name="Lpass" placeholder="Password" />
        <a href="#">Forgot your password?</a>
        
        <button>Sign In</button>
      </form>
    </div>
    <div class="overlay-container">
      <div class="overlay">
        <div class="overlay-panel overlay-left">
          <h1>Welcome Back!</h1>
          <p>To keep connected with us please login with your personal info</p>
          <button class="ghost" id="signIn">Sign In</button>
        </div>
        <div class="overlay-panel overlay-right">
          <h1>Hello, Friend!</h1>
          <p>Enter your personal details and start journey with us</p>
          <button class="ghost" id="signUp">Sign Up</button>
        </div>
      </div>
    </div>
  </div>
    <script type="text/javascript">
      const signUpButton = document.getElementById('signUp');
      const signInButton = document.getElementById('signIn');
      const container = document.getElementById('container');

      signUpButton.addEventListener('click', () => {
	container.classList.add("right-panel-active");
      });

      signInButton.addEventListener('click', () => {
	container.classList.remove("right-panel-active");
      });
       </script>
</body>
</html>