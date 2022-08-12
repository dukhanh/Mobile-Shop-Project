package controller_admin;


import dao.BrandDAO;
import model.Brand;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BrandController", value = "/admin/brand")
public class BrandController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//get data from dao
        BrandDAO dao = new BrandDAO();
        List<Brand> list = dao.showAllBrand();
//set data to jsp
        request.setAttribute("listBrand",list);
        request.getRequestDispatcher("/admin/admin-branch.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

