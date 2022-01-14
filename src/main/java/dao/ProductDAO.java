package dao;

import bean.Product;
import db.DBConnect;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class ProductDAO {
    private static ProductDAO productDAO;

    public ProductDAO() {

    }

    public static ProductDAO getInstance() {
        if (productDAO == null) {
            productDAO = new ProductDAO();
        }
        return productDAO;
    }

    public List<Product> getProducts(int page, int products, String condition, String sort) {
        Product product;
        List<Product> res = new LinkedList<>();
        String sql ="SELECT * FROM SAN_PHAM WHERE 1=1 " + condition + "\n" + sort + " LIMIT ?,?";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, page);
            psupdate.setInt(2, products);
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
        Product product;
        List<Product> res = new LinkedList<>();
        String sql = "select * from san_pham sp join sl_sp ss on sp.ID_SANPHAM = ss.ID_SANPHAM " + condition + " ORDER BY SL_DABAN DESC LIMIT ?,?";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, page);
            psupdate.setInt(2, products);

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

    public List<Product> getProductsByBrand(String[] id) {
        Product product;
        List<Product> res = new LinkedList<>();
        String sql = "SELECT *\n" +
                "from san_pham \n";
        if (id != null) {
            sql += " WHERE ID_THUONG_HIEU IN(";
            for (String s : id) {
                sql += s + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
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

//
//    public static void main(String[] args) {
//        ProductDAO p = new ProductDAO();
//        String[] a = {"18804","17825"};
//        Iterator<Product> l = p.getProductsByBrand(a).iterator();
//        while(l.hasNext()) {
//            System.out.println(l.next().getName());
//        }
//    }


}
