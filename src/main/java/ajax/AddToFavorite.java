package ajax;

import model.Account;
import dao.FavoriteProductDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddToFavorite", value = "/add_favorite")
public class AddToFavorite extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("id");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        PrintWriter out = response.getWriter();
        if (account != null) {
            int userId = account.getId();
            if (!FavoriteProductDAO.getInstance().checkExistFavorite(userId, Integer.parseInt(productId))) {
                FavoriteProductDAO.getInstance().addFavorite(userId, Integer.parseInt(productId));
                out.print("success");
            }

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
