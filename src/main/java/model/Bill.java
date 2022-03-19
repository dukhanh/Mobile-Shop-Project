package model;

import java.io.Serializable;

public class Bill implements Serializable {
    private String idBill;
    private int idUser;
    private int shipFee;
    public String status;
    private String address;
    private String createdAt;

    public Bill() {
    }

    public Bill(String idBill, int idUser, int shipFee, String status, String address, String createdAt) {
        this.idBill = idBill;
        this.idUser = idUser;
        this.shipFee = shipFee;
        this.status = status;
        this.address = address;
        this.createdAt = createdAt;
    }
    // getter and setter all

    public String getIdBill() {
        return idBill;
    }

    public void setIdBill(String idBill) {
        this.idBill = idBill;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public int getShipFee() {
        return shipFee;
    }

    public void setShipFee(int shipFee) {
        this.shipFee = shipFee;
    }

    // toString
    @Override
    public String toString() {
        return "Bill{" + "idBill=" + idBill + ", idUser=" + idUser + ", shipFee=" + shipFee + ", status=" + status + ", createdAt=" + createdAt + '}';
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
