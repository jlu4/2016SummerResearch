//get connections from database
package web;

import java.sql.*;

public class ConnDB {
	private Connection ct=null;
	public Connection getConn(){
		try{
			//upload drivers
			Class.forName("org.postgresql.Driver").newInstance();
			//get connections
			String url="jdbc:postgresql://127.0.0.1:5432/MyWeb";
	        String user="postgres1";
	        String pwd="123qwe";
			ct=DriverManager.getConnection(url,user,pwd);
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return ct;
	}
}
