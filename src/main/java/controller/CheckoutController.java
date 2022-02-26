package controller;

import dao.CheckoutDAO;
import model.Account;
import model.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

@WebServlet(name = "CheckOut", value = "/checkout")
public class CheckoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String[] items = request.getParameterValues("selected");
        Account account = (Account) session.getAttribute("account");
        List<Cart> listProduct = new LinkedList<>();
        int total = 0;
        int deliveryCharge = 50000;
        int totalBill = 0;
        if (account == null) {
            response.sendRedirect("/login");
        } else {
            int userId = account.getId();
            for (String item : items) {
                Cart cart = CheckoutDAO.getInstance().getProductById(userId, Integer.parseInt(item));
                total += CheckoutDAO.getInstance().getTotalPriceProduct(userId, Integer.parseInt(item));
                listProduct.add(cart);
            }
            totalBill = total + deliveryCharge;
            request.setAttribute("total", total);
            request.setAttribute("deliveryCharge", deliveryCharge);
            request.setAttribute("totalBill", totalBill);
            request.setAttribute("listProduct", listProduct);
            request.getRequestDispatcher("/customer/checkout.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
