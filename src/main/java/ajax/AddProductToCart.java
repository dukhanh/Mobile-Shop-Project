package ajax;

import dao.CartDAO;
import dao.ProductDAO;
import model.Account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddProductToCart", value = "/add_product_to_cart")
public class AddProductToCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        int productId = Integer.parseInt(request.getParameter("productId"));
        int newQuantity = Integer.parseInt(request.getParameter("quantity"));
        Account account = (Account) session.getAttribute("account");
        PrintWriter out = response.getWriter();
        if (account != null) {
            int userId = account.getId();
            int quantity = CartDAO.getInstance().checkQuantityProductInCart(userId, productId);
            boolean isExist = CartDAO.getInstance().checkExistsProductInCart(userId, productId);
            int quantityExist = ProductDAO.getInstance().getQuantityProduct(productId);
            if (isExist) {
                if (quantityExist > quantity) {
                    if(newQuantity + quantity <= quantityExist) {
                        CartDAO.getInstance().updateProductInCart(userId, productId, quantity + newQuantity);
                        out.print("increase");
                    }else{
                        out.print("fail");
                    }
                } else {
                    out.print("fail");
                }
            } else {
                CartDAO.getInstance().addProductToCart(userId, productId, newQuantity);
                out.print("new");
            }
            int totalProduct = CartDAO.getInstance().sumQuantityProductInCart(userId);

            session.setAttribute("quantityProductInCart", totalProduct);
        }else{
            response.sendRedirect("/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
