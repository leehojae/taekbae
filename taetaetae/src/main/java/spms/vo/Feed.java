package spms.vo;

import java.sql.Date;
import java.util.List;

public class Feed {
	protected int 			no;
	protected String 	contents;
	protected Date			createdDate;
	protected int			writerNo;
	protected int			projectNo;
	protected Member		writer;
	protected List<AttachFile> Files;
	
	public List<AttachFile> getFiles() {
		return Files;
	}
	public Feed setFiles(List<AttachFile> files) {
		Files = files;
		return this;
	}
	public int getNo() {
		return no;
	}
	public Feed setNo(int no) {
		this.no = no;
		return this;
	}
	public String getContents() {
		return contents;
	}
	public Feed setContents(String contents) {
		this.contents = contents;
		return this;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public Feed setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
		return this;
	}
	public int getProjectNo() {
		return projectNo;
	}
	public Feed setProjectNo(int projectNo) {
		this.projectNo = projectNo;
		return this;
	}
	public Member getWriter() {
		return writer;
	}
	public Feed setWriter(Member writer) {
		this.writer = writer;
		return this;
	}
	public int getWriterNo() {
		return writerNo;
	}
	public Feed setWriterNo(int writerNo) {
		this.writerNo = writerNo;
		return this;
	}
	
	
}
