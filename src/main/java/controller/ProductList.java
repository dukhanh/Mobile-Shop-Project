package controller;

import bean.Product;
import dao.CategoryDAO;
import dao.ProductDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ProductList", value = "/ProductList")
public class ProductList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryId = request.getParameter("cid");
        String sortType = request.getParameter("sort");

        String sortCondition = "";
        if (sortType != null) {
            if (sortType.equals("price_asc")) {
                sortCondition = "ORDER BY GIA_KM ASC";
            } else {

                sortCondition = "ORDER BY GIA_KM DESC";
            }
        }
        String condition = "";
        if (categoryId != null) {
            condition = "WHERE ID_LOAI_SP = " + categoryId;
        }

        int productsInPage = 24;
        int index = 1;
        int product = ProductDAO.getInstance().getNumberOfProducts(condition);
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
        if (index == 1) {
            indexPage = 0;
        } else {
            indexPage = (index - 1) * productsInPage;
        }
        List<Product> list = ProductDAO.getInstance().getProducts(indexPage, productsInPage, condition, sortCondition);
        if (sortType != null) {
            if (sortType.equals("top_seller")) {
                list = ProductDAO.getInstance().getProductsTopSeller(indexPage, productsInPage, condition);
            }
        }

        request.setAttribute("products", list);
        request.setAttribute("categorylist", CategoryDAO.getInstance().getCategory());
        request.setAttribute("index", index);
        request.setAttribute("pages", pages);
        request.setAttribute("category", categoryId);
        request.setAttribute("sorttype", sortType);
        request.getRequestDispatcher("/customer/product-list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
