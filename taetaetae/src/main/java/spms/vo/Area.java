package spms.vo;

public class Area {
	int no;
	int memberNo;
	String taskArea;
	String areaClass;
	
	
	public int getNo() {
		return no;
	}
	public Area setNo(int no) {
		this.no = no;
		return this;
	}
	
	public int getMemberNo() {
		return memberNo;
	}
	
	public Area setMemberNo(int memberNo) {
		this.memberNo = memberNo;
		return this;
	}
	
	public String getTaskArea() {
		return taskArea;
	}
	public Area setTaskArea(String taskArea) {
		this.taskArea = taskArea;
		return this;
	}
	public String getAreaClass() {
		return areaClass;
	}
	public Area setAreaClass(String areaClass) {
		this.areaClass = areaClass;
		return this;
	}
	
}
