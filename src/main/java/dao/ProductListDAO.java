package dao;

import model.Product;
import db.DBConnect;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class ProductListDAO {
    private static ProductListDAO productDAO;

    public ProductListDAO() {

    }

    public static ProductListDAO getInstance() {
        if (productDAO == null) {
            productDAO = new ProductListDAO();
        }
        return productDAO;
    }

    public List<Product> getProducts(int page, int products, String condition, String sort) {
        Product product;
        List<Product> res = new LinkedList<>();
        String sql = "SELECT * FROM SAN_PHAM WHERE 1=1 " + condition + "\n" + sort + " LIMIT ?,?";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, page);
            psupdate.setInt(2, products);
            ResultSet rs = psupdate.executeQuery();

            res = getProductsByResultSet(rs);

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return null;
        }
        return res;
    }

    public int getNumberOfProducts(String condition) {

        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement("SELECT COUNT(*) FROM SAN_PHAM WHERE 1=1 " + condition);
            ResultSet rs = psupdate.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Product> getProductsTopSeller(int page, int products, String condition) {
        List<Product> res = new LinkedList<>();
        String sql = "select * from SAN_PHAM sp join SL_SP ss on sp.ID_SANPHAM = ss.ID_SANPHAM " + condition + " ORDER BY SL_DABAN DESC LIMIT ?,?";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, page);
            psupdate.setInt(2, products);
            ResultSet rs = psupdate.executeQuery();

            res = getProductsByResultSet(rs);

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return null;
        }
        return res;
    }

    public List<Product> getProductPromotion(int page, int products, String condition) {
        List<Product> res = new LinkedList<>();
        String sql = "SELECT * \n" +
                "from SAN_PHAM \n" + condition + "AND ((GIA_SP-GIA_KM)>0) ORDER BY (GIA_SP-GIA_KM) desc LIMIT ?,?";

        PreparedStatement psupdate = null;
        try {
            psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, page);
            psupdate.setInt(2, products);
            ResultSet rs = psupdate.executeQuery();

            res = getProductsByResultSet(rs);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }


        return res;
    }

    public List<Product> getProductsByResultSet(ResultSet rs) {
        List<Product> res = new LinkedList<>();
        try {
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("ID_SANPHAM"));
                product.setName(rs.getString("TEN_SP"));
                product.setPrice(rs.getInt("GIA_SP"));
                product.setPriceSale(rs.getInt("GIA_KM"));
                product.setImageUrl(rs.getString("ANH_CHINH"));
                res.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return res;
    }
}

//
//    public static void main(String[] args) {
//        ProductDAO p = new ProductDAO();
//        String[] a = {"18804","17825"};
//        Iterator<Product> l = p.getProductsByBrand(a).iterator();
//        while(l.hasNext()) {
//            System.out.println(l.next().getName());
//        }
//    }



