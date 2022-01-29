package dao;

import bean.Product;

import java.util.List;

public class FavoriteProductDAO {
    private static FavoriteProductDAO favoriteDAO;

    public FavoriteProductDAO() {

    }

    public static  FavoriteProductDAO getInstance() {
        if (favoriteDAO == null) {
            favoriteDAO = new FavoriteProductDAO();
        }
        return favoriteDAO;
    }


}
