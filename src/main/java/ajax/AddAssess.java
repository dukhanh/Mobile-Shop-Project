package ajax;

import dao.AssessDAO;
import model.Account;
import model.Assess;
import service.AssessService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "AddAssess", value = "/add_assess")
public class AddAssess extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        int rateValue = Integer.parseInt(request.getParameter("rating"));
        String review = request.getParameter("review");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        int userId = account.getId();
//        String name = account.getFullName();
        int productId = Integer.parseInt(request.getParameter("productId"));

        Assess assess = new Assess();
        assess.setIdProduct(productId);
        assess.setIdUser(userId);
        assess.setRate(rateValue);
        assess.setReview(review);


        PrintWriter out = response.getWriter();
        AssessDAO.getInstance().insertAssess(assess);
        List<Assess> listAssess = AssessDAO.getInstance().getListAssess(productId);
        for (Assess a : listAssess) {
            out.println("<div class=\"col-lg-12 col-md-12 col-sm-12 col-xs-12\">\n" +
                    "                                            <p class=\"reviews-text\"><span class=\"text-default\">" + a.getNameAssess() + "</span>\n" +
                    "                                            </p>\n" +
                    "                                            <div class=\"product-rating rate-star\">\n" +
                    AssessService.getInstance().printStar(a.getRate()) +
                    "                                            </div>\n" +
                    "                                            <p>" + a.getReview() + "</p>\n" +
                    "                                        </div>\n" +
                    "                                        <div class=\"col-lg-12 col-md-12 col-sm-12 col-xs-12\">\n" +
                    "                                            <div class=\"divider-line\"></div>\n" +
                    "                                        </div>");
        }

    }
}
