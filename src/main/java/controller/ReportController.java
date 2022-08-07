package controller;

import dao.ReportDAO;
import model.Report;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ReportController", value = "/reportController")
public class ReportController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//get data from dao
        ReportDAO dao = new ReportDAO();
        List<Report> list = dao.showAllReports();
//set data to jsp
        request.setAttribute("listReports",list);
        request.getRequestDispatcher("/admin/feedback.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
