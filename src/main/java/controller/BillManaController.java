package controller;

import dao.BillDAO;
import model.Account;
import model.Bill;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BillManaController", value = "/bill_list")
public class BillManaController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            response.sendRedirect("/login");
        } else {
            int userId = account.getId();
            List<Bill> bills = BillDAO.getInstance().getBillsByUserId(userId);
            request.setAttribute("bills", bills);
            request.getRequestDispatcher("/customer/profile-receipt.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
