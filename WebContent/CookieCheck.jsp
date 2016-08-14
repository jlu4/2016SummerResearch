<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>  
<%!  
    public static final String DBDRIVER = "org.postgresql.Driver" ;  
    public static final String DBURL = "jdbc:postgresql://127.0.0.1:5432/MyWeb" ;  
    public static final String DBUSER = "postgres1" ;  
    public static final String DBPASS = "123qwe" ;  
%> 
<%  
    Connection conn = null ;  
    PreparedStatement pstmt = null ;  
    ResultSet rs = null ;  
    boolean flag = false ;  // sign in successfully or not
%> 

<%  
    if(session.getAttribute("email")==null){  
        Cookie[] c=request.getCookies();  
        String userid=null;  
        String password=null;  
        if(c!=null){  
            for(int i=0;i<c.length;i++){  
                if("email".equals(c[i].getName())){  
                    userid = c[i].getValue() ;  // accept cookie infomation 
                    System.out.println("cookiecheck userid = "+userid);
                }  
                if("password".equals(c[i].getName())){  
                    password = c[i].getValue() ;    // accept cookie infomation
                    System.out.println("cookiecheck password = "+password);
                }  
            }  
            if(userid!=null&&password!=null){  
                try{  
                    Class.forName(DBDRIVER) ;  
                    conn = DriverManager.getConnection(DBURL,DBUSER,DBPASS) ;  
                    String sql = "SELECT id FROM webuser WHERE id=? AND password=?" ;  
                    pstmt = conn.prepareStatement(sql) ;  
                    pstmt.setString(1,userid) ;  
                    pstmt.setString(2,password) ;  
                    rs = pstmt.executeQuery() ;  
                    if(rs.next()){  
                        flag = true ;  
                        session.setAttribute("email",userid);  
                    }  
                }catch(Exception e){  
                }finally{  
                    try{  
                        conn.close() ;  
                    }catch(Exception e){  
                        e.printStackTrace();  
                    }  
                }  
            }  
        }  
    }  
%>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>