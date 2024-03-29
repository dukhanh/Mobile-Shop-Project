package dao;

import model.Product;
import db.DBConnect;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class HomeDAO {
    private static HomeDAO homeDAO;

    public HomeDAO() {

    }

    public static HomeDAO getInstance() {
        if (homeDAO == null) {
            homeDAO = new HomeDAO();
        }
        return homeDAO;
    }

    public List<Product> getProductPromotion(int products) {
        Product product;
        List<Product> res = new LinkedList<>();
        String sql = "SELECT * \n" +
                "from SAN_PHAM \n" +
                "where (GIA_SP-GIA_KM)>0\n" +
                "ORDER BY (GIA_SP-GIA_KM) desc\n" +
                "limit 0,?";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, products);
            ResultSet rs = psupdate.executeQuery();
            while (rs.next()) {
                product = new Product();
                product.setId(rs.getInt("ID_SANPHAM"));
                product.setName(rs.getString("TEN_SP"));
                product.setPrice(rs.getInt("GIA_SP"));
                product.setPriceSale(rs.getInt("GIA_KM"));
                product.setImageUrl(rs.getString("ANH_CHINH"));
                res.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return null;
        }
        return res;
    }

    public List<Product> getProductTopSeller( int products) {
        Product product;
        List<Product> res = new LinkedList<>();
        String sql = "select *\n" +
                "from SAN_PHAM sp join SL_SP ss on sp.ID_SANPHAM = ss.ID_SANPHAM \n" +
                "ORDER BY SL_DABAN desc\n" +
                "LIMIT 0,?";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, products);
            ResultSet rs = psupdate.executeQuery();
            while (rs.next()) {
                product = new Product();
                product.setId(rs.getInt("ID_SANPHAM"));
                product.setName(rs.getString("TEN_SP"));
                product.setPrice(rs.getInt("GIA_SP"));
                product.setPriceSale(rs.getInt("GIA_KM"));
                product.setImageUrl(rs.getString("ANH_CHINH"));
                res.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return null;
        }
        return res;
    }

    public List<Product> getProductBestNew(int products) {
        Product product;
        List<Product> res = new LinkedList<>();
        String sql = "select *\n" +
                "from SAN_PHAM sp\n" +
                "ORDER BY NGAY_CAPNHAT desc\n" +
                "LIMIT 0,?";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, products);
            ResultSet rs = psupdate.executeQuery();
            while (rs.next()) {
                product = new Product();
                product.setId(rs.getInt("ID_SANPHAM"));
                product.setName(rs.getString("TEN_SP"));
                product.setPrice(rs.getInt("GIA_SP"));
                product.setPriceSale(rs.getInt("GIA_KM"));
                product.setImageUrl(rs.getString("ANH_CHINH"));
                res.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return null;
        }
        return res;
    }



    public static void main(String[] args) {
        HomeDAO p = new HomeDAO();
        Iterator<Product> l = p.getProductBestNew(6).iterator();
        while (l.hasNext()) {
            System.out.println(l.next().getName());
        }
    }
}
