package model;

import java.sql.Date;
import java.text.Normalizer;
import java.util.regex.Pattern;

public class Blog {
	private int id;
	private String title;
	private String description;
	private String shortDescription;
	private String url;
	private Date createDate;
	private String createBy;
	private String avatar;
	
	public String getCreateBy() {
		return createBy;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	public String getShortDescription() {
		return shortDescription;
	}
	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
	public Blog(int id, String title, String description, Date create_date, String avatar, String createBy) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.createDate = create_date;
		this.avatar = avatar;
		this.createBy = createBy;
		if(description.length() > 10) {
			this.shortDescription =	description.substring(0,10)+"...";
		} else {
			this.shortDescription =	description;
		}
		this.url = deAccent(this.title).trim().replace(" ", "-") + "-" + id;
	}
	
	public static String deAccent(String str) {
        String nfdNormalizedString = Normalizer.normalize(str, Normalizer.Form.NFD); 
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
        return pattern.matcher(nfdNormalizedString).replaceAll("");
    }
}
