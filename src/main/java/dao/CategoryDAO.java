package dao;

import model.Category;
import db.DBConnect;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class CategoryDAO {
    private static CategoryDAO categoryDao;

    public CategoryDAO() {

    }

    public static   CategoryDAO getInstance() {
        if (categoryDao == null) {
            categoryDao = new CategoryDAO();
        }
        return categoryDao;
    }


    public List<Category> getCategory() {
        Category category;
        List<Category> res = new LinkedList<>();
        String query = "SELECT * FROM LOAI_SP";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(query);

            ResultSet rs = psupdate.executeQuery();
            while (rs.next()) {
                category = new Category();
                category.setId(rs.getInt("ID"));
                category.setName(rs.getString("TEN"));
                res.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return null;
        }
        return res;
    }
//
//    public static void main(String[] args) {
//        CategoryDAO c = new CategoryDAO();
//        Iterator<Category> l = c.getCategory().iterator();
//        while(l.hasNext()){
//            System.out.println(l.next().getName());
//        }
//    }
}
