package controller_account;

import dao.ReportDAO;
import model.Account;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/report")
public class ReportController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/customer/contact-us.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
       HttpSession session = request.getSession(true);
       Account account = (Account) session.getAttribute("account");
       String name = request.getParameter("name") == null ? account.getFullName() :request.getParameter("name"); 
       String phone = request.getParameter("phone") == null ? account.getPhoneNumber() :request.getParameter("phone"); 
       String email = request.getParameter("email") == null ? account.getEmail() :request.getParameter("email"); 
       String title = request.getParameter("title");
       String description = request.getParameter("description");

       ReportDAO.getInstance().insertReport(name, phone, email, title, description);
        response.sendRedirect("/report");
    }
}
