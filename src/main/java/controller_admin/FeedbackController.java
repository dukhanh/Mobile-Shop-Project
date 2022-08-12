package controller_admin;

import dao.FeedbackDAO;
import model.Feedback;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FeedbackController", value = "/admin/feedback")
public class FeedbackController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//get data from dao
        FeedbackDAO dao = new FeedbackDAO();
        List<Feedback> list = dao.showAllFeedbacks();
//set data to jsp
        request.setAttribute("listFeedbacks",list);
        request.getRequestDispatcher("/admin/feedback.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
