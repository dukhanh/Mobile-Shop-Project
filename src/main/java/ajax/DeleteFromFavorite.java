package ajax;

import model.Account;
import model.Product;
import dao.FavoriteProductDAO;
import mode_utility.Format;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "DeleteFavorite", value = "/delete_favorite_product")
public class DeleteFromFavorite extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String productId = request.getParameter("id");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        int userId = account.getId();
        FavoriteProductDAO.getInstance().deleteFavorite(userId, Integer.parseInt(productId));

        session.setAttribute("amountFavorites", FavoriteProductDAO.getInstance().countByUserId(userId));
        List<Product> favoriteProducts = FavoriteProductDAO.getInstance().getFavoriteProducts(userId);
        PrintWriter out = response.getWriter();
        for (Product product : favoriteProducts) {
            out.print("<li class=\"item\">\n" +
                    "                                    <button onclick=\"deleteProduct(" + product.getId() + ")\" class=\"btn-delete\">×</button>\n" +
                    "                                    <div class=\"thumbnail\">\n" +
                    "                                        <a href=\"productdetails?id=" + product.getId() + "\" class=\"img\">\n" +
                    "                                            <img src=\"" + product.getImageUrl() + "\" alt=\"\">\n" +
                    "                                        </a>\n" +
                    "                                    </div>\n" +
                    "                                    <div class=\"body\">\n" +
                    "                                        <a href=\"productdetails?id=" + product.getId() + "\" class=\"name\">" + product.getName() + "</a>\n" +
                    "                                    </div>\n" +
                    "                                    <div class=\"footer\">\n" +
                    "                                        <div class=\"price-discount\">" + Format.formatIntToMoney(product.getPriceSale()) + "</div>\n" +
                    "                                            <div class=\"wrap\">\n" +
                    "                                                <div class=\"price\"><strike>" + Format.formatOriginalPrice(product.getPrice(), product.getPriceSale()) + "</strike></div>\n" +
                    "                                            </div>\n" +
                    "                                    </div>\n" +
                    "                                </li>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
