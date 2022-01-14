package controller;

import bean.Brand;
import bean.Product;
import dao.BrandDAO;
import dao.CategoryDAO;
import dao.ProductDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@WebServlet(name = "ProductList", value = "/ProductList")
public class ProductList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryId = request.getParameter("cid");
        String sortType = request.getParameter("sort");
        String filPrice = request.getParameter("price");
        String[] iBrand = request.getParameterValues("ibrand");

        int index = 1;
        try {
            index = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException ignored) {

        }
        int productsInPage = 24;
        // sắp xếp sản phẩm

        String sortCondition = sortPriceCondition(sortType);
        String condition = conditionWhere(categoryId, filPrice);

        int product = ProductDAO.getInstance().getNumberOfProducts(condition);
        int pages = dividePages(product);
        int indexPage = startIndex(index);

        String categortyWhere = "";
        if (categoryId != null) {
            categortyWhere = "AND ID_LOAI_SP=" + categoryId;
        }

        LinkedHashMap<String, String> filterPrice = new LinkedHashMap<>();
        filterPrice.put("price_1", "Dưới 1.000.000");
        filterPrice.put("price_2", "Từ 1.000.000 đến 5.500.0000");
        filterPrice.put("price_3", "Từ 5.500.000 đến 22.500.000");
        filterPrice.put("price_4", "Trên 22.500.000");

        LinkedHashMap<String, String> sortProducts = new LinkedHashMap<>();
        sortProducts.put("top_seller", "Bán Chạy");
        sortProducts.put("price_asc", "Giá Thấp");
        sortProducts.put("price_desc", "Giá Cao");


        List<Brand> listBrand = BrandDAO.getInstance().getTopBrand();
        boolean[] isBrandChecked = new boolean[listBrand.size()];
        for (int i = 0; i < isBrandChecked.length; i++) {
            isBrandChecked[i] = isChecked(listBrand.get(i).getId(), iBrand);
        }
        // list data products

        List<Product> list = ProductDAO.getInstance().getProducts(indexPage, productsInPage, condition, sortCondition);
        if (sortType != null) {
            if (sortType.equals("top_seller")) {
                list = ProductDAO.getInstance().getProductsTopSeller(indexPage, productsInPage, condition);
            }
        }

        if(iBrand!=null){
            list = ProductDAO.getInstance().getProductsByBrand(iBrand);
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
        request.setAttribute("brand", listBrand);
        request.setAttribute("isBrandCheck", isBrandChecked);
        request.getRequestDispatcher("/customer/product-list.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private String conditionWhere(String category, String price) {
        String condition = "";
        if (category != null) {
            condition = "WHERE ID_LOAI_SP = " + category;
        }

        String conditionFPrice = "";
        if (price != null) {
            if (price.equals("price_1")) {
                conditionFPrice = "GIA_KM BETWEEN 0 AND 1000000";
            }
            if (price.equals("price_2")) {
                conditionFPrice = "GIA_KM BETWEEN 1000000 AND 5500000";
            }
            if (price.equals("price_3")) {
                conditionFPrice = "GIA_KM BETWEEN 5500000 AND 22500000";
            }
            if (price.equals("price_4")) {
                conditionFPrice = "GIA_KM > 22500000";
            }
        }
        if (!conditionFPrice.equals("")) {
            if (!condition.equals("")) {
                condition += " AND (" + conditionFPrice + ")";
            } else {
                condition = "WHERE " + conditionFPrice;
            }
        }
        return condition;
    }

    private String sortPriceCondition(String sortType) {
        String sortCondition = "";
        if (sortType != null) {
            if (sortType.equals("price_asc")) {
                sortCondition = "ORDER BY GIA_KM ASC";
            } else {
                sortCondition = "ORDER BY GIA_KM DESC";
            }
        }
        return sortCondition;
    }

    private int dividePages(int amountProduct) {
        int PRODUCT_SIZE = 24;
        int pages = 1;
        pages = amountProduct / PRODUCT_SIZE;
        if (pages < 1) {
            pages = 1;
        } else {
            if ((amountProduct % PRODUCT_SIZE) > 0) {
                pages++;
            }
        }
        return pages;
    }

    private int startIndex(int index) {
        int indexPage = 0;
        if (index > 1) {
            indexPage = (index - 1) * 24;
        }
        return indexPage;
    }

    private boolean isChecked(int id, String[] ibrand) {
        if (ibrand == null) {
            return false;
        } else {
            for (String s : ibrand) {
                if (Integer.parseInt(s) == id)
                    return true;
            }
        }
        return false;
    }

}
