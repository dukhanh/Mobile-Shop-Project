package dao;

import db.DBConnect;
import model.Bill;
import model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private static ProductDAO instance;

    public ProductDAO() {
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

    // show on admin view, need to update
    public List<Product> showAllProduct(){

        String sql = "SELECT san_pham.ANH_CHINH, san_pham.ID_SANPHAM, san_pham.TEN_SP, thuong_hieu.TENTH, san_pham.NGAY_CAPNHAT,sl_sp.SO_LUONG ,sl_sp.SL_DABAN,san_pham.GIA_SP \n" +
                "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tFROM san_pham JOIN thuong_hieu ON san_pham.ID_THUONG_HIEU = thuong_hieu.ID\n" +
                "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tJOIN sl_sp       ON sl_sp.ID_SANPHAM        = san_pham.ID_SANPHAM";
        Product p;
        List<Product> product = new ArrayList<Product>();
        ResultSet rs;
        PreparedStatement statement;
        try {
            statement = DBConnect.connect().getConnection().prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                p = new Product(rs.getString("ANH_CHINH")
                        ,rs.getInt("ID_SANPHAM")
                        ,rs.getString("TEN_SP")
                        ,rs.getString("TENTH")
                        ,rs.getString("NGAY_CAPNHAT")
                        ,rs.getInt("SO_LUONG")
                        ,rs.getInt("SL_DABAN")
                        ,rs.getInt("GIA_SP"));
                product.add(p);
            }

            return product;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        System.out.println(getInstance().getQuantityProduct(52063654));
    }

}
