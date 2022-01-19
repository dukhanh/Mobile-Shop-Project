package controller;

import bean.Product;
import dao.HomeDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController", value = "/HomeController")
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> listProductPromotions = HomeDAO.getInstance().getProductPromotion();
        List<Product> listProductTopSeller = HomeDAO.getInstance().getProductTopSeller();
        List<Product> listProductBestNew = HomeDAO.getInstance().getProductBestNew();
        request.setAttribute("listProductPromotions",listProductPromotions);
        request.setAttribute("listProductTopSeller",listProductTopSeller);
        request.setAttribute("listProductBestNew",listProductBestNew);

        request.getRequestDispatcher("/customer/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
