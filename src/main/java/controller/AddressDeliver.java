package controller;

import dao.AddressDAO;
import model.Account;
import model.Address;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddressDeliver", value = "/address_deliver")
public class AddressDeliver extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            response.sendRedirect("/login");
        }else {
            int userId = account.getId();
            Address address = AddressDAO.getInstance().getAddressByUserId(userId);
            request.setAttribute("address", address);
            request.getRequestDispatcher("/customer/profile-address.jsp").forward(request, response);
//            request.getRequestDispatcher("/sub-component/address-form.jsp").forward(request, response);

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
