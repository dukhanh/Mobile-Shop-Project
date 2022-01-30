package controller_account;

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
        Cookie[] arr = request.getCookies();
        if (arr != null) {
            for (Cookie c : arr) {
                if (c.getName().equals("email")) {
                    request.setAttribute("email", c.getValue());
                    System.out.println(c.getValue());
                }
                if (c.getName().equals("password")) {
                    request.setAttribute("password", c.getValue());
                    System.out.println(c.getValue());
                }
            }
        }
        request.getRequestDispatcher("/account/login-form.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        String errorMessage = "";
        Account account = AccountDAO.getInstance().Login(email, Encrypt.MD5(password));
        if (account == null) {
            errorMessage = "Sai email hoặc mật khẩu. Vui lòng nhập lại";
            request.setAttribute("errorMessage", errorMessage);
            request.setAttribute("email", email);
            request.getRequestDispatcher("/account/login-form.jsp").forward(request, response);
        } else {
            if (account.getStatus().equals("open")) {
                HttpSession session = request.getSession();
                session.setAttribute("account", account);

                Cookie emailCookie = new Cookie("email", email);
                Cookie passCookie = new Cookie("password", password);
                if (remember != null) {
                    passCookie.setMaxAge(60 * 60 * 24 * 10);
                } else {
                    passCookie.setMaxAge(0);
                }
                emailCookie.setMaxAge(60 * 60 * 24 * 10);
                response.addCookie(emailCookie);
                response.addCookie(passCookie);

                response.sendRedirect("home");
            } else {
                errorMessage = "Tài khoản của đã bị khóa. Vui lòng liên hệ để được hỗ trợ.";
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("/account/login-form.jsp").forward(request, response);
            }

        }
    }
}
