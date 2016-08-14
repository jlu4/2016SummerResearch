//UserBean--Users reflection
//UserBean's objection--Users table

package web;

public class UserBean {
	private String UserID;
	private String Name;
	private String PassWord;
	private int Rank;
	private int state; 
	
	public void setstate(int state){
		this.state=state;
	}
	public int getstate(){
		return this.state;
	}
	public void setUserID(String UserID){
		this.UserID=UserID;
	}
	public String getUserID(){
		return this.UserID;
	}
	public void setName(String Name){
		this.Name=Name;
	}
	public String getName(){
		return this.Name;
	}
	public void setPassWord(String PassWord){
		this.PassWord=PassWord;
	}
	public String getPassWord(){
		return this.PassWord;
	}
	public void setRank(int Rank){
		this.Rank=Rank;
	}
	public int getRank(){
		return this.Rank;
	}

}
