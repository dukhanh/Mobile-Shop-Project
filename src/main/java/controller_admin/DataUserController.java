package controller_admin;

import dao.DataUserDAO;
import model.DataUser;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DataUserController", value = "/admin/dataUser")
public class DataUserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//get data from dao
        DataUserDAO dao = new DataUserDAO();
        List<DataUser> list = dao.showAllDataUSer();
//set data to jsp
        request.setAttribute("listDataUser",list);
        request.getRequestDispatcher("/admin/dataUser.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
