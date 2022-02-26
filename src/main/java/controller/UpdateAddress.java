package controller;

import dao.AddressDAO;
import model.Account;
import model.Address;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "UpdateAddress", value = "/update_address")
public class UpdateAddress extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            response.sendRedirect("/login");
        }else {
            request.getRequestDispatcher("/customer/profile-address.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("full-name");
        String phone = request.getParameter("phone-number");
        String province = request.getParameter("ls_province");
        String district = request.getParameter("ls_district");
        String ward = request.getParameter("ls_ward");
        String detail = request.getParameter("address-details");
        String typeAddress = request.getParameter("type-address");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        if (account != null) {
            int userId = account.getId();
            Address address = new Address();
            address.setUserId(userId);
            address.setFullName(name);
            address.setPhone(phone);
            address.setProvince(province);
            address.setDistrict(district);
            address.setWard(ward);
            address.setDetail(detail);
            address.setTypeAddress(typeAddress);
            if(AddressDAO.getInstance().checkAddressByUserId(userId)) {
                AddressDAO.getInstance().updateAddressByUserId(address);
            }else {
                AddressDAO.getInstance().insertAddress(address);
            }
            session.setAttribute("address", address);
            request.getRequestDispatcher("/customer/profile-address.jsp").forward(request, response);

        }
    }
}
