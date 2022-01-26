package controller_account;

import bean.Account;
import dao.AccountDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateAccount", value = "/profile_update")
public class UpdateAccount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String phoneNumber = request.getParameter("phone");
        String address = request.getParameter("address");

        AccountDAO.getInstance().updateAccount(email, name, phoneNumber, address);
//        System.out.println("email: " + email + " name: " + name + " phone: " + phoneNumber + " address: " + address);
//
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        account.setFullName(name);
        account.setPhoneNumber(phoneNumber);
        account.setAddress(address);


        request.setAttribute("message", "Cập nhật tài khoản thành công");
        request.getRequestDispatcher("/customer/profile-account.jsp").forward(request, response);
    }
}
