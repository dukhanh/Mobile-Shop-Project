package service;

import dao.FavoriteProductDAO;

public class FavoriteService {
    public static  String isExist(int userId, int productId) {
        if (FavoriteProductDAO.getInstance().checkExistFavorite(userId, productId)) {
            return "is-active-like";
        }
        return "";
    }

    // main method

}
