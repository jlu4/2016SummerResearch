<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>Duckmates sign up</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">    
	<link href="/css/gsdk-base.css" rel="stylesheet" />
    <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
    <link href="css/agency.css" rel="stylesheet">
    <link href="css/Login.css" rel="stylesheet">
</head>

<body id="page-top" class="index">
<nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">Start Duckmates</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="index.jsp">Home</a>
                    </li>
                    
                  
                    <li class="dropdown" href="#login">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="">Login<span class="caret"></span></a>
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
                 <form class="form-signin" role="form" name="login" id="login" method="post" action="/LoginCL" accept-charset="UTF-8" id="login-nav">
                    <div class="form-group">
                       <label class="sr-only" for="email">Email address</label>
                       <input type="email" name="email" class="form-control" id="email" placeholder="Email address" required>
                    </div>
                    <div class="form-group">
                       <label class="sr-only" for="password">Password</label>
                       <input type="password" name="password" class="form-control" id="password" placeholder="Password" required>
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
        </li>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

<div class="image-container set-full-height" style="background-image: url('/img/wizard.jpg')">
   
    
    
    <!--   Big container   -->
    <div class="container">
        <div class="row">
        <div class="col-sm-8 col-sm-offset-2">
           
            <!--      Wizard container        -->   
            <div class="wizard-container"> 
                
                <div class="card wizard-card ct-wizard-orange" id="wizardProfile">
                    <form method="post" action="#" id="registerform" name="registerform">
                <!--        You can switch "ct-wizard-orange"  with one of the next bright colors: "ct-wizard-blue", "ct-wizard-green", "ct-wizard-orange", "ct-wizard-red"             -->
                
                    	<div class="wizard-header">
                        	<h3>
                        	   <b>BUILD</b> YOUR PROFILE <br>
                        	   <small>This information will let us know more about you.</small>
                        	</h3>
                    	</div>
                    	<ul>
                            <li><a href="#about" data-toggle="tab">Basic</a></li>
                            <li><a href="#account" data-toggle="tab">Status</a></li>
                            <li><a href="#submit" data-toggle="tab">Submit</a></li>
                        </ul>
                        
                        <div class="tab-content">
                            <div class="tab-pane" id="about">
                              <div class="row">
                                  <h4 class="info-text"> Let's start with the basic information</h4>
                                  
                                  <div class="col-sm-10 col-sm-offset-1">
                                  <div class="form-group">
                                  <label>Username <small>(required)</small></label>
                                  <input name="username" id="username" type="text" class="form-control">
                                  </div>
                                  </div>
                                  
                                  <div class="col-sm-10 col-sm-offset-1">
                                      <div class="form-group">
                                          <label>Stevens email address <small>(required)</small></label>
                                          <input id="emailreg" name="email" type="email" class="form-control" onkeyup="LowerCase(this.id)" placeholder="@stevens.edu">
                                      </div>
                                  </div>
                                  <div class="col-sm-10 col-sm-offset-1">
                                      <div class="form-group">
                                          <label>Password <small>(required)</small></label>
                                          <input id="passwordSignUp" name="password" type="password" class="form-control" placeholder="">
                                      </div>
                                  </div>
                                   <div class="col-sm-10 col-sm-offset-1">
                                      <div class="form-group">
                                          <label>Confirm password <small>(required)</small></label>
                                          <input id="confirm_password" name="confirm_password" type="password" class="form-control" placeholder="">
                                      </div>
                                  </div>
                              </div>
                            </div>
                            <div class="tab-pane" id="account">
                                <h4 class="info-text"> What's your status? (checkboxes) </h4>
                                <div class="row">
                                <div class="col-sm-4 col-sm-offset-1">
                                     <div class="picture-container">
                                          <div class="picture">
                                              <img src="/img/default-avatar.png" class="picture-src" id="wizardPicturePreview" title=""/>
                                              <input type="file" id="wizard-picture">
                                          </div>
                                          <h6>Choose Picture</h6>
                                      </div>
                                  </div>
                                  <div class="col-sm-6">
                                      <div class="form-group">
                                
                                        <label>First Name <small>(required)</small></label>
                                
                                          
                                          <input name="firstname" id="firstname" type="text" class="form-control" placeholder="" required>
                                          
                                      </div>
                                      <div class="form-group">
                                        <label>Last Name <small>(required)</small></label>
                                        <input name="lastname" id="lastname" type="text" class="form-control" placeholder="" required>
                                      </div>
                                  </div>
                                   
                                    
                                    <div class="col-sm-10 col-sm-offset-1">
                                        <div class="col-sm-4">
                                            <div class="choice" data-toggle="wizard-checkbox">
                                                <input type="checkbox" name="jobb" value="undergraduate">
                                                <div class="icon">
                                                    <i class="fa fa-book"></i>
                                                </div>
                                                <h6>Under Grad</h6>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="choice" data-toggle="wizard-checkbox">
                                                <input type="checkbox" name="jobb" value="graduate">
                                                <div class="icon">
                                                    <i class="fa fa-graduation-cap"></i>
                                                </div>
                                                <h6>Graduate</h6>
                                            </div>
                                            
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="choice" data-toggle="wizard-checkbox">
                                                <input type="checkbox" name="jobb" value="working">
                                                <div class="icon">
                                                    <i class="fa fa-briefcase"></i>
                                                </div>
                                                <h6>Working</h6>
                                            </div>
                                            
                                        </div>
                                    </div>
                                    <!--<div id="serverResponse"></div>-->
                                    
                                </div>
                            </div>
                            <div class="tab-pane" id="submit">
                            <div class="panel panel-success">
                            <div class="panel-heading">
                            <h4 class="info-text"><span class="glyphicon glyphicon-ok" style="font-size:300%"></span>Almost done!</h4>
                            </div>
                            </div>
                            <p id="serverResponse" style="color:red; text-align:center"></p>
                            


                            </div>
                           
                        </div>
                        <div class="wizard-footer">
                            <div class="pull-right">
                                <input type='button' class='btn btn-next btn-fill btn-warning btn-wd btn-sm' name='next' value='Next' />
                                <button type='button' id="btnSignUp" class='btn btn-finish btn-fill btn-info btn-wd btn-sm' name='btnSignUp' onclick="doRequestUsingPost();">
                                Finish</button>
        
                            </div>
                            
                            <div class="pull-left">
                                <input type='button' class='btn btn-previous btn-fill btn-default btn-wd btn-sm' name='previous' value='Previous' onclick="ClearMessage()"/>
                            </div>
                            <div class="clearfix"></div>
                        </div>	
                    </form>
                </div>
            </div> <!-- wizard container -->
        </div>
        </div><!-- end row -->
    </div> <!--  big container -->
    
    
    <div class="footer">
        <div class="container">
             
        </div>
    </div>

