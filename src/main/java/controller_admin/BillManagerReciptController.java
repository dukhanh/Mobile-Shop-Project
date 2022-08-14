package controller_admin;

import dao.BillDAO;
import model.Bill;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BillManagerReciptController", value = "/admin/billManagerRecipt")
public class BillManagerReciptController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Bill> list = BillDAO.getInstance().getAllBills();

        request.setAttribute("listBill",list);
        request.getRequestDispatcher("/admin/admin-manager-recipt.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}