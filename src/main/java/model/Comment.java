package model;

import java.sql.Date;
import java.util.List;

public class Comment {
 

private String description;
 private String userName;
 private Date createDate;
 public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Comment(String description, String userName, Date createDate) {
		super();
		this.description = description;
		this.userName = userName;
		this.createDate = createDate;
	}
	
}