</div>

</body>
	

    <script>
var xmlHttp;  
function createXMLHttpRequest()  
{  
 if(window.ActiveXObject)  
 {  
  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");  
 }  
 else if(window.XMLHttpRequest)  
 {  
  xmlHttp=new XMLHttpRequest();  
 }  
}  
  
function createQueryString()  
{  
 var username=document.getElementById("username").value;  
 var email=document.getElementById("emailreg").value;  
 var password=document.getElementById("password").value;  
 var queryString="username=" + username + "&email=" + email + "&password=" + password;  
 return queryString;  
}  
  
function doRequestUsingGET()  
{  
 createXMLHttpRequest();  
 var queryString="./RegisterCL?";  
 queryString=queryString+createQueryString() + "&timeStamp=" + new Date().getTime();  
 xmlHttp.onreadystatechange=handleStateChange;  
 xmlHttp.open("GET",queryString,true);  
 xmlHttp.send(null);  
}  
  
function doRequestUsingPost()  
{ 
 createXMLHttpRequest();  
 var url="./RegisterCL?timeStamp=" + new Date().getTime();  
 var queryString=createQueryString();  
 xmlHttp.open("POST",url,true);  
 xmlHttp.onreadystatechange=handleStateChange;  
 xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
 xmlHttp.send(queryString);  
}  
  
  
function handleStateChange()  
{  
 if(xmlHttp.readyState==4)  
 {  
  if(xmlHttp.status==200)  
  {  
   parseResults();  
  }  
 }  
}  
  
function parseResults()  
{  
 var responseDiv=document.getElementById("serverResponse");
 var status = xmlHttp.responseText.length;
 var Email = document.getElementById("serverResponse")
 if(responseDiv.hasChildNodes())  
 {  
  responseDiv.removeChild(responseDiv.childNodes[0]);  
 }
 if(status == 1){
	 var Email = document.getElementById('email').value;
	 window.location="/Success.jsp?Email="+Email;
 }
 else{
 var responseText=document.createTextNode(xmlHttp.responseText);  
 responseDiv.appendChild(responseText);  
 Reset();
  }  
}
    </script>
    <script>
        
      	function Reset() {
    	    document.getElementById("registerform").reset();
    	    
      	}
      	function ClearMessage() {
      		document.getElementById("serverResponse").innerHTML = "";        	
      		}
    
    </script>
    
    
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		
	<!--   plugins 	 -->
	<script src="/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
	
    <!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
	<script src="/js/jquery.validate.min.js"></script>
	<script src="/js/signinValidate.js"></script>
	
    <!--  methods for manipulating the wizard and the validation -->
	<script src="/js/wizard.js"></script>
	<script src="/js/jqBootstrapValidation.js"></script>

</html>
