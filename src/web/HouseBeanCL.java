package web;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HouseBeanCL {
	private Connection ct=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	private DatabaseMetaData dmd = null; 
	
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
	
	
	//store in database
	public boolean posthouse(String email, String title, String h_location, String h_area, String housetype, String roomtype, String sex, String wechatid, String qq, String phonenumber, String price, String houseinfo, String uimgpath, String coordinate){
		boolean flag = false;
		int x;
		try{
			ConnDB cd = new ConnDB();
			ct = cd.getConn();
			ps = ct.prepareStatement("select id from houseinfo where id="+"'"+email+"' and h_location='"+h_location+"' and h_area='"+h_area+"'");
			//System.out.println(ps);
			rs = ps.executeQuery();
			if(rs.next()){
				//username already exist!
				//request.setAttribute("error","Email-address already exist");
				//PostHouseCL will deal with that
			}
			else{
				ps = ct.prepareStatement("insert into houseinfo values("+"'"+email+"', "+"'"+title+"', "+"'"+h_location+"', "+"'"+h_area+"', "+"'"+housetype+"', "+"'"+roomtype+"', "+"'"+sex+"', "+"'"+wechatid+"', "+"'"+qq+"', "+"'"+phonenumber+"', "+"'"+price+"', "+"'"+houseinfo+"',"+" '1', '"+uimgpath+"', "+"'"+coordinate+"'"+")");
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
		return flag;
	}
	
	//get from database
		public List<HouseBean> findAllHouse(String h_area, String housetype, String roomtype, String sex, String minprice, String maxprice){
			boolean flag = false;
			int x;
			HouseBean obj = null;
			System.out.print(minprice);
			System.out.print(maxprice);
			List<HouseBean> houseList = new ArrayList<HouseBean>();
			int min = Integer.parseInt(minprice);
			int max = Integer.parseInt(maxprice);
			try{
				ConnDB cd = new ConnDB();
				ct = cd.getConn();
				//and (housetype="+housetype+") and (sex="+sex+") and (roomtype="+roomtype+")
				ps = ct.prepareStatement("select * from houseinfo where (h_area="+h_area+") and (housetype="+housetype+") and (sex="+sex+") and (roomtype="+roomtype+") and cast(price as int) between "+min+" and "+max);
				System.out.println(ps);
				rs = ps.executeQuery();
				while(rs.next()){
					//show houses
					obj = new HouseBean();
					obj.setid(rs.getString("id"));
					obj.settitle(rs.getString("title"));
					obj.sethouseinfo(rs.getString("houseinfo"));
					obj.sethousetype(rs.getString("housetype"));
					obj.setphonenumber(rs.getString("phonenumber"));
					obj.setprice(rs.getString("price"));
					obj.setqq(rs.getString("qq"));
					obj.setroomtype(rs.getString("roomtype"));
					obj.setsex(rs.getString("sex"));
					obj.setwechatid(rs.getString("wechatid"));
					obj.seth_location(rs.getString("h_location"));
					obj.seth_area(rs.getString("h_area"));		
					obj.setuimgpath(rs.getString("uimgpath"));
					obj.setcoordinate(rs.getString("coordinate"));
					houseList.add(obj);
				}
			
			}
			catch(Exception ex){
				ex.printStackTrace();
			}
			finally{
				this.close();
			}
			return houseList;
		}
		
		//get user post house from database
				public List<HouseBean> findUserHouse(String email){
					boolean flag = false;
					int x;
					HouseBean obj = null;
					List<HouseBean> houseList = new ArrayList<HouseBean>();
					try{
						ConnDB cd = new ConnDB();
						ct = cd.getConn();
						//and (housetype="+housetype+") and (sex="+sex+") and (roomtype="+roomtype+")
						ps = ct.prepareStatement("select * from houseinfo where id = '"+email+"'");
						System.out.println(ps);
						rs = ps.executeQuery();
						while(rs.next()){
							//show houses
							obj = new HouseBean();
							obj.setid(rs.getString("id"));
							obj.settitle(rs.getString("title"));
							obj.sethouseinfo(rs.getString("houseinfo"));
							obj.sethousetype(rs.getString("housetype"));
							obj.setphonenumber(rs.getString("phonenumber"));
							obj.setprice(rs.getString("price"));
							obj.setqq(rs.getString("qq"));
							obj.setroomtype(rs.getString("roomtype"));
							obj.setsex(rs.getString("sex"));
							obj.setwechatid(rs.getString("wechatid"));
							obj.seth_location(rs.getString("h_location"));
							obj.seth_area(rs.getString("h_area"));		
							obj.setuimgpath(rs.getString("uimgpath"));
							obj.setcoordinate(rs.getString("coordinate"));
							houseList.add(obj);
						}
					
					}
					catch(Exception ex){
						ex.printStackTrace();
					}
					finally{
						this.close();
					}
					return houseList;
				}
	//Update house information
				public boolean updatehouse(String email, String title, String h_location, String h_area, String housetype, String roomtype, String sex, String wechatid, String qq, String phonenumber, String price, String houseinfo){
					boolean flag = false;
					int x;
					try{
						ConnDB cd = new ConnDB();
						ct = cd.getConn();
						ps = ct.prepareStatement("select id from houseinfo where id="+"'"+email+"' and h_location='"+h_location+"' and h_area='"+h_area+"'");
						//System.out.println(ps);
						rs = ps.executeQuery();
						if(rs.next()){
							ps = ct.prepareStatement("UPDATE houseinfo SET title="+"'"+title+"', housetype="+"'"+housetype+"', roomtype="+"'"+roomtype+"', sex="+"'"+sex+"', wechatid="+"'"+wechatid+"', qq="+"'"+qq+"', phonenumber="+"'"+phonenumber+"', price="+"'"+price+"', houseinfo="+"'"+houseinfo+"' WHERE id="+"'"+email+"' and h_location='"+h_location+"' and h_area='"+h_area+"'");
							System.out.println(ps);
							x = ps.executeUpdate();
							flag = true;
						}
						else{
							
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
				//Delete house information
				public boolean deleteHouse(String h_location){
					boolean flag = false;
					int x;
					HouseBean obj = null;
					List<HouseBean> houseList = new ArrayList<HouseBean>();
					try{
						ConnDB cd = new ConnDB();
						ct = cd.getConn();
						//and (housetype="+housetype+") and (sex="+sex+") and (roomtype="+roomtype+")
						ps = ct.prepareStatement("select * from houseinfo where h_location = '"+h_location+"'");
						System.out.println(ps);
						rs = ps.executeQuery();
							if(rs.next()){
								ps = ct.prepareStatement("delete from houseinfo where h_location = '"+h_location+"'");
								System.out.println(ps);
								x = ps.executeUpdate();
								flag = true;
								
							}
							else{
								flag = false;
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
}
