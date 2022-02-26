package dao;

import db.DBConnect;
import model.Cart;
import model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CheckoutDAO {
    private static CheckoutDAO instance;

    private CheckoutDAO() {
    }

    public static CheckoutDAO getInstance() {
        if (instance == null) {
            instance = new CheckoutDAO();
        }
        return instance;
    }

    // get product by id from gio hang table return product
    public Cart getProductById(int idUser , int idProduct) {
        String sql = "SELECT * FROM SAN_PHAM s JOIN GIO_HANG g ON s.ID_SANPHAM = g.ID_SP WHERE g.ID_SP = ? AND g.ID_USER = ?";
        Cart product = new Cart();
        try {
            PreparedStatement preparedStatement = DBConnect.connect().getConnection().prepareStatement(sql);
            preparedStatement.setInt(1, idProduct);
            preparedStatement.setInt(2, idUser);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                product.setId(resultSet.getInt("ID_SP"));
                product.setName(resultSet.getString("TEN_SP"));
                product.setImageUrl(resultSet.getString("ANH_CHINH"));
                product.setPrice(resultSet.getInt("GIA_SP"));
                product.setPriceSale(resultSet.getInt("GIA_KM"));
                product.setQuantity(resultSet.getInt("SL_SP"));
            }
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
        return product;
    }
    // get total price of product in cart
    public int getTotalPriceProduct(int idUser, int idProduct) {
        String sql = "SELECT GIA_KM * SL_SP AS TOTAL FROM SAN_PHAM s JOIN GIO_HANG g ON s.ID_SANPHAM = g.ID_SP WHERE g.ID_USER = ? AND g.ID_SP = ?";
        int total = 0;
        try {
            PreparedStatement preparedStatement = DBConnect.connect().getConnection().prepareStatement(sql);
            preparedStatement.setInt(1, idUser);
            preparedStatement.setInt(2, idProduct);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                total = resultSet.getInt("TOTAL");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return total;
    }

    // test getProductById method
    public static void main(String[] args) {
        System.out.println(getInstance().getTotalPriceProduct(1, 7447383));
    }


}
