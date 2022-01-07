package dao;

import bean.Product;
import db.DBConnect;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;
import java.util.Objects;

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

    public  List<Product> getProducts(int page, int products) {
        Product product;
        List<Product> res = new LinkedList<>();
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement("SELECT * FROM SAN_PHAM LIMIT ?,?");
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

    public  int getNumberOfProducts(){
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement("SELECT COUNT(*) FROM SAN_PHAM");
            ResultSet rs = psupdate.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return 0;
    }

//    public static void main(String[] args) {
//        ListIterator<Product> iterator = Objects.requireNonNull(ProductDAO.getProducts()).listIterator();
//        System.out.println(ProductDAO.getNumberOfProducts());
//
//    }

}
