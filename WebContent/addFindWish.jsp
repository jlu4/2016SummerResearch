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
	if (cookies == null) {
		out.print("No cookie info");
	} else {
		for (int i = 0; i < cookies.length; i++) {
			Cookie cookie = cookies[i];
			String name = cookie.getName();
			String value = cookie.getValue();
			if (name.equals("email")) {
				useremail = value;
			}
		}
	}
	//get userid from previous page
	if (useremail == null)
		useremail = request.getParameter("email");
	//System.out.println(useremail+"  PH");
	/* if(session.getAttribute(useremail)==null && session.getAttribute("email") == null){
	//user did not login
	response.sendRedirect("signin.jsp");
	} */
	if (request.getParameter("error") != null) {
		out.println("<span style=color:red>" + request.getParameter("error") + "</span>");
	}
%>
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="../static/js/jquery-1.11.2.js"></script>
<!--<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js"></script>-->
<script type="text/javascript" src="../static/js/jquery.dynatable.js"></script>
<script
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC9RiLfbcMSmMZr3b2Yum9XHGmXKKw2TOg"></script>
<!--<script src="js/agency.js"></script>-->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="js/classie.js"></script>
<!-- validate script -->
<script src="/js/jquery.validate.min.js"></script>
<script src="js/jqBootstrapValidation.js"></script>
<script src="/js/signinValidate.js"></script>
<script src="/js/addFindWish.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Findhouse</title>


