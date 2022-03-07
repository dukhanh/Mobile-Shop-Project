package model;

import java.io.Serializable;

public class BillDetail implements Serializable {
    private String idBill;
    private int idProduct;
    private String productName;
    private String imageProduct;
    private String colorProduct;
    private int quantity;
    private int priceBill;

    public BillDetail() {
    }

    public BillDetail(String idBill, int idProduct, String productName, String imageProduct, String colorProduct, int quantity, int priceBill) {
        this.idBill = idBill;
        this.idProduct = idProduct;
        this.productName = productName;
        this.imageProduct = imageProduct;
        this.colorProduct = colorProduct;
        this.quantity = quantity;
        this.priceBill = priceBill;
    }
// getter and setter

    public String getIdBill() {
        return idBill;
    }

    public void setIdBill(String idBill) {
        this.idBill = idBill;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImageProduct() {
        return imageProduct;
    }

    public void setImageProduct(String imageProduct) {
        this.imageProduct = imageProduct;
    }

    public String getColorProduct() {
        return colorProduct;
    }

    public void setColorProduct(String colorProduct) {
        this.colorProduct = colorProduct;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPriceBill() {
        return priceBill;
    }

    public void setPriceBill(int priceBill) {
        this.priceBill = priceBill;
    }

    // toString
    @Override
    public String toString() {
        return "BillDetail{" + "idBill=" + idBill + ", idProduct=" + idProduct + ", productName=" + productName + ", imageProduct=" + imageProduct + ", colorProduct=" + colorProduct + ", quantity=" + quantity + ", priceBill=" + priceBill + '}';
    }
}