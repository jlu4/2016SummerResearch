package web;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class PostHouseCL
 */
@WebServlet("/FindUserHouseCL")
public class FindUserHouseCL extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindUserHouseCL() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			//response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			String email = request.getParameter("email");
			HouseBeanCL hbc= new HouseBeanCL();
			List<HouseBean> houseList = hbc.findUserHouse(email);
			request.setAttribute("houseList", houseList); 
			HttpSession session = request.getSession();
			session.setAttribute("houseList", houseList);
			request.getRequestDispatcher("/updateHouse.jsp").forward(request,response);
			
			
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}

}
