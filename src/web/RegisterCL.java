package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RegisterCL
 */
@WebServlet("/RegisterCL")
public class RegisterCL extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterCL() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			response.setContentType("text/html;charset=utf-8"); 
			PrintWriter out = response.getWriter();
			UserBeanCL ubc = new UserBeanCL();
			String UserName = request.getParameter("username");
			String Email = request.getParameter("email");
			System.out.print(Email);
			//Email.toLowerCase();
			String PassWord = request.getParameter("password");
			if(!(UserName == null && Email == null && PassWord == null)){
				boolean check = ubc.Register(Email, UserName, PassWord);
				if(check == false){
					//request.setAttribute("error","Email-address already exist");
					//request.getRequestDispatcher("Register.jsp").forward(request, response);
					out.println("Email-address already exist");
				}
				else{
					String regex="[a-zA-Z0-9_\\-\\.]+@(stevens)+(\\.(edu))" ;
					if(Email.matches(regex)){
						request.setAttribute("Email", Email);
						String status = "success";
						request.setAttribute("status", status);
						HttpSession session = request.getSession();
						session.setAttribute("status", status);
						out.println("");
						//request.getRequestDispatcher("/signup.jsp").forward(request,response); 
					}
					else{	
						String status = "fail";
						request.setAttribute("status", status);
						HttpSession session = request.getSession();
						session.setAttribute("status", status);
						out.println("Invalid email address, you should need to use your stevens email address to register!");
						//request.getRequestDispatcher("/signup.jsp").forward(request,response); 
					}
				}
			}
			else{
				response.sendRedirect("signup.jsp");
			}
		
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}

}
