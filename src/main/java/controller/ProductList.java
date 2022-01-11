package controller;

import bean.Product;
import dao.CategoryDAO;
import dao.ProductDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "ProductList", value = "/ProductList")
public class ProductList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryId = request.getParameter("cid");
        String sortType = request.getParameter("sort");
        String filPrice = request.getParameter("price");

        // sắp xếp sản phẩm
        String sortCondition = "";
        if (sortType != null) {
            if (sortType.equals("price_asc")) {
                sortCondition = "ORDER BY GIA_KM ASC";
            } else {
                sortCondition = "ORDER BY GIA_KM DESC";
            }
        }

        // list products by category id
        String condition = "";
        if (categoryId != null) {
            condition = "WHERE ID_LOAI_SP = " + categoryId;
        }

        // filter product by price
        String conditionFPrice = "";
        if (filPrice != null) {
            if (filPrice.equals("price_1")) {
                conditionFPrice = "GIA_KM BETWEEN 0 AND 1000000";
            }
            if (filPrice.equals("price_2")) {
                conditionFPrice = "GIA_KM BETWEEN 1000000 AND 5500000";
            }
            if (filPrice.equals("price_3")) {
                conditionFPrice = "GIA_KM BETWEEN 5500000 AND 22500000";
            }
            if (filPrice.equals("price_4")) {
                conditionFPrice = "GIA_KM > 22500000";
            }
        }
//        System.out.println(conditionFPrice);
        if (!conditionFPrice.equals("")) {
            if (!condition.equals("")) {
                condition += " AND (" + conditionFPrice + ")";
            } else {
                condition = "WHERE " + conditionFPrice;
            }
        }
        System.out.println("condition: " + condition);
        // tính số trang để phân trang
        int product = ProductDAO.getInstance().getNumberOfProducts(condition);
        int productsInPage = 24;
        int index = 1;
        int pages = 1;
        pages = product / productsInPage;
        if (pages < 1) {
            pages = 1;
        } else {
            if ((product % productsInPage) > 0) {
                pages++;
            }
        }
        try {
            index = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException e) {

        }
        int indexPage = 0;
        if (index > 1) {
            indexPage = (index - 1) * productsInPage;
        }

        System.out.println(indexPage + "=================" + pages);

        LinkedHashMap<String, String> filterPrice = new LinkedHashMap<>();
        filterPrice.put("price_1", "Dưới 1.000.000");
        filterPrice.put("price_2", "Từ 1.000.000 đến 5.500.0000");
        filterPrice.put("price_3", "Từ 5.500.000 đến 22.500.000");
        filterPrice.put("price_4", "Trên 22.500.000");

        LinkedHashMap<String, String> sortProducts = new LinkedHashMap<>();
        sortProducts.put("top_seller", "Bán Chạy");
        sortProducts.put("price_asc", "Giá Thấp");
        sortProducts.put("price_desc", "Giá Cao");

        // list data products
        List<Product> list = ProductDAO.getInstance().getProducts(indexPage, productsInPage, condition, sortCondition);
        if (sortType != null) {
            if (sortType.equals("top_seller")) {
                list = ProductDAO.getInstance().getProductsTopSeller(indexPage, productsInPage, condition);
            }
        }
        request.setAttribute("sortProducts", sortProducts);
        request.setAttribute("filterPrice", filterPrice);
        request.setAttribute("filPrice", filPrice);
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
