<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<jsp:include page="CookieCheck.jsp" />
<%
String useremail = "";
Cookie[] cookies = request.getCookies();
if(cookies == null) {
    out.print("No cookie info");
 } else {
     for(int i=0; i<cookies.length; i++) {
        Cookie cookie = cookies[i];
        String name = cookie.getName();
        String value = cookie.getValue();
        if(name.equals("email")){
          useremail = value;
        }
     }
 } 
//get userid from previous page
if(useremail == null)
useremail = request.getParameter("Email");

//System.out.println(useremail+"  PH");
if(session.getAttribute(useremail)==null && session.getAttribute("email") == null){
//user did not login
response.sendRedirect("signin.jsp");
return;
}
if(request.getParameter("error")!=null){
  out.println("<span style=coclor:red>"+request.getParameter("error")+"</span>");
}%>
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<!--<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js"></script>-->
<script type="text/javascript" src="../static/js/jquery.dynatable.js"></script>
<!--<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC9RiLfbcMSmMZr3b2Yum9XHGmXKKw2TOg"></script>
   	<!--<script src="js/agency.js"></script>-->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="js/classie.js"></script>
<!-- validate script -->
<script src="/js/jquery.validate.min.js"></script>
<script src="js/jqBootstrapValidation.js"></script>
<script src="/js/signinValidate.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>userHome</title>


<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!-- Custom CSS -->
<link href="css/agency.css" rel="stylesheet">
<!--<link href="/css/gsdk-base.css" rel="stylesheet" />-->
<!--<link href="css/Login.css" rel="stylesheet">-->
<!--<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="../font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">-->

<!-- Custom Fonts -->
<!--<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">-->
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Grand+Hotel'
	rel='stylesheet' type='text/css'>
<!--<link href="/css/addFindWish.css" rel="stylesheet">-->
<!--<link href="../static/css/sb-admin-2.css" rel="stylesheet">-->
<!--<link href="/css/gsdk-checkbox-radio-switch.css" rel="stylesheet">
    <link href="/css/gsdk-sliders.css" rel="stylesheet">-->
<script src="../static/js/jquery-1.11.2.js"></script>

