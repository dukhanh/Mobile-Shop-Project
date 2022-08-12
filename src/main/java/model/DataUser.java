package model;

public class DataUser {
    private int id_user;
    private String user_name;
    private String email;
    private String ten_nd;
    private String mat_khau;
    private String trang_thai;
    private String quyen_han;
    private String sdt;
    private String gioi_tinh;
    private String ngay_sinh;
    private String create_date;
    private String tinh;

    public DataUser() {
    }

    public DataUser(int id_user, String email, String ten_nd, String tinh, String trang_thai, String sdt) {

        this.id_user = id_user;
        this.email = email;
        this.ten_nd = ten_nd;
        this.tinh = tinh;
        this.trang_thai = trang_thai;
        this.sdt = sdt;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTen_nd() {
        return ten_nd;
    }

    public void setTen_nd(String ten_nd) {
        this.ten_nd = ten_nd;
    }

    public String getMat_khau() {
        return mat_khau;
    }

    public void setMat_khau(String mat_khau) {
        this.mat_khau = mat_khau;
    }

    public String getTrang_thai() {
        return trang_thai;
    }

    public void setTrang_thai(String trang_thai) {
        this.trang_thai = trang_thai;
    }

    public String getQuyen_han() {
        return quyen_han;
    }

    public void setQuyen_han(String quyen_han) {
        this.quyen_han = quyen_han;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getGioi_tinh() {
        return gioi_tinh;
    }

    public void setGioi_tinh(String gioi_tinh) {
        this.gioi_tinh = gioi_tinh;
    }

    public String getNgay_sinh() {
        return ngay_sinh;
    }

    public void setNgay_sinh(String ngay_sinh) {
        this.ngay_sinh = ngay_sinh;
    }

    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }

    public String getTinh() {
        return tinh;
    }

    public void setTinh(String tinh) {
        this.tinh = tinh;
    }
}
