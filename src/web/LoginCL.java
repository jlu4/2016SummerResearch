package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
/**
 * Servlet implementation class LoginCL
 */
@WebServlet("/LoginCL")
public class LoginCL extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCL() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
		PrintWriter out = response.getWriter();
		//out.println("Hello world!");
		String Email = request.getParameter("email");
		String savetime=request.getParameter("savetime"); 
//		Email += "@stevens.edu";
		//Email.toLowerCase();
		String PassWord = request.getParameter("password");
		//out.println(UserName+" "+PassWord);
		//Use UserBeanCL
		UserBeanCL ubc=new UserBeanCL();
		UserBean currU = new UserBean();
		HttpSession session=request.getSession();
		currU = ubc.GetUser(Email, response, PassWord, savetime, session);
		if(ubc.CheckUser(Email, PassWord)){
			//legal user
			//create session in case of jump to welcome
			//1 get session
			HttpSession hs = request.getSession(true);
			//change session exist time
			hs.setMaxInactiveInterval(600);
			hs.setAttribute(Email, currU);
			//request.getRequestDispatcher("Welcome.jsp?Email="+Email).forward(request, response);
			response.sendRedirect("userHome.jsp?Email="+Email);
		}
		else{
			String error1="UserID or Password wrong, Please input again!";
				response.sendRedirect("signin.jsp?error="+error1);
		}
	        
	

	}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}

}
