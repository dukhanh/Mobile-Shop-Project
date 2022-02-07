package controller_account;

import model.Account;
import dao.AccountDAO;
import mode_utility.OTP;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CreateAccount", value = "/create_account")
public class CreateAccount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("emailRegister");
        Object otpSystem = session.getAttribute("otp");
        String code = request.getParameter("code");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String errorMessage = "";
//        request.setAttribute("email", email);


        if (email != null && otpSystem != null) {
            OTP otp = new OTP();
            if (otp.checkOTP(code, otpSystem.toString())) {
                Account account = new Account(email, name, password);
                AccountDAO.getInstance().addAccount(account);
                request.setAttribute("messageSuccess", "Đăng kí tài khoản thành công");

                session.setAttribute("account", account);
                request.getRequestDispatcher("home").forward(request, response);
            } else {
                errorMessage = "Mã OTP không đúng";
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("/account/signup-form.jsp").forward(request, response);
            }

        } else {
            errorMessage = "Mã OTP hết hiệu lực";
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("/account/signup-form.jsp").forward(request, response);
        }


    }
}
