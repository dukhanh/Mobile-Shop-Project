package controller;

import dao.*;
import mode_utility.Config;
import mode_utility.Encrypt;
import model.Account;
import model.Address;
import model.Brand;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> listProductPromotions = HomeDAO.getInstance().getProductPromotion(Config.PROMOTION_PRODUCT_NUMBER);
        List<Product> listProductTopSeller = HomeDAO.getInstance().getProductTopSeller(Config.PRODUCT_TOP_SELLER_NUMBER);
        List<Product> listProductBestNew = HomeDAO.getInstance().getProductBestNew(Config.PRODUCT_BEST_NEW_NUMBER);
        List<Brand> listBrandLogo = BrandDAO.getInstance().getBrandLogo();

        // auto login if user has cookie(remember me)


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
