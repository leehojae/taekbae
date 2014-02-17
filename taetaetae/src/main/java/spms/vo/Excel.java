package spms.vo;

import java.sql.Date;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class Excel {
	

	int num;
	Date date;
	private String sender = null;
	private String receiver = null;
	private CommonsMultipartFile file = null;
	
	public Excel() {
	}
	
	public Excel(String sender, String receiver) {
		this.sender = sender;
		this.receiver = receiver;
	}
	
	public int getNum() {
		return num;
	}
	
	public Excel setNum(int num) {
		this.num = num;
		return this;
	}
	
	public Date getDate() {
		return date;
	}
	
	public Excel setDate(Date date) {
		this.date = date;
		return this;
	}
	public String getSender() {
		return sender;
	}

	public Excel setSender(String sender) {
		this.sender = sender;
		return this;
	}

	public String getReceiver() {
		return receiver;
	}

	public Excel setReceiver(String receiver) {
		this.receiver = receiver;
		return this;
	}
	
	public CommonsMultipartFile getFile() {
		return file;
	}

	public Excel setFile(CommonsMultipartFile file) {
		this.file = file;
		return this;
	}
}
