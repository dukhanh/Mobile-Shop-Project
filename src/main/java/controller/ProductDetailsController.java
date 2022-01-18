package controller;

import bean.Configuration;
import bean.Product;
import dao.ProductDetailsDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductDetails", value = "/ProductDetails")
public class ProductDetailsController extends HttpServlet {
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
