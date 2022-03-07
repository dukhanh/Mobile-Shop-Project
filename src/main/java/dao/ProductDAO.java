package dao;

import db.DBConnect;
import model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductDAO {
    private static ProductDAO instance;

    private ProductDAO() {
    }

    public static ProductDAO getInstance() {
        if (instance == null) {
            instance = new ProductDAO();
        }
        return instance;
    }

    // get product by id
    public Product getProductById(int id) {
        String sql = "SELECT * FROM SAN_PHAM WHERE ID_SANPHAM = ?";
        Product product = null;
        try {
            PreparedStatement statement = DBConnect.connect().getConnection().prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                product = new Product();
                product.setId(rs.getInt("ID_SANPHAM"));
                product.setName(rs.getString("TEN_SP"));
                product.setImageUrl(rs.getString("ANH_CHINH"));
                product.setColor(rs.getString("MAU_SAC"));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return product;
    }

    public int getQuantityProduct(int id) {
        String sql = "SELECT SO_LUONG FROM SL_SP WHERE ID_SANPHAM = ?";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, id);
            ResultSet rs = psupdate.executeQuery();
            if (rs.next()) {
                return rs.getInt("SO_LUONG");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return 0;
    }

    // update quantity product
    public void updateQuantityProduct(int id, int quantity) {
        String sql = "UPDATE SL_SP SET SO_LUONG = SO_LUONG-? WHERE ID_SANPHAM = ?";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, quantity);
            psupdate.setInt(2, id);
            psupdate.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void updateSaleQuantityProduct(int id, int quantity) {
        String sql = "UPDATE SL_SP SET SL_DABAN = SL_DABAN + ? WHERE ID_SANPHAM = ?";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, quantity);
            psupdate.setInt(2, id);
            psupdate.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        System.out.println(getInstance().getQuantityProduct(52063654));
    }

}
