package controller_account;

import dao.AccountDAO;
import mode_utility.OTP;
import mode_utility.SendEmail;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SendCodeForgotPass", value = "/send_code_forgot_pass")
public class SendCodeForgotPass extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String errorMessage = null;
        AccountDAO accountDAO = new AccountDAO();
        if(accountDAO.checkAccountExists(email)!=null){
            OTP sysOtp = new OTP();
            int otpCode = sysOtp.randomOTP();
            if(SendEmail.sendOTP(email, otpCode)){
                HttpSession session = request.getSession();
                session.setAttribute("otpForgotPass", otpCode);
                session.setAttribute("emailRegister", email);
                session.setMaxInactiveInterval(60);
                request.getRequestDispatcher("/account/checkOTP.jsp").forward(request, response);
            }
        }else{
            errorMessage="Email không tồn tại trên hệ thống";
            request.setAttribute("email", email);
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("/account/forgot-password.jsp").forward(request, response);
        }
    }
}
