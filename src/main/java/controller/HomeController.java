package controller;

import bean.Brand;
import bean.Product;
import dao.BrandDAO;
import dao.HomeDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> listProductPromotions = HomeDAO.getInstance().getProductPromotion(4);
        List<Product> listProductTopSeller = HomeDAO.getInstance().getProductTopSeller(20);
        List<Product> listProductBestNew = HomeDAO.getInstance().getProductBestNew(4);
        List<Brand> listBrandLogo = BrandDAO.getInstance().getBrandLogo();
        request.setAttribute("listProductPromotions", listProductPromotions);
        request.setAttribute("listProductTopSeller", listProductTopSeller);
        request.setAttribute("listProductBestNew", listProductBestNew);
        request.setAttribute("listBrandLogo", listBrandLogo);
        String registerSuccess = (String) request.getAttribute("messageSuccess");
        request.setAttribute("messageSuccess",registerSuccess );
        request.getRequestDispatcher("/customer/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
