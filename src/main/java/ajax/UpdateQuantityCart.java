package ajax;

import dao.CartDAO;
import model.Account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateQuantityCart", value = "/update_quantity_product_cart")
public class UpdateQuantityCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        int productId = Integer.parseInt(request.getParameter("product"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            int userId = account.getId();
            CartDAO.getInstance().updateProductInCart(userId, productId, quantity);
            session.setAttribute("quantityProductInCart", CartDAO.getInstance().sumQuantityProductInCart(userId));
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
