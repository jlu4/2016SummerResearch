<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

//System.out.println(useremail+"  PH");
if(session.getAttribute(useremail)==null && session.getAttribute("email") == null){
//user did not login
response.sendRedirect("signin.jsp");
return;
}
System.out.println("request.getParameter(success) ="+request.getParameter("success"));
System.out.println("request.getParameter(error) ="+request.getParameter("error"));
if(request.getParameter("success")!=null){
	out.println("<span style=coclor:red>"+request.getParameter("success")+"</span>");
}
else if(request.getParameter("error")!=null){
	out.println("<span style=coclor:red>"+request.getParameter("error")+"</span>");
}%>
<title>Insert title here</title>
</head>
<body>
<form action = "/addWish.jsp" method = "post">
<input type=hidden id=email name=email value="<%=request.getParameter("email") %>"> 
<button type = "submit">Continue Post Houses</button>
</form>
<form action = "/userHome.jsp" method = "post">
<input type=hidden id=email name=email value="<%=request.getParameter("email") %>"> 
<button type = "submit">Back to UserHome</button>
</form>
</body>
</html>