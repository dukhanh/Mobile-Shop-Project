package controller;

import dao.AssessDAO;
import model.Assess;
import model.Configuration;
import model.Product;
import dao.ProductDetailsDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductDetails", value = "/productdetails")
public class ProductDetailsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProduct = request.getParameter("id");

        Product product = ProductDetailsDAO.getInstance().getProductDetails(idProduct);
        List<String> images =  ProductDetailsDAO.getInstance().getImageProduct(idProduct);
        List<Configuration> confi = ProductDetailsDAO.getInstance().getCauHinh(idProduct);
        List<Assess> listAssess = AssessDAO.getInstance().getListAssess(Integer.parseInt(idProduct));
        double rateAverage = AssessDAO.getInstance().getRateProduct(Integer.parseInt(idProduct));
        int countAssess = AssessDAO.getInstance().getNumberReview(Integer.parseInt(idProduct));

        request.setAttribute("confi", confi);
        request.setAttribute("product", product);
        request.setAttribute("images", images);
        request.setAttribute("listAssess", listAssess);
        request.setAttribute("rateAverage", rateAverage);
        request.setAttribute("countAssess", countAssess);

        request.getRequestDispatcher("/customer/product-single.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
