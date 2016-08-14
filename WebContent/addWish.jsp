<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<jsp:include page="CookieCheck.jsp"/> 
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
System.out.println("session.getAttribute(useremail)="+session.getAttribute(useremail));
System.out.println("session.getAttribute(email)="+session.getAttribute("email"));
if(session.getAttribute(useremail)==null && session.getAttribute("email") == null){
	//user did not login
	response.sendRedirect("signin.jsp");
	return;
	}
//System.out.println(useremail+"  PH");
if(session.getAttribute(useremail)==null && session.getAttribute("email") == null){
//user did not login
response.sendRedirect("signin.jsp");
return;
}
if(request.getParameter("error")!=null){
	out.println("<span style=coclor:red>"+request.getParameter("error")+"</span>");
}%>
<html lang="en">
<head>
	<meta charset="utf-8" />
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>Add post</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <link href='https://fonts.googleapis.com/css?family=Passion+One'
	rel='stylesheet' type='text/css'>
<!--<link href="../static/css/sb-admin-2.css" rel="stylesheet">-->

<link href="/css/bootstrap.min.css" rel="stylesheet" />
<link href="/css/gsdk-base.css" rel="stylesheet" />
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css"
	rel="stylesheet">
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
<link href="css/agency.css" rel="stylesheet">
<link href="css/dropdown.css" rel="stylesheet">
<link href="css/addWish.css" rel="stylesheet">
<script src="/js/jquery-1.10.2.js" type="text/javascript"></script>
<link href="../css/fileinput.css" media="all" rel="stylesheet"
	type="text/css" />

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
                    <li role="presentation"><a href="/userHome.jsp" style="color:#0099cc" class="page">My Duckmates</a></li>
	                <li role="presentation">
                    <li>
                        <a class="page-scroll" href="index.jsp" style="color:#0099cc" class="page">Home</a>
                    </li>
                    <li role="presentation" ><a href="/index.jsp" style="color:#0099cc" class="page">Logout</a></li>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

