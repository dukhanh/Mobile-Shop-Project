package service;

public class ProductService {
    private static ProductService instance;

    private static ProductService getInstance() {
        if (instance == null) {
            instance = new ProductService();
        }
        return instance;
    }

    private ProductService() {

    }

}
