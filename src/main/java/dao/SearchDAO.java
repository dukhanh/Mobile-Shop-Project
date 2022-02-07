package dao;

import model.Product;
import db.DBConnect;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class SearchDAO {
    private static SearchDAO searchDAO;

    public SearchDAO() {

    }

    public static SearchDAO getInstance() {
        if (searchDAO == null) {
            searchDAO = new SearchDAO();
        }
        return searchDAO;
    }

    public List<Product> searchByNameProducts(String textSearch) {

        String sql = "SELECT * FROM san_pham WHERE TEN_SP like ?";
        List<Product> res = new LinkedList<>();
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setString(1, "%" + textSearch + "%");
            ResultSet rs = psupdate.executeQuery();

            res = ProductListDAO.getInstance().getProductsByResultSet(rs);

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return null;
        }
        return res;
    }
}
