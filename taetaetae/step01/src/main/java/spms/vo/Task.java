package spms.vo;

import java.io.Serializable;
import java.sql.Date;

public class Task implements Serializable {
  private static final long serialVersionUID = 1L;
  
  public static final int READY = 0;
  public static final int COMPLETE = 1;
  public static final int CANCEL = 2;
  
	int 			no;
	String 	title;
	Date			startDate;
	Date			endDate;
	int			state;
	String 	tags;
	int			projectNo;
	Member		worker;
	
	@Override
  public String toString() {
	  return "Task [no=" + no + ", title=" + title + ", state=" + state + "]";
  }
	
	@Override
  public int hashCode() {
	  final int prime = 31;
	  int result = 1;
	  result = prime * result + no;
	  result = prime * result + state;
	  result = prime * result + ((title == null) ? 0 : title.hashCode());
	  return result;
  }
	
	@Override
  public boolean equals(Object obj) {
	  if (this == obj)
		  return true;
	  if (obj == null)
		  return false;
	  if (getClass() != obj.getClass())
		  return false;
	  Task other = (Task) obj;
	  if (no != other.no)
		  return false;
	  if (state != other.state)
		  return false;
	  if (title == null) {
		  if (other.title != null)
			  return false;
	  } else if (!title.equals(other.title))
		  return false;
	  return true;
  }
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Member getWorker() {
		return worker;
	}
	public void setWorker(Member worker) {
		this.worker = worker;
	}
	public int getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}
	
}
