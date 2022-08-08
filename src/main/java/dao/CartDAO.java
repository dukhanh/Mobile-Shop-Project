package dao;

import model.Cart;
import model.Product;
import db.DBConnect;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class CartDAO {
    private static CartDAO cartDAO;

    public CartDAO() {

    }

    public static  CartDAO getInstance() {
        if (cartDAO == null) {
            cartDAO = new CartDAO();
        }
        return cartDAO;
    }
    // get all from gio hang and san pham table by userId
    public List<Cart> getAllProductCart(int userId) {
        String sql = "SELECT * FROM GIO_HANG g JOIN SAN_PHAM s ON g.ID_SP = s.ID_SANPHAM WHERE g.ID_USER = ?";
        List<Cart> res = new LinkedList<>();
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, userId);
            ResultSet rs = psupdate.executeQuery();

            while (rs.next()) {
                Cart cart = new Cart();
                cart.setId(rs.getInt("ID_SANPHAM"));
                cart.setName(rs.getString("TEN_SP"));
                cart.setPriceSale(rs.getInt("GIA_KM"));
                cart.setImageUrl(rs.getString("ANH_CHINH"));
                cart.setColor(rs.getString("MAU_SAC"));
                cart.setQuantity(rs.getInt("SL_SP"));
                res.add(cart);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return null;
        }
        return res;
    }
    // delete san pham from gio hang table by userId
    public boolean deleteProductFromCart(int userId, int productId) {
        String sql = "DELETE FROM GIO_HANG WHERE ID_USER = ? AND ID_SP = ?";
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
    // insert san pham to gio hang table by userId
    public boolean addProductToCart(int userId, int productId, int quantity) {
        String sql = "INSERT INTO GIO_HANG (ID_USER, ID_SP, SL_SP) VALUES (?, ?, ?)";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, userId);
            psupdate.setInt(2, productId);
            psupdate.setInt(3, quantity);
            psupdate.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return false;
        }
        return false;
    }
    // update sl sp in gio hang table by userId
    public boolean updateProductInCart(int userId, int productId, int quantity) {
        String sql = "UPDATE GIO_HANG SET SL_SP = ? WHERE ID_USER = ? AND ID_SP = ?";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, quantity);
            psupdate.setInt(2, userId);
            psupdate.setInt(3, productId);
            psupdate.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return false;
        }
        return false;
    }

    // check exists product in gio hang table
    public boolean checkExistsProductInCart(int userId, int productId) {
        String sql = "SELECT * FROM GIO_HANG WHERE ID_USER = ? AND ID_SP = ?";
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

    // sum quantity of product by userId in gio hang table
    public int sumQuantityProductInCart(int userId) {
        String sql = "SELECT COUNT(ID_SP) AS SL_SP FROM GIO_HANG WHERE ID_USER = ?";
        int quantity = 0;
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, userId);
            ResultSet rs = psupdate.executeQuery();
            if (rs.next()) {
                quantity = rs.getInt("SL_SP");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return 0;
        }
        return quantity;
    }
    // check quantity a product in gio hang table
    public int checkQuantityProductInCart(int userId, int productId) {
        String sql = "SELECT SL_SP FROM GIO_HANG WHERE ID_USER = ? AND ID_SP = ?";
        int quantity = 0;
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, userId);
            psupdate.setInt(2, productId);
            ResultSet rs = psupdate.executeQuery();
            if (rs.next()) {
                quantity = rs.getInt("SL_SP");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return 0;
        }
        return quantity;
    }

    // count price * quantity  product by userId in gio hang table
        public int sumPriceProductInCart(int userId, int productId) {
        String sql = "SELECT (g.SL_SP * s.GIA_KM) AS GIA_SP FROM GIO_HANG g join SAN_PHAM s on g.ID_SP = s.ID_SANPHAM WHERE ID_USER = ? AND ID_SP = ?";
        int price = 0;
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, userId);
            psupdate.setInt(2, productId);
            ResultSet rs = psupdate.executeQuery();
            if (rs.next()) {
                price = rs.getInt("GIA_SP");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return 0;
        }
        return price;
    }
    // main method test the last method








}
