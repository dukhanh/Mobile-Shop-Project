package controller;

import bean.Account;
import dao.AccountDAO;
import mode_utility.Encrypt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Login", value = "/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String errorMessage = "";
        Account account = AccountDAO.getInstance().Login(email, Encrypt.MD5(password));
        if (account == null) {
            errorMessage = "Sai email hoặc mật khẩu. Vui lòng nhập lại";
            request.setAttribute("errorMessage", errorMessage);
            request.setAttribute("email", email);
            request.setAttribute("password", password);
            request.getRequestDispatcher("/account/login-form.jsp").forward(request, response);
        } else {
            if (account.getStatus().equals("open")) {
                HttpSession session = request.getSession();
                session.setAttribute("account", account);
                response.sendRedirect("home");
            } else {
                errorMessage = "Tài khoản của đã bị khóa. Vui lòng liên hệ để được hỗ trợ.";
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("/account/login-form.jsp").forward(request, response);
            }

        }
    }
}
