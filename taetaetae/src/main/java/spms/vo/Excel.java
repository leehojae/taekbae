package spms.vo;

import java.util.Date;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class Excel {

	long trcno;
	long orderNo;
	int state;
	String office;
	String member;
	String receiveDate;
	String deliverDate;
	Date deliverEndDate;
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
	String payment;
	int pay;
	Date date;
	int returnBox;
	int boxState;
	int id;
	double lat;
	double lng;
	
	private CommonsMultipartFile file = null;
	
	public Excel() {
	}
	
	public Excel(double lat, double lng) {
		this.lat = lat;
		this.lng = lng;
	}
	
	public Excel(
			long trcno, 
			long orderNo, 
			String office, 
			String receiveDate,
			String deliverDate, 
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
			String payment, 
			int pay, 
			int returnBox
			) {
		this.trcno = trcno;
		this.orderNo = orderNo;
		this.office = office;
		this.receiveDate = receiveDate;
		this.deliverDate = deliverDate;
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
		this.pay = pay;
		this.returnBox = returnBox;
	}

	public long getTrcno() {
		return trcno;
	}

	public Excel setTrcno(long trcno) {
		this.trcno = trcno;
		return this;
	}
	
	public String getReceiveDate() {
		return receiveDate;
	}

	public Excel setReceiveDate(String receiveDate) {
		this.receiveDate = receiveDate;
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

	public String getPayment() {
		return payment;
	}

	public Excel setPayment(String payment) {
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

	public long getOrderNo() {
		return orderNo;
	}

	public Excel setOrderNo(long orderNo) {
		this.orderNo = orderNo;
		return this;
	}

	public int getState() {
		return state;
	}

	public Excel setState(int state) {
		this.state = state;
		return this;
	}

	public String getOffice() {
		return office;
	}

	public Excel setOffice(String office) {
		this.office = office;
		return this;
	}

	public String getMember() {
		return member;
	}

	public Excel setMember(String member) {
		this.member = member;
		return this;
	}

	public String getDeliverDate() {
		return deliverDate;
	}

	public Excel setDeliverDate(String deliverDate) {
		this.deliverDate = deliverDate;
		return this;
	}

	public int getPay() {
		return pay;
	}

	public Excel setPay(int pay) {
		this.pay = pay;
		return this;
	}

	public int getReturnBox() {
		return returnBox;
	}

	public Excel setReturnBox(int returnBox) {
		this.returnBox = returnBox;
		return this;
	}

	public int getBoxState() {
		return boxState;
	}

	public Excel setBoxState(int boxState) {
		this.boxState = boxState;
		return this;
	}

	public int getId() {
		return id;
	}

	public Excel setId(int id) {
		this.id = id;
		return this;
	}

	public Date getDeliverEndDate() {
		return deliverEndDate;
	}

	public Excel setDeliverEndDate(Date deliverEndDate) {
		this.deliverEndDate = deliverEndDate;
		return this;
	}

	public double getLat() {
		return lat;
	}

	public Excel setLat(double lat) {
		this.lat = lat;
		return this;
	}

	public double getLng() {
		return lng;
	}

	public Excel setLng(double lng) {
		this.lng = lng;
		return this;
	}
	
	
}
