package spms.vo;

import java.io.Serializable;
import java.sql.Date;

public class Project implements Serializable {
  private static final long serialVersionUID = 1L;

  public static final int READY = 0;
	public static final int WORKING = 1;
	public static final int COMPLETE = 2;
	public static final int CANCEL = 3;
	
	int				no;
	String 		title;
	String			description;
	Date				startDate;
	Date				endDate;
	int				state;
	String			tags;
	Member			owner;
	
	@Override
  public String toString() {
	  return "Project [title=" + title + ", description=" + description
	      + ", startDate=" + startDate + ", endDate=" + endDate + ", state="
	      + state + "]";
  }
	@Override
  public int hashCode() {
	  final int prime = 31;
	  int result = 1;
	  result = prime * result + ((endDate == null) ? 0 : endDate.hashCode());
	  result = prime * result + ((startDate == null) ? 0 : startDate.hashCode());
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
	  Project other = (Project) obj;
	  if (endDate == null) {
		  if (other.endDate != null)
			  return false;
	  } else if (!endDate.equals(other.endDate))
		  return false;
	  if (startDate == null) {
		  if (other.startDate != null)
			  return false;
	  } else if (!startDate.equals(other.startDate))
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Member getOwner() {
		return owner;
	}
	public void setOwner(Member owner) {
		this.owner = owner;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	
}
