package controller_admin;

import dao.AdminDAO;
import model.Turnover;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "HomeAdminController", value = "/admin")
public class HomeAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long totalIncome = AdminDAO.getInstance().totalIncome();
        long totalOrder = AdminDAO.getInstance().countOrder();
        long soldProduct = AdminDAO.getInstance().soldProduct();
        long restProduct = AdminDAO.getInstance().restProduct();

        List<Turnover> listTurnover = AdminDAO.getInstance().turnoverByMonth();

        request.setAttribute("totalIncome", totalIncome);
        request.setAttribute("totalOrder" , totalOrder);
        request.setAttribute("soldProduct",soldProduct);
        request.setAttribute("restProduct",restProduct);
        request.setAttribute("listTurnover", listTurnover);

        request.getRequestDispatcher("/admin/admin.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
