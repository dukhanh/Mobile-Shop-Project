package dao;

import bean.Product;

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
//    public List<Product> getProductsInCart(int idProduct){
//
//    }

}
