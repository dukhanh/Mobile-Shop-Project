package controller_account;

import dao.AccountDAO;
import mode_utility.OTP;
import mode_utility.SendEmail;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SendCodeRegister", value = "/send_code_register")
public class SendCodeRegister extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/account/send-code-register.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String errorMessage = null;
        AccountDAO accountDAO = new AccountDAO();
        if(accountDAO.checkAccountExists(email)!=null){
            errorMessage="Email này đã được đăng ký";
            request.setAttribute("email", email);
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("/account/send-code-register.jsp").forward(request, response);
        }else{
            OTP sysOtp = new OTP();
            int otpCode = sysOtp.randomOTP();
            if(SendEmail.sendOTP(email, otpCode)){
                HttpSession session = request.getSession();
                session.setAttribute("otp", otpCode);
                session.setAttribute("emailRegister", email);
                session.setMaxInactiveInterval(60);
                request.getRequestDispatcher("/account/signup-form.jsp").forward(request, response);
            }

        }
    }
}