<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!-- Custom CSS -->
<link href="css/agency.css" rel="stylesheet">
<link href="css/Login.css" rel="stylesheet">
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
<link href="/css/addFindWish.css" rel="stylesheet">
<link href="../static/css/sb-admin-2.css" rel="stylesheet">
<link href="/css/gsdk-checkbox-radio-switch.css" rel="stylesheet">
<link href="/css/gsdk-sliders.css" rel="stylesheet">


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

		<!-- Collect the nav links, forms, and other content for toggling -->
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
				<li><a class="page-scroll" href="userHome.jsp"
					style="color: #0099cc">Home</a></li>
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
										value="<%=useremail%>">
									<button type="submit" class="btn btn-link"
										style="color: #0099cc">House rentals</button>
								</form></li>
							
							<li style="color: #0099cc"><form action="/" method="post">
									<input type=hidden id="hidden 1" name=email
										value="<%=useremail%>">
									<button type="submit" class="btn btn-link"
										style="color: #0099cc">Roommate request</button>
								</form></li>
							<li style="color: #0099cc"><form action="/" method="post">
									<input type=hidden id="hidden 1" name=email
										value="<%=useremail%>">
									<button type="submit" class="btn btn-link"
										style="color: #0099cc">Sell items</button>
								</form></li>
						</ul>
					</div>
				</li>
				<li class="dropdown" href="#login"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"
					style="color: #0099cc">Sign in<span
						class="glyphicon glyphicon-user"></span><span class="caret"></span></a>
					<ul id="login-dp" class="dropdown-menu">
						<li>
							<div class="row">
								<div class="col-md-12">
									Login via
									<div class="social-buttons">
										<a href="#" class="btn btn-fb"><i class="fa fa-facebook"></i>
											Facebook</a> <a href="#" class="btn btn-tw"><i
											class="fa fa-twitter"></i> Twitter</a>
									</div>
									or
									<form class="form-signin" role="form" id="login" name="login"
										method="post" action="/LoginCL" accept-charset="UTF-8"
										id="login-nav">
										<div class="form-group">
											<label class="sr-only" for="inputEmail">Email address</label>
											<input type="email" name="email" class="form-control"
												id="inputEmail" placeholder="Email address" required>
										</div>
										<div class="form-group">
											<label class="sr-only" for="inputPassword">Password</label> <input
												type="password" name="password" class="form-control"
												id="inputPassword" placeholder="Password" required>
											<div class="help-block text-right">
												<a href="" style="color: #0099cc">Forget the password ?</a>
											</div>
										</div>
										<div class="form-group">
											<button id="btnSignIn" type="button"
												class="btn btn-primary btn-block" onclick="validate();">Sign
												in</button>
										</div>
										<div class="checkbox">
											<label class="checkbox"> <input type="checkbox"
												name="savetime" value="<%=24 * 60 * 60 * 7%>" checked>Remember
												me
											</label>
										</div>
									</form>
								</div>
								<div class="bottom text-center">
									New here ? <a href="/signup.jsp"><b style="color: #0099cc">Join
											Us</b></a>
								</div>
							</div>
						</li>
					</ul></li>
				<li role="presentation" style="margin-left: 0"><a
					href="/index.jsp" style="color: #0099cc">Logout</a></li>






			</ul>
		</div>
		<!-- /.navbar-collapse --> <!-- /.container-fluid --> </nav>
		<!--<div class="page-header" style="margin-top:-20px; height:10%">
        <nav style="height:30%; margin-top:5px; margin-bottom:10px">
          <ul class="nav nav-pills pull-right" style="margin-top:0">
            <li style="margin-left:0"><a href="#"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
             <li role="presentation" style="margin-left:0"><a style="color:#A52A2A" target="_blank" href="https://shibboleth.stevens.edu/idp/Authn/UserPassword">MyStevens</a></li>
	           <li role="presentation" style="margin-left:0"><a href="/userHome.jsp" >Home</a></li>
               
	           
               <li role="presentation" style="margin-left:0"><a href="/index.jsp">Logout</a></li>
          </ul>
        </nav>
          <h3 style="color:brown; margin-top:0">Duckmates</h3>
      </div>-->
		<div id="navbar">
			<form method="post" action="#" id="searchform" name="searchform">
				<input type=hidden id=email name=email
					value="<%=request.getParameter("email")%>">

				<nav class="navbar navbr-ct-blue" role="navigation"
					style="margin-top:40x; height:75%"> <!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>

				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="myNavbar"
					style="border-radius: 6px">
					<ul class="nav navbar-nav">
						<li class="dropdown"><select class="form-control" id="h_area"
							name="h_area" style="margin-top: 5px"
							onchange="doRequestUsingPost()">
								<option selected="true"
									value="'Jersey City' OR h_area='Union City' OR h_area='Hoboken' OR h_area='Weehawken' OR h_area='New Port' OR h_area='Other'">Area</option>

								<option value="'Jersey City'">Jersey City</option>
								<option value="'Union City'">Union City</option>
								<option value="'Hoboken'">Hoboken</option>
								<option value="'Weehawken'">Weehawken</option>
								<option value="'New Port'">New Port</option>
								<option value="'Other'">Other</option>
						</select></li>
						<li class="dropdown"><select class="form-control"
							id="house_type" required="required" style="margin-top: 5px"
							name="housetype" onchange="doRequestUsingPost()">
								<option selected="true"
									value="'1B/1B' OR housetype = '2B/1B' OR housetype = '2B/1.5B' OR housetype = '2B/2B' OR housetype = '3B/1B'
    OR housetype = '3B/1.5B' OR housetype = '3B/2B' OR housetype = '3B/2.5B' OR housetype = '3B/3B' OR housetype = '4B/2B'
    OR housetype = '4B/2.5B' OR housetype = '4B/3B' OR housetype = '5B/2B' OR housetype = '5B/2.5B' OR housetype = '5B/3B'
    OR housetype = '5B/4B' OR housetype = 'Other'">House
									type</option>

								<optgroup label="1Bed">
									<option value="'1B/1B'">1B/1B</option>
								</optgroup>
								<optgroup label="2Bed">
									<option value="'2B/1B'">2B/1B</option>
									<option value="'2B/1.5B'">2B/1.5B</option>
									<option value="'2B/2B'">2B/2B</option>
								</optgroup>
								<optgroup label="3Bed">
									<option value="'3B/1B'">3B/1B</option>
									<option value="'3B/1.5B'">3B/1.5B</option>
									<option value="'3B/2B'">3B/2B</option>
									<option value="'3B/2.5B'">3B/2.5B</option>
									<option value="'3B/3B'">3B/3B</option>
								</optgroup>
								<optgroup label="4Bed">
									<option value="'4B/2B'">4B/2B</option>
									<option value="'4B/2.5B'">4B/2.5B</option>
									<option value="'4B/3B'">4B/3B</option>
								</optgroup>
								<optgroup label="5Bed">
									<option value="'5B/2B'">5B/2B</option>
									<option value="'5B/2.5B'">5B/2.5B</option>
									<option value="'5B/3B'">5B/3B</option>
									<option value="'5B/4B'">5B/4B</option>
									<option value="'Other'">Other</option>
								</optgroup>
						</select></li>
						<li class="dropdown"><select class="form-control"
							id="room_type" name="roomtype" style="margin-top: 5px"
							required="required" onchange="doRequestUsingPost()">
								<option selected="true"
									value="'Bedroom' OR roomtype='Living room' OR roomtype='Other'">Room
									type</option>

								<option value="'Bedroom'">Bedroom</option>
								<option value="'Living room'">Living room</option>
								<option value="'Other'">Other</option>
						</select></li>
						<li class="dropdown"><select class="form-control" id="sex"
							name="sex" style="margin-top: 5px" required
							onchange="doRequestUsingPost()">
								<option selected="true" value="'Male' OR sex='Female'">Gender</option>

								<option value="'Male'">Male</option>
								<option value="'Female'">Female</option>
						</select></li>
						<li class="dropdown">
							<button class="btn btn-default dropdown-toggle" type="button"
								data-toggle="dropdown" style="margin-top: 5px">
								Price<span class="caret"></span>
							</button>
							<ul class="dropdown-menu" style="border-radius: 6px">
								<li><label style="color: grey; margin-top:">min</label>
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-dollar fa" aria-hidden="true"></i></span> <input
											type="number" class="form-control" name="minprice"
											id="minprice" style="width: 100%; max-width: 80px" value="0"
											required />
									</div></li>
								<li><label style="color: grey; margin-top:">max</label>
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-dollar fa" aria-hidden="true"></i></span> <input
											type="number" class="form-control" name="maxprice"
											id="maxprice" style="width: 100%; max-width: 80px"
											value="4000" required />
									</div></li>
							</ul>
						</li>

						<li>
							<button type="button" id="btnSelect" class="btn btn-success"
								style="margin-top: 5px" value="POST"
								onclick="doRequestUsingPost();">Search</button>
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<button class="btn btn-default dropdown-toggle" type="button"
								data-toggle="dropdown" style="margin-top: 5px">
								Sort by<span class="caret"></span>
							</button>
							<ul class="dropdown-menu" style="border-radius: 6px">
								<li>
									<button class="btn btn-success" type="button"
										onclick="SortLowToHigh()">Price low to high</button>
								</li>
								<li>
									<button class="btn btn-warning" type="button"
										onclick="SortHighToLow()">Price high to low</button>
								</li>
							</ul>
						</li>
					</ul>
				</div>
				</nav>
			</form>
		</div>

		<div class="container-fluid" style="height: 100%">
			<div class="row" style="height: 100%">

				<div class="col-sm-8 col-md-8" id="map_container">
					<div id="map"></div>
				</div>

				<div class="col-sm-4 col-md-4" id="ResultContainer">
					<div id="Results"></div>
					<!--<iframe frameborder="0" id="Results" name="Results">
	</iframe>-->
				</div>
			</div>
		</div>
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
	
</script>




</html>