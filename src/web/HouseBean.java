package web;

import java.io.File;
import java.util.ArrayList;

public class HouseBean {
	
	private String id;
	private String housetype;
	private String roomtype;
	private String sex;
	private String wechatid;
	private String qq;
	private String phonenumber;
	private String price;
	private String houseinfo;
	private String title;
	private String h_location;
	private String h_area;
	private String uimgpath;
	private int state;
	private String coordinate;
	//private ArrayList<String> uimgs = new ArrayList<String>();
	public void setcoordinate(String sc){
		this.coordinate = sc;
	}
	public String getcoordinate(){
		return this.coordinate;
	}
	public void setuimgpath(String ip){
		this.uimgpath = ip;
	/*	File imgs = new File(this.uimgpath);
        File[] tempList = imgs.listFiles();
        for (File f : tempList) 
        	uimgs.add(f.getPath()); */
        
	}
	public String getuimgpath(){
	   return this.uimgpath;
	}
	public void setstate(int state){
		this.state = state;
	}
	public int getstate(){
		return this.state;
	}
	public void seth_location(String lo){
		this.h_location = lo;
	}
	public String geth_location(){
		return this.h_location;
	}
	public void seth_area(String area){
		this.h_area = area;
	}
	public String geth_area(){
		return this.h_area;
	}
	public void setid(String id){
		this.id = id;
	}
	public String getid(){
		return this.id;
	}
	public void sethousetype(String ht){
		this.housetype = ht;
	}
	public String gethousetype(){
		return this.housetype;
	}
	public void setroomtype(String rt){
		this.roomtype = rt;
	}
	public String getroomtype(){
		return this.roomtype;
	}
	public void setsex(String sex){
		this.sex = sex;
	}
	public String getsex(){
		return this.sex;
	}
	public void setwechatid(String wechatid){
		this.wechatid = wechatid;
	}
	public String getwechatid(){
		return this.wechatid;
	}
	public void setqq(String qq){
		this.qq = qq;
	}
	public String getqq(){
		return this.qq;
	}
	public void setphonenumber(String pn){
		this.phonenumber = pn;
	}
	public String getphonenumber(){
		return this.phonenumber;
	}
	public void setprice(String price ){
		this.price = price;
	}
	public String getprice(){
		return this.price;
	}
	public void sethouseinfo(String info){
		this.houseinfo = info;
	}
	public String gethouseinfo(){
		return this.houseinfo;
	}
	public void settitle(String title){
		this.title = title;
	}
	public String gettitle(){
		return this.title;
	}
	
}
