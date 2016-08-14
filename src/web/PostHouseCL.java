package web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

/**
 * Servlet implementation class PostHouseCL
 */
@WebServlet("/PostHouseCL")
public class PostHouseCL extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String uploadPath = "/home/junye/workspace11/webproject/webproject02/WebContent/static/Uploads/houseinfoimg"; //D:\BitBucket\Test\WebContent\WEB-INF\static\\upload
    private String tempPath = "/Users/Eric/temPath"; // temp file repository
    File tempPathFile;   
    private String email;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostHouseCL() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			  //String uid;
			   //very important!!!
			   //set map as a field to store normal data
			   Map<String,String> map = new TreeMap<String, String>();
			   response.setContentType("text/html;charset=gbk");
			   //System.out.println(uid);
			   // Create a factory for disk-based file items
	           DiskFileItemFactory factory = new DiskFileItemFactory();
	           // Set factory constraints
	           factory.setSizeThreshold(4096); // set buffer size=4k
	           factory.setRepository(tempPathFile);// set buffer path
	           // Create a new file upload handler
	           ServletFileUpload upload = new ServletFileUpload(factory);
	           // Set overall request size constraint
	           //upload.setSizeMax(419430400); // 4MB
	           List<FileItem> items = upload.parseRequest(new ServletRequestContext(request));// get all files from web
	           Iterator<FileItem> i = items.iterator();
               ArrayList<String> uimg = new ArrayList<String>();  
               String uimgpath = "";
               uploadPath = "/home/junye/workspace11/webproject/webproject02/WebContent/static/Uploads/houseinfoimg";
	           while (i.hasNext()) {
	              FileItem fi = (FileItem) i.next();
	              if(fi.isFormField()){
	            	  String key = fi.getFieldName();
	            	//get name
	            	  String value = fi.getString("gbk");
	            	 //store it into map
	            	  map.put(key,value);
	            	
	            	  if(key.equals("email")){
	            		  
	            		  key = fi.getString("gbk");
	 	            	  System.out.println(key);
	            		  File ufile = new File(uploadPath, key);
	            		  if(!ufile.exists())
		                  ufile.mkdir();
		                  uploadPath = ufile.getPath();
	            	  } 
	            	  if(key.equals("h_location")){
	            		  key = fi.getString("gbk");
	 	            	  System.out.println(key);
	            		  File ufile = new File(uploadPath, key);
	            		  if(!ufile.exists())
		                  ufile.mkdir();
		                  uploadPath = ufile.getPath();        
	            	  }
	            	  }
	              else{
	            	  String fileName = fi.getName();
	                  if (fileName != null) {
	                  File fullFile = new File(fi.getName());
	                  File savedFile = new File(uploadPath, fullFile.getName());
	                  System.out.println(fullFile.getName());
	                  System.out.println(savedFile.getPath());
	                  fi.write(savedFile);	     
	                  uimg.add(savedFile.getPath());
	                  uimgpath += savedFile.getPath() + "#";
	               }
	             }
	             
	           }
	           System.out.print("upload succeed");
	           for(int t = 0; t<uimg.size(); t++){
	        	   System.out.println(uimg.get(t));
	           }
			//
			PrintWriter out = response.getWriter();
			String email = map.get("email");
			System.out.println(email);
			String title = map.get("title");
			System.out.println(title);
			String h_location = map.get("h_location");
			//In order to keep database data consistency, reduce redundancy
			h_location = h_location.toLowerCase(); 
			System.out.println(h_location);
			String h_area = map.get("h_area");
			System.out.println(h_area);
			String housetype = map.get("housetype");
			System.out.println(housetype);
			String roomtype = map.get("roomtype");
			System.out.println(roomtype);
			String sex = map.get("sex");
			System.out.println(sex);
			String wechatid = map.get("wechatid");
			System.out.println(wechatid);
			String qq = map.get("qq");
			System.out.println(qq);
			String phonenumber = map.get("phonenumber");
			System.out.println(phonenumber);
			String price = map.get("price");
			System.out.println(price);
			String houseinfo = map.get("houseinfo");
			System.out.println(houseinfo);
			String coordinate = map.get("coordinate");
			System.out.println(coordinate);
			HouseBeanCL hbc= new HouseBeanCL();
			
			if(email != null && h_location != null && h_area != null){
				boolean check = hbc.posthouse(email, title, h_location, h_area, housetype, roomtype, sex, wechatid, qq, phonenumber, price, houseinfo, uimgpath,coordinate);
				if(check == false){
					//houseinfo already exist
					String error1 ="House information already exist!" ;
					out.println(error1);
					out.println("<br/>");
					//Thread.sleep(5000);
					response.sendRedirect("postResponse.jsp?email="+email+"&error="+error1);
				}
				else{
					//post successed
					String success1 = "House information post successful!";
					out.println(success1);
					out.println("<br/>");
					response.sendRedirect("postResponse.jsp?email="+email+"&success="+success1);
				}
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}

}
