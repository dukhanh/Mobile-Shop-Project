package model;

import java.io.Serializable;
import java.sql.Date;

public class Bill implements Serializable {
    private String idBill;
    private int idUser;
    private int shipFee;
    public String status;
    private String address;
    private String createdAt;
    private long total;

    public Bill() {
    }

    //cons for admin, need to update
    public Bill(String idBill, int idUser, String createdAt) {
        this.idBill = idBill;
        this.idUser = idUser;
        this.createdAt = createdAt;
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

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
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
        return "Bill{" +
                "idBill='" + idBill + '\'' +
                ", idUser=" + idUser +
                ", shipFee=" + shipFee +
                ", status='" + status + '\'' +
                ", address='" + address + '\'' +
                ", createdAt='" + createdAt + '\'' +
                ", total=" + total +
                '}';
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public static class Comment {


        private String description;
        private String userName;
        private Date createDate;

        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            this.description = description;
        }

        public String getUserName() {
            return userName;
        }

        public void setUserName(String userName) {
            this.userName = userName;
        }

        public Date getCreateDate() {
            return createDate;
        }

        public void setCreateDate(Date createDate) {
            this.createDate = createDate;
        }

        public Comment(String description, String userName, Date createDate) {
            super();
            this.description = description;
            this.userName = userName;
            this.createDate = createDate;
        }

    }
}
