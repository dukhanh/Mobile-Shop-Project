package ajax;

import dao.BillDAO;
import mode_utility.Format;
import model.BillDetail;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ShowReceipt", value = "/admin/show_receipt")
public class ShowReceipt extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String receiptId = request.getParameter("receiptId");

        Map<String, String> inforReceipt = BillDAO.getInstance().showInforReceipt(receiptId);
        List<BillDetail> productBill = BillDAO.getInstance().getProductBillById(receiptId);


        StringBuilder products = new StringBuilder();
        for (BillDetail b : productBill) {
            products.append("<tr class=\"product__row\">\n" + "<td style=\"max-width: 140px;\">\n" + "<img src=\"").append(b.getImageProduct()).append("\"\n").append("height=\"100px\" alt=\"\">\n").append("</td>\n").append("<td>").append(b.getIdProduct()).append("</td>\n").append("<td>").append(b.getProductName()).append("</td>\n").append("<td>").append(b.getColorProduct()).append("</td>\n").append("<td style=\"min-width: 160px;\">").append(b.getQuantity()).append("</td>\n").append("<td style=\"min-width: 160px;\">").append(Format.formatIntToMoney(b.getPriceBill())).append("</td>\n").append("</tr>\n");
        }

        PrintWriter out = response.getWriter();
        out.println("<h5>Đơn hàng: " + receiptId + "</h5>\n" +
                "                                        <table width=\"100%\" class=\"text-center  table content-detail  table-hover\">\n" +
                "                                            <thead class=\"thead-light\">\n" +
                "                                            <tr>\n" +
                "                                                <th>Mã khách hàng</th>\n" +
                "                                                <th>Tên khách hàng</th>\n" +
                "                                                <th><span title=\"Số điện thoại\"> Số điện thoại</span></th>\n" +
                "                                                <th style=\"width: 600px;\"> Địa chỉ</th>\n" +
                "                                            </tr>\n" +
                "                                            </thead>\n" +
                "                                            <tr>\n" +
                "                                                <td>" + receiptId + "</td>\n" +
                "                                                <td>" + inforReceipt.get("TEN_ND") + "</td>\n" +
                "                                                <td><span title=\"Số điện thoại\">" + inforReceipt.get("SDT") + "</span></td>\n" +
                "                                                <td style=\"width: 600px;\">" + inforReceipt.get("DIA_CHI") + "</td>\n" +
                "                                            </tr>\n" +
                "                                        </table>\n" +
                "                                        <table width=\"100%\" style=\"margin-bottom: 0\"\n" +
                "                                               class=\"text-center  table content-detail  table-hover\">\n" +
                "                                            <thead class=\"thead-light\">\n" +
                "                                            <tr>\n" +
                "                                                <th>Hình ảnh</th>\n" +
                "                                                <th>Mã sản phẩm</th>\n" +
                "                                                <th>Tên sản phẩm</th>\n" +
                "                                                <th>Màu sắc</th>\n" +
                "                                                <th>Số lượng</th>\n" +
                "                                                <th> Giá</th>\n" +
                "                                            </tr>\n" +
                "                                            </thead>\n" +
                products +
                "                                        </table>");
        ;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
