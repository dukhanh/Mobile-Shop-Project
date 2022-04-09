package model;

import java.io.Serializable;

public class Address implements Serializable {
    private int userId;
    private String fullName;
    private String phone;
    private String province;
    private String district;
    private String ward;
    private String detail;
    private String typeAddress;

    // constructor null
    public Address() {
    }

    // constructor all
    public Address(int userId, String fullName, String phone, String province, String district, String ward, String detail, String typeAddress) {
        this.userId = userId;
        this.fullName = fullName;
        this.phone = phone;
        this.province = province;
        this.district = district;
        this.ward = ward;
        this.detail = detail;
        this.typeAddress = typeAddress;
    }

    // getter and setter


    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getTypeAddress() {
        return typeAddress;
    }

    public void setTypeAddress(String typeAddress) {
        this.typeAddress = typeAddress;
    }

    // toString
    @Override
    public String toString() {
        return fullName + " - " + phone + " -- " + printTypeAddress(typeAddress) + " - " + detail + ", " + ward + ", " + district + ", " + province;
    }
    public static String printTypeAddress(String tAddress) {
        if(tAddress.equals("home")) {
            return "Nhà riêng";
        }else{
            return "Công ty";
        }
    }

//    public static void main(String[] args) {
//        Address address = new Address();
//        address.setFullName("Nguyen Van A");
//        address.setPhone("0987654321");
//        address.setProvince("Hồ Chí Minh");
//        address.setDistrict("Quan 1");
//        address.setWard("Phường 1");
//        address.setDetail("83/3 Nguyễn Văn Cừ");
//        address.setTypeAddress("home");
//        System.out.println(address.toString());
//    }
}
