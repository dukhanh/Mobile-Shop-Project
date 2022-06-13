package dto;

import model.Blog;

import java.util.List;

public class ResponseBlogsDTO {
	private int pageCount;
	private List<Blog> blogs ;
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public List<Blog> getBlogs() {
		return blogs;
	}
	public void setBlogs(List<Blog> blogs) {
		this.blogs = blogs;
	}
	public ResponseBlogsDTO(int pageCount, List<Blog> blogs) {
		super();
		this.pageCount = pageCount;
		this.blogs = blogs;
	}
}
