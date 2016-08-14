<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Success</title>

   
    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

    <link href="http://getbootstrap.com/examples/jumbotron-narrow/jumbotron-narrow.css" rel="stylesheet">
    <link href="../static/css/signup.css" rel="stylesheet">
          <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">

		<!-- Website CSS style -->
    <link rel="stylesheet" type="text/css" href="assets/css/main.css">

		<!-- Website Font style -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		
		<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
    <script src="../static/js/jquery-1.11.2.js"></script>
    <script src="../static/js/signUp.js"></script>
   
  </head>

  <body>

    <div class="container-fluid">
      <div class="header">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation"><a style="color:#A52A2A" target="_blank" href="https://shibboleth.stevens.edu/idp/Authn/UserPassword">MyStevens</a></li>
            <li role="presentation" ><a href="/">Home</a></li>
            <li role="presentation"><a href="/signin.jsp">Sign In</a></li>
            <li role="presentation" class="active"><a href="#">Sign Up</a></li>
          </ul>
        </nav>
        <h3 class="text-muted">Duck Life</h3>
      </div>
        
      <form action="/RegisterServlet" method="post">  
      
	  <div class="alert alert-info">
	  	Please submit your email address to activate your account!
	  	</div>
      <!--<font size="5" color="red">Please summit to activate your account before login :</font><br/>--> 
      <!--EmailAddress: <input type="text" name=email value=${Email } onfocus="this.blur()" /><br/>-->
      <div class="form-group">
      	<label for="email" class="cols-sm-2 control-label">Email address</label>
      	<div class="cols-sm-4">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type="email" style="width:300px" class="form-control" name="email" id="email" value="${Email }" placeholder="@stevens.edu"/>
								</div>
							</div>
      	<br>
      <div style="margin-left: auto; color: #000;">
      <a href="/response.jsp">
		<input type="submit" style="-webkit-border-radius: 28;-moz-border-radius: 28;border-radius: 28px;font-family: Arial;color: #ffffff;font-size: 15px;background: #5c2040;padding: 10px 20px 10px 20px;text-decoration: none;" value="Click here to activate"/>    
	  </a>
	  </div>
	  </div>
     </form>
      

      <footer class="footer">
        <p>&copy; Yaoshuai 2016</p>
      </footer>

    </div>
  </body>
</html>
