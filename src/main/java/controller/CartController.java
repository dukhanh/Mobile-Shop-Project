package controller;

import model.Account;
import model.Cart;
import model.Product;
import dao.CartDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            response.sendRedirect("/login");
        }else{
            int userId = account.getId();
            List<Cart> cartList = CartDAO.getInstance().getAllProductCart(userId);
            int totalProduct = CartDAO.getInstance().sumQuantityProductInCart(userId);

            session.setAttribute("quantityProductInCart", totalProduct);

            request.setAttribute("quantityProduct",totalProduct);
            request.setAttribute("cartList", cartList);
            request.getRequestDispatcher("/customer/cart.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
