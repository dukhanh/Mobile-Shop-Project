package controller;

import dao.BillDAO;
import dao.CartDAO;
import dao.CheckoutDAO;
import dao.ProductDAO;
import model.Account;
import model.Bill;
import model.BillDetail;
import model.Cart;
import service.BillService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.LinkedList;

@WebServlet(name = "BillDetailController", value = "/bill_detail")
public class BillDetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String billId = request.getParameter("billId");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            response.sendRedirect("/login");
        } else {
//            int userId = account.getId();
            LinkedList<BillDetail> billDetail = (LinkedList<BillDetail>) BillDAO.getInstance().getProductBillById(billId);
            Bill bill = BillDAO.getInstance().getBillById(billId);
            int totalBill = BillDAO.getInstance().totalBill(billId);

            request.setAttribute("billDetail", billDetail);
            request.setAttribute("bill", bill);
            request.setAttribute("totalBill", totalBill);
            request.getRequestDispatcher("/customer/bill-detail.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] products = request.getParameterValues("productId");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        int shipFee = 50000;
        if (account == null) {
            response.sendRedirect("/login");
        } else {
            int userId = account.getId();
            String billId = BillService.newBillID(BillDAO.getInstance().getLastIdBill());
            Bill bill = new Bill();
            bill.setIdBill(billId);
            bill.setIdUser(userId);
            bill.setShipFee(shipFee);
            bill.setStatus(BillService.statusBill(0));
            BillDAO.getInstance().saveBill(bill);
            for (String item : products) {
                Cart cart = CheckoutDAO.getInstance().getProductById(userId, Integer.parseInt(item));
                BillDetail billDetail = new BillDetail();
                billDetail.setIdBill(billId);
                billDetail.setIdProduct(cart.getId());
                billDetail.setQuantity(cart.getQuantity());
                billDetail.setPriceBill(cart.getPriceSale());
                BillDAO.getInstance().saveBillDetail(billDetail);
                CartDAO.getInstance().deleteProductFromCart(userId, cart.getId());
                ProductDAO.getInstance().updateQuantityProduct(cart.getId(), cart.getQuantity());
                ProductDAO.getInstance().updateSaleQuantityProduct(cart.getId(), cart.getQuantity());
            }
            response.sendRedirect("/bill_detail?billId=" + billId);
        }
    }
}
