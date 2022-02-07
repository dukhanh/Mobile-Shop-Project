package ajax;

import dao.CartDAO;
import mode_utility.Format;
import model.Account;
import model.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "DeleteProductCart", value = "/delete_product_cart")
public class DeleteProductCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        int productId = Integer.parseInt(request.getParameter("product"));
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            int userId = account.getId();
            CartDAO.getInstance().deleteProductFromCart(userId, productId);
            session.setAttribute("quantityProductInCart", CartDAO.getInstance().sumQuantityProductInCart(userId));

            List<Cart> cartList = CartDAO.getInstance().getAllProductCart(userId);
            PrintWriter out = response.getWriter();
            for (int i = 0; i < cartList.size(); i++) {
                out.println(" <tr>\n" +
                        "                    <td>\n" +
                        "                        <div class=\"item-center pdl10\"><label>\n" +
                        "                            <input type=\"checkbox\" value=\""+cartList.get(i).getId()+"\" class=\"checkbox-element checkbox-element-child\">\n" +
                        "                        </label></div>\n" +
                        "                    </td>\n" +
                        "                    <td>\n" +
                        "                        <div class=\"product-title item-center\" style=\"width:100%\">\n" +
                        "                            <a href=\"productdetails?id=" + cartList.get(i).getId() + "\"><img src=\"" + cartList.get(i).getImageUrl() + "\" alt=\"\"></a>\n" +
                        "                            <div style=\"margin-left:20px;\">\n" +
                        "                                <a href=\"productdetails?id=" + cartList.get(i).getId() + "\"><p>" + cartList.get(i).getName() + "</p></a>\n" +
                        "                                    <p>Màu sắc: " + cartList.get(i).getColor() + "</p>\n" +
                        "                            </div>\n" +
                        "                        </div>\n" +
                        "                    </td>\n" +
                        "                    <td>\n" +
                        "                        <div class=\"item-center text-red\"><p id=\"price-product\">" + Format.formatIntToMoney(cartList.get(i).getPriceSale()) + "\n" +
                        "                        </div>\n" +
                        "                    </td>\n" +
                        "                    <td>\n" +
                        "                        <div class=\"item-center\">\n" +
                        "                            <div class=\"quantity\">\n" +
                        "                                <button class=\"btn-quantity decrease-quantity\"\n" +
                        "                                        onclick=\"decreaseQuantity(this," + cartList.get(i).getId() + ")\" type=\"button\">-\n" +
                        "                                </button>\n" +
                        "                                <input type=\"number\" name=\"quantity\" value=\"" + cartList.get(i).getQuantity() + "\"\n" +
                        "                                       class=\"quantity-input quantity-product-cart\" readonly>\n" +
                        "                                <button class=\"btn-quantity increase-quantity\"\n" +
                        "                                        onclick=\"increaseQuantity(this," + cartList.get(i).getId() + ")\" type=\"button\">+\n" +
                        "                                </button>\n" +
                        "                            </div>\n" +
                        "                        </div>\n" +
                        "                    </td>\n" +
                        "                    <td>\n" +
                        "                        <div class=\"item-center pinside10\"><button class=\"delete-product\" onclick=\"deleteProductInCart(" + cartList.get(i).getId() + "," + i + ")\"><i class=\"far fa-trash-alt\"></i></button></div>\n" +
                        "                    </td>\n" +
                        "                </tr>");
            }

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
