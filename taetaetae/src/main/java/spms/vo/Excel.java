package spms.vo;

import java.util.Date;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class Excel {

	int tno;
	int trcno;
	Date receiveDate;
	Date deliveDate;
	String senderName;
	String senderAddr;
	String senderTel1;
	String senderTel2;
	String receiverName;
	String receiverAddr;
	String receiverTel1;
	String receiverTel2;
	String sendPoint;
	String receivePoint;
	String packing;
	String productName;
	int count;
	String size;
	int weight;
	int payment;
	Date date;
	
	private CommonsMultipartFile file = null;
	
	public Excel() {
	}
	
	public Excel(
			int trcno, 
			Date receiveDate, 
			Date deliveDate,
			String senderName, 
			String senderAddr, 
			String senderTel1,
			String senderTel2, 
			String receiverName, 
			String receiverAddr,
			String receiverTel1, 
			String receiverTel2, 
			String sendPoint,
			String receivePoint, 
			String packing, 
			String productName, 
			int count,
			String size, 
			int weight, 
			int payment
			) {
		this.trcno = trcno;
		this.receiveDate = receiveDate;
		this.deliveDate = deliveDate;
		this.senderName = senderName;
		this.senderAddr = senderAddr;
		this.senderTel1 = senderTel1;
		this.senderTel2 = senderTel2;
		this.receiverName = receiverName;
		this.receiverAddr = receiverAddr;
		this.receiverTel1 = receiverTel1;
		this.receiverTel2 = receiverTel2;
		this.sendPoint = sendPoint;
		this.receivePoint = receivePoint;
		this.packing = packing;
		this.productName = productName;
		this.count = count;
		this.size = size;
		this.weight = weight;
		this.payment = payment;
	}

	public int getTno() {
		return tno;
	}

	public Excel setTno(int tno) {
		this.tno = tno;
		return this;
	}

	public int getTrcno() {
		return trcno;
	}

	public Excel setTrcno(int trcno) {
		this.trcno = trcno;
		return this;
	}

	public Date getReceiveDate() {
		return receiveDate;
	}

	public Excel setReceiveDate(Date receiveDate) {
		this.receiveDate = receiveDate;
		return this;
	}

	public Date getDeliveDate() {
		return deliveDate;
	}

	public Excel setDeliveDate(Date deliveDate) {
		this.deliveDate = deliveDate;
		return this;
	}
	
	public String getSenderName() {
		return senderName;
	}
	
	public Excel setSenderName(String senderName) {
		this.senderName = senderName;
		return this;
	}
	
	public String getSenderAddr() {
		return senderAddr;
	}

	public Excel setSenderAddr(String senderAddr) {
		this.senderAddr = senderAddr;
		return this;
	}

	public String getSenderTel1() {
		return senderTel1;
	}

	public Excel setSenderTel1(String senderTel1) {
		this.senderTel1 = senderTel1;
		return this;
	}

	public String getSenderTel2() {
		return senderTel2;
	}

	public Excel setSenderTel2(String senderTel2) {
		this.senderTel2 = senderTel2;
		return this;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public Excel setReceiverName(String receiverName) {
		this.receiverName = receiverName;
		return this;
	}

	public String getReceiverAddr() {
		return receiverAddr;
	}

	public Excel setReceiverAddr(String receiverAddr) {
		this.receiverAddr = receiverAddr;
		return this;
	}

	public String getReceiverTel1() {
		return receiverTel1;
	}

	public Excel setReceiverTel1(String receiverTel1) {
		this.receiverTel1 = receiverTel1;
		return this;
	}

	public String getReceiverTel2() {
		return receiverTel2;
	}

	public Excel setReceiverTel2(String receiverTel2) {
		this.receiverTel2 = receiverTel2;
		return this;
	}

	public String getSendPoint() {
		return sendPoint;
	}

	public Excel setSendPoint(String sendPoint) {
		this.sendPoint = sendPoint;
		return this;
	}

	public String getReceivePoint() {
		return receivePoint;
	}

	public Excel setReceivePoint(String receivePoint) {
		this.receivePoint = receivePoint;
		return this;
	}

	public String getPacking() {
		return packing;
	}

	public Excel setPacking(String packing) {
		this.packing = packing;
		return this;
	}

	public String getProductName() {
		return productName;
	}

	public Excel setProductName(String productName) {
		this.productName = productName;
		return this;
	}

	public int getCount() {
		return count;
	}

	public Excel setCount(int count) {
		this.count = count;
		return this;
	}

	public String getSize() {
		return size;
	}

	public Excel setSize(String size) {
		this.size = size;
		return this;
	}

	public int getWeight() {
		return weight;
	}

	public Excel setWeight(int weight) {
		this.weight = weight;
		return this;
	}

	public int getPayment() {
		return payment;
	}

	public Excel setPayment(int payment) {
		this.payment = payment;
		return this;
	}

	public Date getDate() {
		return date;
	}
	
	public Excel setDate(Date date) {
		this.date = date;
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
