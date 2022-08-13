package model;

import java.io.Serializable;

public class Product implements Serializable {
    private static final long serialVersionUID = 1L;
    private int id;
    private String name;
    private int price;
    private int priceSale;
    private String imageUrl;
    private String color;
    private String description;
    private int idBrand;
    private String brand;
    private int idCategory;
    private int quantity;
    private int quantitySale;
    private String ANH_CHINH;
    private int ID_SANPHAM;
    private String TEN_SP;
    private String TENTH;
    private String NGAY_CAPNHAT;
    private int SO_LUONG;
    private int SL_DABAN;
    private int GIA_SP;
    public Product(){

    }

    public Product(String ANH_CHINH, int ID_SANPHAM, String TEN_SP, String TENTH, String NGAY_CAPNHAT, int SO_LUONG, int SL_DABAN, int GIA_SP) {
        this.ANH_CHINH = ANH_CHINH;
        this.ID_SANPHAM = ID_SANPHAM;
        this.TEN_SP = TEN_SP;
        this.TENTH = TENTH;
        this.NGAY_CAPNHAT = NGAY_CAPNHAT;
        this.SO_LUONG = SO_LUONG;
        this.SL_DABAN = SL_DABAN;
        this.GIA_SP = GIA_SP;
    }

    public Product(int id, String name, int price, int priceSale, String imageUrl, String color, String description, int idBrand, String brand, int idCategory , int quantity, int quantitySale) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.priceSale = priceSale;
        this.imageUrl = imageUrl;
        this.color = color;
        this.description = description;
        this.idBrand = idBrand;
        this.brand = brand;
        this.idCategory = idCategory;
        this.quantity = quantity;
        this.quantitySale = quantitySale;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getPriceSale() {
        return priceSale;
    }

    public void setPriceSale(int priceSale) {
        this.priceSale = priceSale;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getIdBrand() {
        return idBrand;
    }

    public void setIdBrand(int idBrand) {
        this.idBrand = idBrand;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getQuantitySale() {
        return quantitySale;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public void setQuantitySale(int quantitySale) {
        this.quantitySale = quantitySale;
    }

    public String getANH_CHINH() {
        return ANH_CHINH;
    }

    public void setANH_CHINH(String ANH_CHINH) {
        this.ANH_CHINH = ANH_CHINH;
    }

    public int getID_SANPHAM() {
        return ID_SANPHAM;
    }

    public void setID_SANPHAM(int ID_SANPHAM) {
        this.ID_SANPHAM = ID_SANPHAM;
    }

    public String getTEN_SP() {
        return TEN_SP;
    }

    public void setTEN_SP(String TEN_SP) {
        this.TEN_SP = TEN_SP;
    }

    public String getTENTH() {
        return TENTH;
    }

    public void setTENTH(String TENTH) {
        this.TENTH = TENTH;
    }

    public String getNGAY_CAPNHAT() {
        return NGAY_CAPNHAT;
    }

    public void setNGAY_CAPNHAT(String NGAY_CAPNHAT) {
        this.NGAY_CAPNHAT = NGAY_CAPNHAT;
    }

    public int getSO_LUONG() {
        return SO_LUONG;
    }

    public void setSO_LUONG(int SO_LUONG) {
        this.SO_LUONG = SO_LUONG;
    }

    public int getSL_DABAN() {
        return SL_DABAN;
    }

    public void setSL_DABAN(int SL_DABAN) {
        this.SL_DABAN = SL_DABAN;
    }

    public int getGIA_SP() {
        return GIA_SP;
    }

    public void setGIA_SP(int GIA_SP) {
        this.GIA_SP = GIA_SP;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", priceSale=" + priceSale +
                ", imageUrl='" + imageUrl + '\'' +
                ", color='" + color + '\'' +
                ", description='" + description + '\'' +
                ", idBrand=" + idBrand +
                ", brand='" + brand + '\'' +
                ", idCategory=" + idCategory +
                ", quantity=" + quantity +
                ", quantitySale=" + quantitySale +
                '}';
    }

}
