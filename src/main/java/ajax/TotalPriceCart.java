package ajax;

import dao.CartDAO;
import model.Account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "TotalPriceCart", value = "/get_total_cart")
public class TotalPriceCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        int userId = account.getId();
        String[] productIds = request.getParameterValues("productId[]");
        int totalPrice = 0;
        PrintWriter out = response.getWriter();
        if (productIds.length > 0) {
            for (String productId : productIds) {
                totalPrice += CartDAO.getInstance().sumPriceProductInCart(userId, Integer.parseInt(productId));
            }
        }
        out.println(totalPrice);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
