package ajax;

import dao.FavoriteProductDAO;
import mode_utility.Format;
import model.Account;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "DeleteProductFavorite", value = "/delete_favorite")
public class DeleteProductFavorite extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        int productId = Integer.parseInt(request.getParameter("productId"));
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            int userId = account.getId();
            FavoriteProductDAO.getInstance().deleteFavorite(userId, productId);
            List<Product> favoriteProducts = FavoriteProductDAO.getInstance().getFavoriteProducts(userId);
            PrintWriter out = response.getWriter();
            if (favoriteProducts.size() == 0) {
                out.println(" <div class=\"null-favorite\">\n" +
                        "                                    <p>Chưa có danh mục yêu thích</p>\n" +
                        "                                    <p>Thêm sản phẩm vào danh sách yêu thích để hiển thị ở đây</p>\n" +
                        "                                    <a href=\"${pageContext.request.contextPath}/productlist\">Tiếp tục mua sắm</a>\n" +
                        "                                </div>");
            } else {
                for (Product product : favoriteProducts) {
                    out.println("<li class=\"item\">\n" +
                            "                                        <button type=\"button\" class=\"btn-delete\" onclick=\"deleteProductFavorite(" + product.getId() + ")\">x</button>\n" +
                            "                                        <div class=\"thumbnail\">\n" +
                            "                                            <a href=\"productdetails?id=" + product.getId() + "\" class=\"img\">\n" +
                            "                                                <img src=\"" + product.getImageUrl() + "\" alt=\"\">\n" +
                            "                                            </a>\n" +
                            "                                        </div>\n" +
                            "                                        <div class=\"body\">\n" +
                            "                                            <a href=\"productdetails?id=" + product.getId() + "\" class=\"name\">" + product.getName() + "</a>\n" +
                            "                                        </div>\n" +
                            "\n" +
                            "                                        <div class=\"footer\">\n" +
                            "                                            <div class=\"price-discount\">" + Format.formatIntToMoney(product.getPriceSale()) + "\n" +
                            "                                            </div>\n" +

                            "                                                <div class=\"wrap\">\n" +
                            "                                                    <div class=\"price\"><strike>" + Format.formatOriginalPrice(product.getPrice(), product.getPriceSale()) + "</strike></div>\n" +
                            "                                                </div>\n" +
                            "                                        </div>\n" +
                            "                                    </li>");
                }

            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