<div class="image-container set-full-height" style="background-image: url('/img/wizard-city.jpg')">
    
    <!--   Big container   -->
    <div class="container">
        <div class="row">
        <div class="col-sm-8 col-sm-offset-2">
           
            <!--      Wizard container        -->   
            <div class="wizard-container"> 
                <div class="card wizard-card ct-wizard-green" id="wizard">
                <form method="post" action="PostHouseCL" enctype="multipart/form-data">
                    <input type="hidden" id="email" name="email" value="<%=request.getParameter("email")%>">
                <!--        You can switch "ct-wizard-azzure"  with one of the next bright colors: "ct-wizard-blue", "ct-wizard-green", "ct-wizard-orange", "ct-wizard-red"             -->
                
                    	<div class="wizard-header">
                        	<h3>
                        	   <b>LIST</b> YOUR PLACE <br>
                        	   <small>This information will let us know more about your place.</small>
                        	</h3>
                    	</div>
                    	<ul>
                            <li><a href="#location" data-toggle="tab">Location</a></li>
									<!--<li><a href="#type" data-toggle="tab">Type</a></li>-->
									<li><a href="#facilities" data-toggle="tab">Facilities</a></li>
									<li><a href="#description" data-toggle="tab">Description</a></li>
									<li><a href="#type" data-toggle="tab">Pictures</a></li>
									<li><a href="#contacts" data-toggle="tab">Contacts</a></li>
                        </ul>
                        <div class="tab-content">
                            
                            <div class="tab-pane" id="location">
                              <div class="row">
                                  <div class="col-sm-12">
                                    <h4 class="info-text"> Let's start with the basic details</h4>
                                  </div>
                                  <div class="col-sm-7 col-sm-offset-1">
                                      <div class="form-group">
                                        <label class="control-label" for="address">Address</label>
                                        <input type="text" class="form-control" id="h_location" name="h_location" placeholder=""><span><input class="form-control" type="hidden" id="coordinate" name="coordinate"></span>
                                      </div>
                                  </div>
                                  <div class="col-sm-3">
                                       <div class="form-group">
                                            <label class="control-label" for="zipcode">Zip Code</label>
                                           <input type="number" id="postal_code" name="postal_code" placeholder="Zip Code" class="form-control">
                                            
                                          </div>
                                  </div>
                                  <div class="col-sm-5 col-sm-offset-1">
                                      <div class="form-group">
                                          <label class="control-label" for="city">City</label>
                                          <input type="text" id="locality" name="h_area" class="form-control">
                                          
                                      </div>
                                  </div>
                                  <div class="col-sm-3">
                                      <div class="form-group">
                                          <label class="control-label" for="price">Price</label>
                                          
                                              <input type="number" class="form-control" id="price" name="price" placeholder="$">
                                          
                                          
                                      </div>
                                  </div>
                              </div>
                            </div>
                            
                            <div class="tab-pane" id="facilities">
                                <h4 class="info-text">Tell us more details. </h4>
                                <div class="row">
                                    <div class="col-sm-5 col-sm-offset-1">
                                      <div class="form-group">
                                          <label>House/Apartment type</label>
                                          <select class="form-control" id="housetype" required="required" name="housetype">
                                            <option selected="" disabled="disabled">Select Bed/Bath</option>
                                              <optgroup label="1Bed">
                                                <option value="1B/1B">1B/1B</option>
                                              </optgroup>
                                              <optgroup label="2Bed">
                                                <option value="2B/1B">2B/1B</option>
                                                <option value="2B/1.5B">2B/1.5B</option>
                                                <option value="2B/2B">2B/2B</option>
                                              </optgroup>
                                              <optgroup label="3Bed">
                                                <option value="3B/1B">3B/1B</option>
                                                <option value="3B/1.5B">3B/1.5B</option>
                                                <option value="3B/2B">3B/2B</option>
                                                <option value="3B/2.5B">3B/2.5B</option>
                                                <option value="3B/3B">3B/3B</option>
                                              </optgroup>
                                              <optgroup label="4Bed">
                                                <option value="4B/2B">4B/2B</option>
                                                <option value="4B/2.5B">4B/2.5B</option>
                                                <option value="4B/3B">4B/3B</option>
                                              </optgroup>
                                              <optgroup label="5Bed">
                                                <option value="5B/2B">5B/2B</option>
                                                <option value="5B/2.5B">5B/2.5B</option>
                                                <option value="5B/3B">5B/3B</option>
                                                <option value="5B/4B">5B/4B</option>
                                                <option value="Other">Other</option>
                                                </optgroup>
                                          </select>
                                      </div>
                                    </div>
                                    <div class="col-sm-5">
                                      <div class="form-group">
                                          <label>Are utilities included?</label>
                                          <select class="form-control">
                                            <option disabled="" selected="">- response -</option>
                                              <option>Yes</option>
                                              <option>No</option>
                                          </select>
                                      </div>
                                     </div>
                                     <div class="col-sm-10 col-sm-offset-1">
                                      <div class="form-group">
                                          <label>What kind of room are you sharing?</label>
                                          <select class="form-control" id="roomtype" name="roomtype" required="required">
                                            <option disabled="disabled" selected="">- response -</option>
                                            <option value="Bedroom">Bedroom</option>
                                            <option value="Living room">Living room</option>
                                            <option value="Other">Other</option>
                                          </select>
                                       </div>
                                      </div>
                                      <div class="col-sm-3 col-sm-offset-1">
                                       <div class="form-group">
                                          <label>Your gender</label>
                                          
                                          <select class="form-control" id="sex" name="sex" required="required">
                                            <option disabled="disabled" selected=""> Gender </option>
                                            <option value="Male">Male</option>
		                                    <option value="Female">Female</option>
                                          </select>
                                       </div>
                                      </div>
                                     <div class="col-sm-4">
                                       <div class="form-group">
                                          <label>Required gender</label>
                                          <select class="form-control" id="req_gender" name="req_gender">
                                            <option disabled="disabled" selected="true"> Select </option>
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                            <option value="unlimited">Unlimited</option>
                                          </select>
                                       </div>
                                      </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="description">
                                <div class="row">
                                    <h4 class="info-text"> Drop us a small description. </h4>
                                    <div class="col-sm-6 col-sm-offset-1">
                                        <div class="form-group">
                                            <label class="control-label" for="title">Title</label>
                                            <input type="text" id="title" name="title" class="form-control" placeholder="Title" required="required">
                                        </div>
                                    </div>
                                    <!--<div class="col-sm-4">
                                        <div class="form-group">
                                            <label class="control-label" for="title">Hi</label>
                                            <p class="description" class="form-control">A nice title would be useful!</p>
                                        </div>
                                    </div>-->
                                    <div class="col-sm-6 col-sm-offset-1">
                                         <div class="form-group">
                                            <label>Place description</label>
                                           <textarea class="form-control" placeholder="Your description *" id="houseinfo" name="houseinfo" row="9" required="required" style="height:auto; min-height:120px"></textarea>
                                
                                          </div>
                                    </div>
                                    <div class="col-sm-4">
                                         <div class="form-group">
                                            <label>Example</label>
                                            <p class="description">"Really good fully renovated apartment in Hoboken, looking for nice roommates"</p>
                                          </div>
                                    </div>
                                    
                                </div>
                            </div>
                            <div class="tab-pane" id="type">

										<h4 class="info-text">Upload your pictures.</h4>
										<div class="col-sm-12">
											<div class="form-group">
												<input id="file-5" name="fileName" class="file" type="file"
													multiple data-preview-file-type="any" data-upload-url="#">

											</div>
										</div>

									</div>
                            <div class="tab-pane" id="contacts">
                              <div class="row">
                                  <div class="col-sm-12">
                                    <h4 class="info-text"> How could we contact you?</h4>
                                  </div>
                                  <div class="col-sm-5 col-sm-offset-1">
                                      <div class="form-group">
                                        <label class="control-label" for="phonenumber">Phone number</label>
                                        <input type="number" class="form-control" id="phonenumber" name="phonenumber" placeholder="" required="required" >
                                        
                                      </div>
                                  </div>
                                  <div class="col-sm-5">
                                       <div class="form-group">
                                            <label class="control-label" for="email">Email address</label>
                                           <input type="text" id="email" name="email" placeholder="xx@xxx" class="form-control" required="required">
                                            
                                          </div>
                                  </div>
                                  <div class="col-sm-5 col-sm-offset-1">
                                      <div class="form-group">
                                          <label class="control-label" for="city">Wechat ID</label>
                                          <input type="text" id="wechatid" name="wechatid" class="form-control" placeholder="Optional">
                                          
                                      </div>
                                  </div>
                                  <div class="col-sm-5">
                                      <div class="form-group">
                                          <label class="control-label" for="qq">MSN/QQ</label>
                                          
                                              <input type="text" class="form-control" id="qq" name="qq" placeholder="Optional">
                                          
                                          
                                      </div>
                                  </div>
                              </div>
                            </div>
                        </div>
                        <div class="wizard-footer">
                            	<div class="pull-right">
                                    <input type='button' class='btn btn-next btn-fill btn-success btn-wd btn-sm' name='next' value='Next' />
                                    <button type='submit' class='btn btn-finish btn-fill btn-success btn-wd btn-sm' name='finish'>Finish</button>
        
                                </div>
                                <div class="pull-left">
                                    <input type='button' class='btn btn-previous btn-fill btn-default btn-wd btn-sm' name='previous' value='Previous' />
                                </div>
                                <div class="clearfix"></div>
                        </div>	
                    </form>
                </div>
            </div> <!-- wizard container -->
        </div>
        </div> <!-- row -->
    </div> <!--  big container -->
   
    <div class="footer">
        <div class="container">
             
        </div>
    </div>
    
