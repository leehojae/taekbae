package spms.vo;

import java.io.Serializable;

public class Office  implements Serializable {
	private static final long serialVersionUID = 1L;

	private int  officeNum;
	private String officeName;
	private String officeTel;
	private String officePostNum;
	private String officeAddr;
	private String officeFax;
	
	
	public int getOfficeNum() {
		return officeNum;
	}
	public Office setOfficeNum(int officeNum) {
		this.officeNum = officeNum;
		return this;
	}
	public String getOfficeName() {
		return officeName;
	}
	public Office setOfficeName(String officeName) {
		this.officeName = officeName;
		return this;
	}
	public String getOfficeTel() {
		return officeTel;
	}
	public Office setOfficeTel(String officeTel) {
		this.officeTel = officeTel;
		return this;
	}
	public String getOfficePostNum() {
		return officePostNum;
	}
	public Office setOfficePostNum(String officePostNum) {
		this.officePostNum = officePostNum;
		return this;
	}
	public String getOfficeAddr() {
		return officeAddr;
	}
	public Office setOfficeAddr(String officeAddr) {
		this.officeAddr = officeAddr;
		return this;
	}
	public String getOfficeFax() {
		return officeFax;
	}
	public Office setOfficeFax(String officeFax) {
		this.officeFax = officeFax;
		return this;
	}
	
}
