package controller;

import dao.ProductDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Objects;

import static java.lang.Integer.parseInt;

@WebServlet(name = "CategoryProductList", value = "/category")
public class CategoryProductList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryId = request.getParameter("id)");
        String condition ="";
        if(Objects.equals(categoryId, "1789")) {
            condition = "WHERE ID_LOAI_SP = 1789 OR ID_LOAI_SP = 2";
        }else{
            condition = "WHERE ID_LOAI_SP = "+ categoryId;
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

        request.setAttribute("products", ProductDAO.getInstance().getProducts(indexPage, productsInPage, condition));
        request.setAttribute("index", index);
        request.setAttribute("pages", pages);
        request.getRequestDispatcher("/customer/product-list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
