package mode_utility;

import java.text.NumberFormat;
import java.util.Locale;

public class Format {
    public static String formatIntToMoney(int number) {
        Locale vn = new Locale("vi", "VN");
        NumberFormat numberFormat = NumberFormat.getCurrencyInstance(vn);
        return numberFormat.format(number);
    }

    public static String formatOriginalPrice(int price, int priceSale) {
        if (price > priceSale) {
            Locale vn = new Locale("vi", "VN");
            NumberFormat numberFormat = NumberFormat.getCurrencyInstance(vn);
            return numberFormat.format(price);
        }
        return "";
    }
}
