package controller;

import bean.Product;
import dao.ProductListDAO;
import mode_utility.Format;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "ServletAjax", value = "/searchAjax")
public class ServletAjax extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String textSearch = request.getParameter("search");
        List<Product> list = ProductListDAO.getInstance().getProducts(1, 100, " AND TEN_SP like '%" + textSearch + "%'", "");
        PrintWriter out = response.getWriter();
        for (Product product : list) {
            out.print("<div class=\"col-sm-3 m-0\" style=\"padding: 2px;\">\n" +
                    "                                    <a href=\"productdetails?id=" + product.getId() + "\">\n" +
                    "                                        <div class=\"product-block\">\n" +
                    "                                            <div class=\"product-img\"><img src=\"" + product.getImageUrl() + "\" alt=\"\"></div>\n" +
                    "                                            <div class=\"product-content\">\n" +
                    "                                                <h5 class=\"product-title\">" + product.getName() + "</h5>\n" +
                    "                                                <div class=\"product-meta\">\n" +
                    "                                                        <a href=\"#\" class=\"discounted-price\">" + Format.formatOriginalPrice(product.getPrice(), product.getPriceSale()) + "</a>\n" +
                    "                                                    <a href=\"#\" class=\"product-price\">" + Format.formatIntToMoney(product.getPriceSale()) + "</a>\n" +
                    "                                                </div>\n" +
                    "                                                <div class=\"shopping-btn\">\n" +
                    "                                                    <a href=\"#\" class=\"product-btn btn-like\"><i class=\"fa fa-heart\"></i></a>\n" +
                    "                                                    <a href=\"#\" class=\"product-btn btn-cart\"><i\n" +
                    "                                                            class=\"fa fa-shopping-cart\"></i></a>\n" +
                    "                                                </div>\n" +
                    "                                            </div>\n" +
                    "                                        </div>\n" +
                    "                                    </a>\n" +
                    "                                </div>");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
