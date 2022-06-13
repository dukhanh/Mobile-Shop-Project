package controller;

import dao.BlogDAO;
import dao.CommentDAO;
import dao.ReportDAO;
import model.Blog;
import model.Comment;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/blog/*")
public class BlogController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int page;
//        try {
//        	page = Integer.parseInt(request.getParameter("page"));
//		} catch (Exception e) {
//			page = 1;
//		}
//    	ResponseBlogsDTO resData = BlogDAO.getBlogsPerPage(page);
//    	request.setAttribute("blogs",resData.getBlogs() );
//    	request.setAttribute("countPage",resData.getPageCount() );
//    	request.setAttribute("page",page);
    	String uri;
    	String[] splUri;
    	Blog blog;
    	int id;
    	List<Blog> blogs;
    	List<Comment> commemts;
    	uri = request.getRequestURI();
    	splUri =  uri.split("-");
    	try {
        	id = Integer.parseInt(splUri[splUri.length-1]); 
        	blog = BlogDAO.getBlogById(id);
        	commemts = CommentDAO.getCommentByBlogId(id);
        	blogs = BlogDAO.getBlogsRandom();
        	request.setAttribute("comments", commemts);
        	request.setAttribute("blog", blog);
        	request.setAttribute("blogs", blogs);
            request.getRequestDispatcher("/customer/blog-single.jsp").forward(request, response);
		} catch (Exception e) {
			 request.getRequestDispatcher("/customer/404-page.jsp").forward(request, response);
		}
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doGet(request, response);
    }
}
