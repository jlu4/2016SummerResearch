package web;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  

@WebServlet(name="MailBackServlet",urlPatterns="/MailBackServlet")
public class MailBackServlet extends HttpServlet {  
    private static final long serialVersionUID = 1L;  
    private Connection ct=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	private DatabaseMetaData dmd = null; 
	public void close(){
		try{
			if(rs!=null){
				rs.close();
				rs=null;
			}
			if(ps!=null){
				ps.close();
				ps=null;
			}
			if(ct!=null){
				ct.close();
				ct=null;
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}
    public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        String registerID = request.getParameter("registerId");  
        if(registerID == null){  
            request.getRequestDispatcher("/signin.jsp").forward(request,response);  
           return ;  
        }  
         
        String registerName = (String)request.getSession().getAttribute(registerID);  
        System.out.println("registerID="+registerID);
        boolean flag = false;
		int x;
		try{
			System.out.println(registerID);
			ConnDB cd = new ConnDB();
			ct = cd.getConn();
			ps = ct.prepareStatement("select * from webuser where id="+"'"+registerID+"'");
			//System.out.println(ps);
			rs = ps.executeQuery();
			if(rs.next()){
				ps = ct.prepareStatement("UPDATE webuser SET state="+"'1' WHERE id="+"'"+registerID+"'");
				System.out.println(ps);
				x = ps.executeUpdate();
				flag = true;
			}
		
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			this.close();
		}
        
        
        if(registerName == null || registerName.equals("")){  
            request.getRequestDispatcher("/signin.jsp").forward(request,response);  
            return ;  
        }  
         
        request.setAttribute("registerName", registerName);  
        
        request.getRequestDispatcher("/response.jsp").forward(request,response);  
    }  
  
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        doGet(request, response);  
    }  
  
}  