</head>
<body id="page-top" class="index">
	<div class="container-fluid" style="height: 100%; margin-top: 0px">
		<nav class="navbar navbar-default" style="height:5%"> <!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header page-scroll">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand page-scroll" href="#page-top" style="">Start
				Duckmates</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling request.getParameter("Email") -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul id="navigate" class="nav navbar-nav navbar-right">
				<li class="hidden"><a href="#page-top"></a></li>
				<li style="color: #0099cc"><form action="/FindUserHouseCL"
								method="post">
								<input type=hidden id="hidden 1" name="email"
									value="<%=useremail %>">
								<button type="submit" class="btn btn-link"
									style="color: #0099cc">My Lists</button>
							</form></li>

				<li role="presentation">
					<div class="dropdown">
						<button class="btn btn-lg btn-info btn-block dropdown-toggle"
							type="button" data-toggle="dropdown"
							style="height: auto; padding: 2">
							Add your list<span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li style="color: #0099cc"><form action="/addWish.jsp"
									method="post">
									<input type=hidden id="hidden 1" name="email"
										value="<%=useremail %>">
									<button type="submit" class="btn btn-link"
										style="color: #0099cc">House rentals</button>
								</form></li>
							<li style="color: #0099cc"><form action="/" method="post">
									<input type=hidden id="hidden 1" name=email
										value="<%=useremail %>">
									<button type="submit" class="btn btn-link"
										style="color: #0099cc">Roommate request</button>
								</form></li>
							<li style="color: #0099cc"><form action="/" method="post">
									<input type=hidden id="hidden 1" name=email
										value="<%=useremail %>">
									<button type="submit" class="btn btn-link"
										style="color: #0099cc">Sell items</button>
								</form></li>
						</ul>
					</div>
				</li>
				<!--<li class="dropdown" href="#login">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color:#0099cc">Sign in<span class="glyphicon glyphicon-user"></span><span class="caret"></span></a>
      <ul id="login-dp" class="dropdown-menu">
        <li>
           <div class="row">
              <div class="col-md-12">
                Login via
                <div class="social-buttons">
                  <a href="#" class="btn btn-fb"><i class="fa fa-facebook"></i> Facebook</a>
                  <a href="#" class="btn btn-tw"><i class="fa fa-twitter"></i> Twitter</a>
                </div>
                                or
                 <form class="form-signin" role="form" id="login" name="login" method="post" action="/LoginCL" accept-charset="UTF-8" id="login-nav">
                    <div class="form-group">
                       <label class="sr-only" for="inputEmail">Email address</label>
                       <input type="email" name="email" class="form-control" id="inputEmail" placeholder="Email address" required>
                    </div>
                    <div class="form-group">
                       <label class="sr-only" for="inputPassword">Password</label>
                       <input type="password" name="password" class="form-control" id="inputPassword" placeholder="Password" required>
                                             <div class="help-block text-right"><a href="" style="color:#0099cc">Forget the password ?</a></div>
                    </div>
                    <div class="form-group">
                       <button id="btnSignIn" type="button" class="btn btn-primary btn-block" onclick="validate();">Sign in</button>
                    </div>
                    <div class="checkbox">
                       <label class="checkbox">
                        <input type="checkbox" name="savetime" value="<%=24*60*60*7%>" checked>Remember me
                        </label>
                    </div>
                 </form>
              </div>
              <div class="bottom text-center">
                New here ? <a href="/signup.jsp"><b style="color:#0099cc">Join Us</b></a>
              </div>
           </div>
        </li>
      </ul>
        </li>-->
				<li role="presentation" style="margin-left: 0"><a
					href="/index.jsp" style="color: #0099cc">Logout</a></li>






			</ul>
		</div>
		<!-- /.navbar-collapse --> <!-- /.container-fluid --> </nav>

		<section id="services">
		<div class="container-fluid" style="height: 100%">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading">My Duckmates</h2>
					<h3 class="section-subheading text-muted"></h3>
				</div>
			</div>

			<div class="row text-center">
             <form action = "addFindWish.jsp" method="post">
				<a id="House" href="addFindWish.jsp">
					<div id="House01" class="col-md-4">
					<input type=hidden id="hidden 1" name="email" value="<%=request.getParameter("Email") %>">
						<span id="House02" class="fa-stack fa-4x" style="font-size: 600%;">
							<i class="fa fa-square fa-stack-2x text-primary"></i> <i
							class="fa fa-home fa-stack-1x fa-inverse"></i>
						</span>
						<button type = "submit" class="service-heading">Housing</button>
						<p class="text-muted"></p>
					</div>
				</a>
				</form>
				<div class="col-md-4">
					<span class="fa-stack fa-4x" style="font-size: 600%"> <i
						class="fa fa-square fa-stack-2x text-primary"></i> <i
						class="fa fa-hotel fa-stack-1x fa-inverse"></i>
					</span>
					<h4 class="service-heading">Roommates</h4>
					<p class="text-muted"></p>
				</div>
				<div id="House" class="col-md-4">
					<span class="fa-stack fa-4x" style="font-size: 600%"> <i
						class="fa fa-square fa-stack-2x text-primary"></i> <i
						class="fa fa-dollar fa-stack-1x fa-inverse"></i>
					</span>
					<h4 class="service-heading">Items</h4>
					<p class="text-muted"></p>
				</div>
			</div>

		</div>
		</section>
		<footer style="position:relative">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<span class="copyright">Copyright &copy; Duckmates 2016</span>
				</div>
				<div class="col-md-4">
					<ul class="list-inline social-buttons">
						<li><a href="#"><i class="fa fa-twitter"
								style="margin-top: 10px"></i></a></li>
						<li><a href="#"><i class="fa fa-facebook"
								style="margin-top: 10px"></i></a></li>
						<li><a href="#"><i class="fa fa-linkedin"
								style="margin-top: 10px"></i></a></li>
					</ul>
				</div>
				<div class="col-md-4">
					<ul class="list-inline quicklinks">
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="#">Terms of Use</a></li>
					</ul>
				</div>
			</div>
		</div>
		</footer>
	</div>


</body>
<script>
	/*$(document).ready(function(){
	$("#House01").mouseover(function(){
		document.getElementById("House01").innerHTML = "<p>Hello</p>";
		
	});
	$("#House01").mouseleave(function(){
		document.getElementById("House").innerHTML = '<div class="col-md-4">'+
        '<span class="fa-stack fa-4x" style="font-size:600%;">'+
        '<i class="fa fa-square fa-stack-2x text-primary"></i>'+
        '<i class="fa fa-home fa-stack-1x fa-inverse"></i>'+
    '</span>'+
    '<h4 class="service-heading">Housing</h4>'+
    '<p class="text-muted"></p>'+
	'</div>';
            
    
	});
	
});*/

</script>




</html>