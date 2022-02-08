package service;

import dao.CartDAO;

public class CartService {
    // get quantity a product in cart
    public static int getQuantity(int userId,int productId) {
       return CartDAO.getInstance().checkQuantityProductInCart(userId,productId);
    }
}
