package controller;

import dao.CartDAO;
import model.Account;
import model.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BuyNowController", value = "/buy_now")
public class BuyNowController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            response.sendRedirect("/login");
        } else {
            int userId = account.getId();
            boolean isExist = CartDAO.getInstance().checkExistsProductInCart(userId, productId);
            if (isExist) {
                CartDAO.getInstance().updateProductInCart(userId, productId, quantity);
            } else {
                CartDAO.getInstance().addProductToCart(userId, productId, quantity);
            }
            List<Cart> cartList = CartDAO.getInstance().getAllProductCart(userId);
            int totalProduct = CartDAO.getInstance().sumQuantityProductInCart(userId);

            session.setAttribute("quantityProductInCart", totalProduct);
            request.setAttribute("cartList", cartList);
            request.setAttribute("buyNowProduct", productId);
            request.getRequestDispatcher("/customer/cart.jsp").forward(request, response);
        }
    }
}
