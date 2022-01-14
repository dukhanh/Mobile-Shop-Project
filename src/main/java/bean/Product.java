package bean;

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

    public Product(){

    }

    public Product(int id, String name, int price, int priceSale, String imageUrl, String color, String description, int idBrand, String brand, int idCategory, int quantity, int quantitySale) {
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
