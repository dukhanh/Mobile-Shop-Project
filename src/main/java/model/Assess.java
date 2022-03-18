package model;

import java.io.Serializable;

public class Assess implements Serializable {
    private int idProduct;
    private int idUser;
    private String nameAssess;
    private int rate;
    private String review;
    private String createdAt;

    public Assess() {
    }

    public Assess(int idProduct, int idUser, String nameAssess, int rate, String review, String createdAt) {
        this.idProduct = idProduct;
        this.idUser = idUser;
        this.nameAssess = nameAssess;
        this.rate = rate;
        this.review = review;
        this.createdAt = createdAt;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }


    public String getNameAssess() {
        return nameAssess;
    }

    public void setNameAssess(String nameAssess) {
        this.nameAssess = nameAssess;
    }

    // toString
    @Override
    public String toString() {
        return "Assess{" + "idProduct=" + idProduct + ", idUser=" + idUser + ", nameAssess=" + nameAssess + ", rate=" + rate + ", review=" + review + ", createdAt=" + createdAt + '}';
    }
}
