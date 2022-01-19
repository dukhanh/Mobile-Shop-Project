package service;

import java.util.LinkedHashMap;

public class ProductListService {
    private static ProductListService instance;
    public static LinkedHashMap<String, String> filterPrice = new LinkedHashMap<>();
    public static LinkedHashMap<String, String> sortProducts = new LinkedHashMap<>();

    static {
        filterPrice.put("price_1", "Dưới 1.000.000");
        filterPrice.put("price_2", "Từ 1.000.000 đến 5.500.0000");
        filterPrice.put("price_3", "Từ 5.500.000 đến 22.500.000");
        filterPrice.put("price_4", "Trên 22.500.000");
    }

    static {
        sortProducts.put("top_seller", "Bán Chạy");
        sortProducts.put("best_new", "Mới nhất");
        sortProducts.put("promotion", "Khuyến mãi");
        sortProducts.put("price_asc", "Giá Thấp");
        sortProducts.put("price_desc", "Giá Cao");


    }

    public static ProductListService getInstance() {
        if (instance == null) {
            instance = new ProductListService();
        }
        return instance;
    }


    public static String conditionWhere(String category, String price, String[] iBrand, String sortCondition) {
        String condition = "";
        if (category != null) {
            condition = " AND ID_LOAI_SP = " + category;
        }

        String conditionFPrice = "";
        if (price != null) {
            if (price.equals("price_1")) {
                conditionFPrice = " AND (GIA_KM BETWEEN 0 AND 1000000)";
            }
            if (price.equals("price_2")) {
                conditionFPrice = " AND (GIA_KM BETWEEN 1000000 AND 5500000)";
            }
            if (price.equals("price_3")) {
                conditionFPrice = " AND (GIA_KM BETWEEN 5500000 AND 22500000)";
            }
            if (price.equals("price_4")) {
                conditionFPrice = " AND (GIA_KM > 22500000)";
            }
        }
        String sortPromotion = "";
        if (sortCondition.equals("promotion")) {
            sortPromotion = " AND ((GIA_SP-GIA_KM)>0)";
        }
        StringBuilder conditionBrand = new StringBuilder();
        if (iBrand != null) {
            conditionBrand.append(" AND ID_THUONG_HIEU IN(");
            for (String s : iBrand) {
                conditionBrand.append(s).append(",");
            }
            if (conditionBrand.toString().endsWith(",")) {
                conditionBrand = new StringBuilder(conditionBrand.substring(0, conditionBrand.length() - 1));
            }
            conditionBrand.append(")");
        }
        return condition + conditionFPrice + sortPromotion + conditionBrand.toString();
    }


    public static String sortPriceCondition(String sortType) {
        String sortCondition = "";
        if (sortType != null) {
            if (sortType.equals("price_asc")) {
                sortCondition = " ORDER BY GIA_KM ASC";
            }
            if (sortType.equals("price_desc")) {
                sortCondition = " ORDER BY GIA_KM DESC";
            }
            if (sortType.equals("best_new")) {
                sortCondition = " ORDER BY NGAY_CAPNHAT DESC";
            }
            if(sortType.equals("promotion")){
                sortCondition = " ORDER BY (GIA_SP-GIA_KM) DESC";
            }
        }
        return sortCondition;
    }

    public static int dividePages(int amountProduct) {
        int PRODUCT_SIZE = 24;
        int pages = 1;
        pages = amountProduct / PRODUCT_SIZE;
        if (pages < 1) {
            pages = 1;
        } else {
            if ((amountProduct % PRODUCT_SIZE) > 0) {
                pages++;
            }
        }
        return pages;
    }


    public static int startIndex(int index) {
        int indexPage = 0;
        if (index > 1) {
            indexPage = (index - 1) * 24;
        }
        return indexPage;
    }

    public static boolean isChecked(int id, String[] ibrand) {
        if (ibrand == null) {
            return false;
        } else {
            for (String s : ibrand) {
                if (Integer.parseInt(s) == id)
                    return true;
            }
        }
        return false;
    }


}
