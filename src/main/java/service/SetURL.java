package service;

public class SetURL {
    public static String setUrtSort(String s) {
        if (s == null) {
            return "";
        } else {
            return "&sort=" + s;
        }
    }

    public static String setUrlCa(String category) {
        if (category == null) {
            return "";
        } else {
            return "&cid=" + category;
        }
    }

    public static String setUrlFPrice(String fp) {
        if (fp == null) {
            return "";
        } else {
            return "&price=" + fp;
        }
    }

    public static String setUrlBrand(String[] br) {
        StringBuilder res = new StringBuilder();
        if (br != null) {
            for (String s : br) {
                res.append("&ibrand=").append(s);
            }
        }
        return res.toString();
    }

    public static String setUrlSearch(String text) {
        if (text == null) {
            return "";
        } else {
            return "&search=" + text;
        }
    }

    public static String setUrlAll(String textSearch, String cat, String price, String sort, String[] brand) {
        return "productlist?" + setUrlSearch(textSearch) + setUrlCa(cat) + setUrlFPrice(price) + setUrlBrand(brand) + setUrtSort(sort);
    }
}
