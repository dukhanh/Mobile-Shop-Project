package service;

import bean.Product;

import java.util.List;

public class ProductService {
    private static ProductService instance;

    private static ProductService getInstance(){
        if(instance ==null){
            instance = new ProductService();
        }
        return instance;
    }

    private ProductService(){

    }

}
