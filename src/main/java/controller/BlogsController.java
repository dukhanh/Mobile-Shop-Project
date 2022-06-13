package controller;

import dao.AddressDAO;
import dao.BlogDAO;
import dao.CartDAO;
import model.Account;
import dao.AccountDAO;
import dao.FavoriteProductDAO;
import dao.ReportDAO;
import dto.ResponseBlogsDTO;
import mode_utility.Encrypt;
import model.Address;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/blog")
public class BlogsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page;
        try {
        	page = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			page = 1;
		}
    	ResponseBlogsDTO resData = BlogDAO.getBlogsPerPage(page);
    	request.setAttribute("blogs",resData.getBlogs() );
    	request.setAttribute("countPage",resData.getPageCount() );
    	request.setAttribute("page",page);
        request.getRequestDispatcher("/customer/blog-default.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doGet(request, response);
    }
}
