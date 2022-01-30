package controller;

import bean.Brand;
import bean.Product;
import dao.BrandDAO;
import dao.CategoryDAO;
import dao.ProductListDAO;
import mode_utility.Format;
import service.ProductListService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "ProductList", value = "/productlist")
public class ProductListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String categoryId = request.getParameter("cid");
        String sortType = request.getParameter("sort");
        String filPrice = request.getParameter("price");
        String[] iBrand = request.getParameterValues("ibrand");
        String textSearch = request.getParameter("search");

        // get current page
        int index = 1;
        try {
            index = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException ignored) {

        }
        int productsInPage = 24;
        // sắp xếp sản phẩm

        String sortCondition = ProductListService.sortPriceCondition(sortType);
        String condition = ProductListService.conditionWhere(categoryId, filPrice, textSearch, iBrand, sortCondition);

//        System.out.println(condition);

        int product = ProductListDAO.getInstance().getNumberOfProducts(condition);
        int pages = ProductListService.dividePages(product);
        int indexPage = ProductListService.startIndex(index);


        List<Brand> listBrand = BrandDAO.getInstance().getTopBrand();
        boolean[] isBrandChecked = new boolean[listBrand.size()];
        for (int i = 0; i < isBrandChecked.length; i++) {
            isBrandChecked[i] = ProductListService.isChecked(listBrand.get(i).getId(), iBrand);
        }
        // list data products

        List<Product> list = ProductListDAO.getInstance().getProducts(indexPage, productsInPage, condition, sortCondition);
        if (sortType != null) {
            if (sortType.equals("top_seller")) {
                list = ProductListDAO.getInstance().getProductsTopSeller(indexPage, productsInPage, condition);
            }
        }

        request.setAttribute("sortProducts", ProductListService.sortProducts);
        request.setAttribute("filterPrice", ProductListService.filterPrice);
        request.setAttribute("filPrice", filPrice);
        request.setAttribute("products", list);
        request.setAttribute("categorylist", CategoryDAO.getInstance().getCategory());
        request.setAttribute("index", index);
        request.setAttribute("pages", pages);
        request.setAttribute("category", categoryId);
        request.setAttribute("sorttype", sortType);
        request.setAttribute("brand", listBrand);
        request.setAttribute("isBrandCheck", isBrandChecked);
        request.setAttribute("iBrand", iBrand);
        request.setAttribute("search", textSearch);
        request.getRequestDispatcher("/customer/product-list.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
