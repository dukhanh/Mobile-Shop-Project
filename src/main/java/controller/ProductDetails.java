package controller;

import bean.Configuration;
import bean.Product;
import dao.ProductDetailsDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

@WebServlet(name = "ProductDetails", value = "/ProductDetails")
public class ProductDetails extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProduct = request.getParameter("id");

        Product product = ProductDetailsDAO.getInstance().getProductDetails(idProduct);
        List<String> images =  ProductDetailsDAO.getInstance().getImageProduct(idProduct);
        List<Configuration> confi = ProductDetailsDAO.getInstance().getCauHinh(idProduct);

        request.setAttribute("confi", confi);
        request.setAttribute("product", product);
        request.setAttribute("images", images);

        request.getRequestDispatcher("/customer/product-single.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
