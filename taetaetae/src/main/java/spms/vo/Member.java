package spms.vo;

import java.io.Serializable;

public class Member implements Serializable {
	private static final long serialVersionUID = 1L;

	protected int 			no;
	protected String 		name;
	protected String 		id;
	protected String 		tel;
	protected String		password;
	protected String 		personalNumber;
	protected String 			rank;
	protected String		photo;
	private int  officeNum;
	protected String 		officeName;
	protected String 		email;
	protected String 		addresss;
	
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddresss() {
		return addresss;
	}

	public void setAddresss(String addresss) {
		this.addresss = addresss;
	}

	
	
	


	
	
	@Override
	public String toString() {
	   return "{"
	   		+ "no='" + no + 
	   		"', name='" + name +
	   		"', id="+ id +  
	   		"', tel='"+ tel +  
	   		"', password='"+ password +  
	   		"', personalNumber='"+ personalNumber +  
	   		"', rank='"+ rank +  
	   		"', photo='"+ photo +  
	   		"', officeNum='"+ officeNum +  
	   		
	   		"' }";
		
	}
	
	public int getOfficeNum() {
		return officeNum;
	}
	public Member setOfficeNum(int officeNum) {
		this.officeNum = officeNum;
		return this;
	}
	public String getPersonalNumber() {
		return personalNumber;
	}
	public String getOfficeName() {
		return officeName;
		
	}

	public Member setOfficeName(String officeName) {
		
		this.officeName = officeName;
		return this;
	}

	public Member setPersonalNumber(String personalNumber) {
		this.personalNumber = personalNumber;
		return this;
	}
	public String getRank() {
		return rank;
	}
	public Member setRank(String rank) {
		this.rank = rank;
		return this;
	}
	public int getNo() {
		return no;
	}
	public Member setNo(int no) {
		this.no = no;
		return this;
	}
	public String getName() {
		return name;
	}
	public Member setName(String name) {
		this.name = name;
		return this;
	}
	
	public String getId() {
		return id;
	}
	public Member setId(String id) {
		this.id = id;
		return this;
	}
	public String getTel() {
		return tel;
	}
	public Member setTel(String tel) {
		this.tel = tel;
		return this;
	}

	public String getPassword() {
		return password;
	}

	public Member setPassword(String password) {
		this.password = password;
		return this;
	}

	public String getPhoto() {
		return photo;
	}

	public Member setPhoto(String photo) {
		this.photo = photo;
		return this;
	}

}
