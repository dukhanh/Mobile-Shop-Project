package controller_account;

import dao.AccountDAO;
import mode_utility.Encrypt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "NewPassword", value = "/new_password")
public class NewPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        AccountDAO.getInstance().resetPassword(email, Encrypt.MD5(password));
        request.setAttribute("successNewPass", "Đổi mật khẩu thành công");
        request.getRequestDispatcher("/account/login-form.jsp").forward(request, response);
    }
}
