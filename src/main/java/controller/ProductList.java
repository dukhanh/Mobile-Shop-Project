package controller;

import dao.ProductDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductList", value = "/ProductList")
public class ProductList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int productsInPage = 27;
        int index = 1;
        int product = ProductDAO.getInstance().getNumberOfProducts();
        int pages = product / productsInPage;
        int pagesDu = product % productsInPage;

        if (product != 0 && pagesDu != 0) {
            pages++;
        }
        try {
            index = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException e) {
            System.out.println(e.getMessage());
        }
        int indexPage = 0;
        if(index == 1){
            indexPage = 0;
        }else{
            indexPage = (index-1)*productsInPage;
        }

        request.setAttribute("products", ProductDAO.getInstance().getProducts(indexPage, productsInPage));
        request.setAttribute("index", index);
        request.setAttribute("pages", pages);
        request.getRequestDispatcher("/customer/product-list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