</div>

</body>
<script>
	$(document).ready(function() {

		$(".page").hover(function() {
			$(this).css("color", "#fed136");
		});
		$(".page").mouseleave(function() {
			$(this).css("color", "#0099cc");
		});
		$(".btn-link").hover(function() {
			$(this).css("color", "#fed136");
		});
		$(".btn-link").mouseleave(function() {
			$(this).css("color", "#0099cc");
		});
	});
</script>

   <script src="../js/fileinput.js" type="text/javascript"></script>
<script src="/js/addWish.js" type="text/javascript"></script>
<script src="/js/bootstrap.min.js" type="text/javascript"></script>

<!--   plugins 	 -->
<script src="/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>

<!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
<script src="/js/jquery.validate.min.js"></script>

<!--  methods for manipulating the wizard and the validation -->
<script src="/js/wizard.js"></script>
<!--<script type="text/javascript" src="../static/js/jquery.dynatable.js"></script>-->
<!--   plugins 	 -->
<script src="js/jqBootstrapValidation.js"></script>
<!--<script src="js/contact_me.js"></script>-->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="js/classie.js"></script>
<script src="js/cbpAnimatedHeader.js"></script>


<!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->


<!--  methods for manipulating the wizard and the validation -->

<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC9RiLfbcMSmMZr3b2Yum9XHGmXKKw2TOg&libraries=places&callback=initAutocomplete"
	async defer></script>

</html>


    

