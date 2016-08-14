<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
useremail = request.getParameter("email");
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ShowHouses</title>
<script src="../static/js/jquery-1.11.2.js"></script>
<script>
	function show() {
		document.getElementById('show').style.display = 'block';
	}
	function hide() {
		document.getElementById('show').style.display = 'none';
	}
</script>

<script>
	var xmlHttp;
	function createXMLHttpRequest() {
		if (window.ActiveXObject) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		} else if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		}
	}

	function createQueryString(m) {
		var a = $('input[name="housetype"]');
		var b = $('input[name="gender"]');
		var c = $('input[name="roomtype"]');
		var d = $('input[name="area"]');
		var e = $('input[name="rss_ids"]');
		var f = $('input[name="location"]');
		var g = $('input[name="price"]');
		var h = $('input[name="houseinfo"]');
		var i = $('input[name="phone"]');
		var j = $('input[name="wechat"]');
		var k = $('input[name="qq"]');
		var l = $('input[name="email"]');
		var n = $('input[name="check"]');
		var housetype = a[m].value;
		var sex = b[m].value;
		var roomtype = c[m].value;
		var h_area = d[m].value;
		var title = e[m].value;
		var h_location = f[m].value;
		var price = g[m].value;
		var houseinfo = h[m].value;
		var phonenumber = i[m].value;
		var wechatid = j[m].value;
		var qq = k[m].value;
		var email = l[m].value;
		var check = n[m].checked;
		//  alert(n[m].value);
		var queryString = "email=" + email + "&title=" + title + "&h_location="
				+ h_location + "&h_area=" + h_area + "&housetype=" + housetype
				+ "&roomtype=" + roomtype + "&sex=" + sex + "&wechatid="
				+ wechatid + "&qq=" + qq + "&phonenumber=" + phonenumber
				+ "&price=" + price + "&houseinfo=" + houseinfo + "&check="
				+ check;
		return queryString;
	}

	function doRequestUsingGET() {
		createXMLHttpRequest();
		var queryString = "./UpdateHouseCL?";
		queryString = queryString + createQueryString() + "&timeStamp="
				+ new Date().getTime();
		xmlHttp.onreadystatechange = handleStateChange;
		xmlHttp.open("GET", queryString, true);
		xmlHttp.send(null);
	}

	function doRequestUsingPost() {
		createXMLHttpRequest();
		var url = "./UpdateHouseCL?timeStamp=" + new Date().getTime();
		for (var m = 0; m < 100; m++) {
			var queryString = createQueryString(m);
			xmlHttp.open("POST", url, true);
			xmlHttp.onreadystatechange = handleStateChange;
			xmlHttp.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xmlHttp.send(queryString);
		}
	}

	function handleStateChange() {
		if (xmlHttp.readyState == 4) {
			if (xmlHttp.status == 200) {
				parseResults();
			}
		}
	}

	function parseResults() {
		var responseDiv = document.getElementById("serverResponse");
		var status = xmlHttp.responseText.length;
		var Email = document.getElementById("serverResponse")
		if (responseDiv.hasChildNodes()) {
			responseDiv.removeChild(responseDiv.childNodes[0]);
		}
		var responseText = document.createTextNode(xmlHttp.responseText);
		alert(xmlHttp.responseText);
		window.location.reload();
		responseDiv.appendChild(responseText);

	}
</script>

<style>
.show {
	line-height: 100px;
	text-align: center;
	width: 100px;
	height: 100px;
	background: #95C8ED;
}
</style>
</head>

<body>


	<form action="#" method="post" id="housesform" name="housesform">
		<button type="button" id="update" name="update"
			onclick="doRequestUsingPost();">Update</button>
		<div id="serverResponse"></div>
		<br /> <br /> <br />
		<c:forEach var="bean" varStatus="status" items="${houseList}">
--------------------------------------------------------------------------------------
<br />
No: <input type="text" name="num" id="num" value="${ status.index + 1}"
				disabled />
			<br />
Title: <input type="text" name="rss_ids" id="rss_ids"
				value="${bean.gettitle()}" />
			<br /> 
Description: <input type="text" name="houseinfo" id="houseinfo"
				value="${bean.gethouseinfo()}" />
			<br /> 
Location: <input type="text" name="location" id="location"
				value="${bean.geth_location()}" disabled />
			<br /> 
Area: <input type="text" name="area" id="area"
				value="${bean.geth_area()}" disabled />
			<br /> 
HouseType: <input type="text" name="housetype" id="housetype"
				value="${bean.gethousetype()}" />
			<br /> 
Wechat: <input type="text" name="wechat" id="wechat"
				value="${bean.getwechatid()}" />
			<br /> 
RequireGender: <input type="text" name="gender" id="gender"
				value="${bean.getsex()}" />
			<br /> 
QQ: <input type="text" name="qq" id="qq" value="${bean.getqq()}" />
			<br /> 
Phone: <input type="text" name="phone" id="phone"
				value="${bean.getphonenumber()}" />
			<br /> 
Price: <input type="text" name="price" id="price"
				value="${bean.getprice()}" />
			<br /> 
Roomtype: <input type="text" name="roomtype" id="roomtype"
				value="${bean.getroomtype()}" />
			<br /> 
Email: <input type="text" name="email" id="email"
				value="${bean.getid()}" disabled />
			<br />
Want to delete? <input type="checkbox" name="check" id="check">
			<br />
			<br />



		</c:forEach>

	</form>

</body>
</html>