<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  <script>

  
  </script>
   <script>
  function getEmail(){
  var loc = location.href;
  var n1 = loc.length;//地址的总长度
  var n2 = loc.indexOf("=");//取得=号的位置
  var id = loc.substr(n2+1, n1-n2);//从=号后面的内容
  return id;
  }
    //document.write(id)
  </script>
    <title>Success</title>

   
    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

    <link href="http://getbootstrap.com/examples/jumbotron-narrow/jumbotron-narrow.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">

		<!-- Website CSS style -->
    <link rel="stylesheet" type="text/css" href="assets/css/main.css">

		<!-- Website Font style -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		
		<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
    <link href="../static/css/signup.css" rel="stylesheet">
    <script src="../static/js/jquery-1.11.2.js"></script>
    <script src="../static/js/signUp.js"></script>
    <script type="text/javascript">
    	function response() {
    		document.getElementById("res").innerHTML="We have sent verification to you email, please check your mailbox!"
    	}
    </script>
   
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
        <div class="alert alert-success">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Success!</strong> You have successfuly signed up for Duck Life!<span> </span><span><a href="/signin.jsp">Login here</a></span>
  </div>
      <form action="/RegisterServlet" method="post">  
      
	  <div class="alert alert-info">
	  	Please submit your email address to activate your account!
	  	</div>
      <!--<font size="5" color="red">Please summit to activate your account before login :</font><br/>--> 
      <!--EmailAddress: <input type="text" name=email value=${Email } onfocus="this.blur()" /><br/>-->
      <div class="form-group">
      	<label for="email" class="cols-sm-2 control-label">Email address</label>
      	<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type="email" class="form-control" style="width:300px" name="email" id="email" placeholder="@stevens.edu"/><script>document.getElementById("email").value=getEmail();</script>
								</div>
							</div>
      	<br>
      <div style="margin-left: auto; color: #000;">
      
		<input id"=response" type="submit" onclick="response()" style="-webkit-border-radius: 28;-moz-border-radius: 28;border-radius: 28px;font-family: Arial;color: #ffffff;font-size: 20px;background: #5c2040;padding: 10px 20px 10px 20px;text-decoration: none;" value="Click here to activate"/>  <span id="res"> </span>  
	  
	  </div>
	  </div>
     </form>
      

      <footer class="footer">
        <p>&copy; Yaoshuai 2016</p>
      </footer>

    </div>
  </body>
</html>
