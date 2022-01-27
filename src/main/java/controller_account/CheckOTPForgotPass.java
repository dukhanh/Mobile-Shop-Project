package controller_account;

import mode_utility.OTP;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CheckOTPForgotPass", value = "/verify_code")
public class CheckOTPForgotPass extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        String email = request.getParameter("email");
        HttpSession session = request.getSession();
        Object otpSystem = session.getAttribute("otpForgotPass");
        String errorMessage = "";
        if (otpSystem != null) {
            OTP otp = new OTP();
            if (otp.checkOTP(code, otpSystem.toString())) {
                request.setAttribute("email", email);
                request.getRequestDispatcher("/account/get-password.jsp").forward(request, response);
            } else {
                errorMessage = "Mã OTP không đúng";
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("/account/checkOTP.jsp").forward(request, response);
            }
        } else {
            errorMessage = "Mã OTP hết hiệu lực";
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("/account/checkOTP.jsp").forward(request, response);
        }
    }
}
