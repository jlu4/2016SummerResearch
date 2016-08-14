package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PostHouseCL
 */
@WebServlet("/UpdateHouseCL")
public class UpdateHouseCL extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateHouseCL() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			//response.setContentType("text/html");
			response.setContentType("text/html;charset=utf-8"); 
			PrintWriter out = response.getWriter();
			String email = request.getParameter("email");
			System.out.println(email);
			String title = request.getParameter("title");
			System.out.println(title);
			String h_location = request.getParameter("h_location");
			//In order keep database data consistency, reduce redundancy
			h_location = h_location.toLowerCase(); 
			System.out.println(h_location);
			String h_area = request.getParameter("h_area");
			System.out.println(h_area);
			String housetype = request.getParameter("housetype");
			System.out.println(housetype);
			String roomtype = request.getParameter("roomtype");
			System.out.println(roomtype);
			String sex = request.getParameter("sex");
			System.out.println(sex);
			String wechatid = request.getParameter("wechatid");
			System.out.println(wechatid);
			String qq = request.getParameter("qq");
			System.out.println(qq);
			String phonenumber = request.getParameter("phonenumber");
			System.out.println(phonenumber);
			String price = request.getParameter("price");
			System.out.println(price);
			String houseinfo = request.getParameter("houseinfo");
			System.out.println(houseinfo);
			String del = request.getParameter("check");
			System.out.println("del="+del);
			HouseBeanCL hbc= new HouseBeanCL();
			if(del.equals("true")){
				try{
					//response.setCharacterEncoding("UTF-8");
					boolean check = hbc.deleteHouse(h_location);
					if(check == false){
						//houseinfo already exist
						request.setAttribute("email", email);
						HttpSession session = request.getSession();
						session.setAttribute("email", email);
						out.println("House information already exist!");
						//Thread.sleep(5000);
						//response.sendRedirect("PostHouse.jsp?email="+email+"&error="+error1);
					}
					else{
						//post successed
						request.setAttribute("email", email);
						HttpSession session = request.getSession();
						session.setAttribute("email", email);
						out.println("House information update successful!");
						//response.sendRedirect("userHome.jsp?email="+email+"&success="+success1);
					}
					/*request.setAttribute("houseList", houseList); 
					HttpSession session = request.getSession();
					session.setAttribute("houseList", houseList);*/
					//request.getRequestDispatcher("/updateHouse.jsp").forward(request,response);
					
					
				}
				catch(Exception ex){
					ex.printStackTrace();
				}
			}
			else if(email != null && h_location != null && h_area != null){
				boolean check = hbc.updatehouse(email, title, h_location, h_area, housetype, roomtype, sex, wechatid, qq, phonenumber, price, houseinfo);
				System.out.println(check);
				if(check == false){
					//houseinfo already exist
					request.setAttribute("email", email);
					HttpSession session = request.getSession();
					session.setAttribute("email", email);
					out.println("House information already exist!");
					//Thread.sleep(5000);
					//response.sendRedirect("PostHouse.jsp?email="+email+"&error="+error1);
				}
				else{
					//post successed
					request.setAttribute("email", email);
					HttpSession session = request.getSession();
					session.setAttribute("email", email);
					out.println("House information update successful!");
					//response.sendRedirect("userHome.jsp?email="+email+"&success="+success1);
				}
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}

}