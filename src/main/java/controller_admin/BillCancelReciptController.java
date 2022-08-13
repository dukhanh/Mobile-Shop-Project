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

@WebServlet(name = "BillCancelReciptController", value = "/admin/billCancelRecipt")
public class BillCancelReciptController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//get data from dao
        BillDAO dao = new BillDAO();
        List<Bill> list = dao.showAllBillHasBeenCancel();
//set data to jsp
        request.setAttribute("listBill",list);
        request.getRequestDispatcher("/admin/admin-cancel-receipt.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}