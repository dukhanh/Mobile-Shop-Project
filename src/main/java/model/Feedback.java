package model;

public class Feedback {
    private String ten_nd;
    private String email;
    private String sdt;
    private String ngay_dg;
    private String noidung_dg;


    public Feedback() {
    }

    public Feedback(String ten_nd, String email, String sdt, String ngay_dg, String noidung_dg) {
        this.ten_nd = ten_nd;
        this.email = email;
        this.sdt = sdt;
        this.ngay_dg = ngay_dg;
        this.noidung_dg = noidung_dg;
    }

    public String getTen_nd() {
        return ten_nd;
    }

    public void setTen_nd(String ten_nd) {
        this.ten_nd = ten_nd;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getNgay_dg() {
        return ngay_dg;
    }

    public void setNgay_dg(String ngay_dg) {
        this.ngay_dg = ngay_dg;
    }

    public String getNoidung_dg() {
        return noidung_dg;
    }

    public void setNoidung_dg(String noidung_dg) {
        this.noidung_dg = noidung_dg;
    }
}
