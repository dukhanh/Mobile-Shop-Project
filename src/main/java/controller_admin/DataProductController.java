package controller_admin;


import dao.AccountDAO;
import dao.ProductDAO;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DataProductController", value = "/admin/dataProduct")
public class DataProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//get data from dao
        ProductDAO dao = new ProductDAO();
        List<Product> list = dao.showAllProduct();
//set data to jsp
        request.setAttribute("listProduct",list);
        request.getRequestDispatcher("/admin/dataProduct.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}


