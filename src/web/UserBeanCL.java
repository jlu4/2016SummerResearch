//This is a class for deal with Users Table<-->operate UserBean
package web;

import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserBeanCL {
	private Connection ct=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;	
	//check user's rank
/*	public int CheckRank(){
		int rank=0;
		try{
			//
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			this.close();
		}
		return rank;
	}
	*/
	//get user information after login
	public UserBean GetUser(String uid, HttpServletResponse response, String PassWord, String savetime, HttpSession session){
		UserBean ub = new UserBean();
		try{
			ConnDB cd = new ConnDB();
			ct = cd.getConn();
			ps = ct.prepareStatement("select * from webuser where id=?");
			ps.setString(1, uid);
			rs = ps.executeQuery();
			if(rs.next()){
				session.setAttribute("email",rs.getString(2));
				ub.setName(rs.getString(1));
				ub.setUserID(rs.getString(2));
				//ub.setPassWord(rs.getString(3));
				ub.setRank(rs.getInt(4));
				 Cookie cid=new Cookie("email",rs.getString(2));  
		         Cookie cpass=new Cookie("password",rs.getString(3));  
		         cid.setMaxAge(Integer.parseInt(savetime));  
		         cpass.setMaxAge(Integer.parseInt(savetime));  
		         response.addCookie(cid);  
		         response.addCookie(cpass);  
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			this.close();
		}
		return ub;
	}
	//register
	public boolean Register(String email, String name, String psw){
		boolean flag = false;
		int x;
		try{
			ConnDB cd = new ConnDB();
			ct = cd.getConn();
			ps = ct.prepareStatement("select id from webuser where id=?");
			ps.setString(1, email);
			rs = ps.executeQuery();
			if(rs.next()){
				System.out.println("Hi here");
				//username already exist!
				//request.setAttribute("error","Email-address already exist");
			}
			else{
				ps = ct.prepareStatement("insert into webuser values("+"'"+name+"', "+"'"+email+"', "+"'"+psw+"', "+1+", "+0+")");
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
		return flag;
	}

	//page display
	public ArrayList<UserBean> getResultByPage(int PageNow, int PageSize){
		ArrayList<UserBean> temp = new ArrayList<UserBean>();
	
				try{
			int RowCount=0;//total records number
			int PageCount=0;//total pages
			//get rowcount
			ConnDB cd = new ConnDB();
			ct=cd.getConn();
			ps=ct.prepareStatement("select count(*) from webuser");
			rs=ps.executeQuery();
			if(rs.next()){
				RowCount=rs.getInt(1);
			}
			//compute pagecount
			if(RowCount%PageSize==0){
				PageCount=RowCount/PageSize;
			}
			else{
				PageCount=RowCount/PageSize+1;
			}
			ps=ct.prepareStatement("select * from webuser limit "+PageSize);
			rs=ps.executeQuery();
			while(rs.next()){
				//put every records in rs into userbean ub
				UserBean ub = new UserBean();
				ub.setName(rs.getString(1));
				ub.setPassWord(rs.getString(3));
				ub.setRank(rs.getInt(4));
				ub.setUserID(rs.getString(2));
				//put in temp arraylist
				temp.add(ub);
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			this.close();
		}
		return temp;
	}
	//verify users
	public boolean CheckUser(String u, String p){
		boolean b = false;
		try{
			//get connection
			ConnDB cd=new ConnDB();
			ct=cd.getConn();
			ps=ct.prepareStatement("select * from webuser where id=? and state = '1'");
			ps.setString(1, u);
			rs=ps.executeQuery();
			if(rs.next()){
				String dbpsw=rs.getString(3);
				if(dbpsw.equals(p)){
					b=true;
				}
			}
		
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			this.close();
		}
		return b;
		}
	
	//close
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
}
