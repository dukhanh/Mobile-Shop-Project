package service;

public class BillService {
    public static String newBillID(String previousBillID) {
        if (previousBillID == null) {
            return "DH001";
        } else {
            int n = Integer.parseInt(previousBillID.substring(2));
            return "DH" + String.format("%03d", n + 1);
        }

    }

    public static String statusBill(int code) {
        switch (code) {
            case 0:
                return "Chờ xác nhận";
            case 1:
                return "Đã xác nhận";
            case 2:
                return "Đang giao hàng";
            case 3:
                return "Đã giao hàng";
            case 4:
                return "Đã hủy";
        }
        return "";
    }

    public static int statusBillCode(String status) {
        switch (status) {
            case "Chờ xác nhận":
                return 0;
            case "Đã xác nhận":
                return 1;
            case "Đang giao hàng":
                return 2;
            case "Đã giao hàng":
                return 3;
            case "Đã hủy":
                return 4;
        }
        return -1;
    }


}
