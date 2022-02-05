package controller;

import bean.Account;
import bean.Product;
import dao.FavoriteProductDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FavoriteProduct", value = "/favorite_product")
public class FavoriteProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        int userId = account.getId();
        List<Product> favoriteProducts = FavoriteProductDAO.getInstance().getFavoriteProducts(userId);
        request.setAttribute("favoriteProducts", favoriteProducts);
        request.getRequestDispatcher("/customer/profile-favorite-list.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
