package controller_account;

import model.Account;
import dao.AccountDAO;
import mode_utility.Encrypt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ResetPassword", value = "/reset_password")
public class ResetPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String currentPassword = request.getParameter("current-password");
        String newPassword = request.getParameter("new-password");
//        String rePassword = request.getParameter("re-password");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String email = account.getEmail();
        String password = AccountDAO.getInstance().getCurrentPassword(email);
        if (password.equals(Encrypt.MD5(currentPassword))) {
            if (newPassword.equals(currentPassword)) {
                request.setAttribute("message", "Mật khẩu mới trùng với mật khẩu cũ");
                request.getRequestDispatcher("/customer/profile-reset-password.jsp").forward(request, response);
            } else {
                AccountDAO.getInstance().resetPassword(email, Encrypt.MD5(newPassword));
                request.setAttribute("messageSuccess", "Đổi mật khẩu thành công");
                request.getRequestDispatcher("/customer/profile-reset-password.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("message", "Mật khẩu không đúng");
            request.getRequestDispatcher("/customer/profile-reset-password.jsp").forward(request, response);
        }

    }
}
