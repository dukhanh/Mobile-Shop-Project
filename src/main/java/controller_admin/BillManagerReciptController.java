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
        String billId = request.getParameter("billId");
//get data from dao
        BillDAO dao = new BillDAO();
        List<Bill> list = dao.showAllBill();
        int totalBill = BillDAO.getInstance().totalBill(billId);
//set data to jsp

        request.setAttribute("totalBill", totalBill);
        request.setAttribute("listBill",list);
        request.getRequestDispatcher("/admin/admin-manager-recipt.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}