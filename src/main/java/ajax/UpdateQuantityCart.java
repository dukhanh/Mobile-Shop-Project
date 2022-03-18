package ajax;

import dao.CartDAO;
import dao.ProductDAO;
import model.Account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateQuantityCart", value = "/update_quantity_product_cart")
public class UpdateQuantityCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        int productId = Integer.parseInt(request.getParameter("product"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int quantityExist = ProductDAO.getInstance().getQuantityProduct(productId);

        PrintWriter out = response.getWriter();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            int userId = account.getId();
            if (quantityExist >= quantity && quantity > 0) {
                CartDAO.getInstance().updateProductInCart(userId, productId, quantity);
                out.print("success");
            }else{
                out.print("fail");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
