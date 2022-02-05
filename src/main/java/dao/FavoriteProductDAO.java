package dao;

import bean.Product;
import db.DBConnect;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class FavoriteProductDAO {
    private static FavoriteProductDAO favoriteDAO;

    public FavoriteProductDAO() {

    }

    // get singleton instance
    public static FavoriteProductDAO getInstance() {
        if (favoriteDAO == null) {
            favoriteDAO = new FavoriteProductDAO();
        }
        return favoriteDAO;
    }

    public List<Product> getFavoriteProducts(int userId) {
        List<Product> res = new LinkedList<>();
        String sql = "select * from san_pham sp join ds_yeuthich dy on sp.ID_SANPHAM = dy.ID_SP where dy.ID_USER = ?";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, userId);
            ResultSet rs = psupdate.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("ID_SANPHAM"));
                product.setName(rs.getString("TEN_SP"));
                product.setPrice(rs.getInt("GIA_SP"));
                product.setPriceSale(rs.getInt("GIA_KM"));
                product.setImageUrl(rs.getString("ANH_CHINH"));
                product.setColor(rs.getString("MAU_SAC"));
                res.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return null;
        }
        return res;
    }

    // add userId and productId to favorite table
    public boolean addFavorite(int userId, int productId) {
        String sql = "insert into ds_yeuthich(ID_USER, ID_SP) values(?, ?)";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, userId);
            psupdate.setInt(2, productId);
            psupdate.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return false;
        }
        return false;
    }
    // delete element from favorite table
    public void deleteFavorite(int userId, int productId) {
        String sql = "delete from ds_yeuthich where ID_USER = ? and ID_SP = ?";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, userId);
            psupdate.setInt(2, productId);
            psupdate.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException ignored) {
        }
    }

    // count by userId from favorite table
    public int countByUserId(int userId) {
        String sql = "select count(*) from ds_yeuthich where ID_USER = ?";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, userId);
            ResultSet rs = psupdate.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return 0;
        }
        return 0;
    }
    //count by email from favorite and tai khoan table
    public int countByEmail(String email) {
        String sql = "select count(*) from ds_yeuthich dy join tai_khoan tk on dy.ID_USER = tk.ID_USER where tk.EMAIL = ?";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setString(1, email);
            ResultSet rs = psupdate.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return 0;
        }
        return 0;
    }
    // check userId and productId from favorite table
    public boolean checkExistFavorite(int userId, int productId) {
        String sql = "select * from ds_yeuthich where ID_USER = ? and ID_SP = ?";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, userId);
            psupdate.setInt(2, productId);
            ResultSet rs = psupdate.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return false;
        }
        return false;
    }


}
