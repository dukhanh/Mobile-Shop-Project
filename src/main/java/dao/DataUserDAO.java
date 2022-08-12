package dao;

import db.DBConnect;
import model.DataUser;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DataUserDAO {
    private static DataUserDAO instance;

    public DataUserDAO() {
    }

    public static DataUserDAO getInstance() {
        if (instance == null) {
            instance = new DataUserDAO();
        }
        return instance;
    }

    public List<DataUser> showAllDataUSer(){
        String sql = "SELECT TAI_KHOAN.ID_USER, TAI_KHOAN.TEN_ND, TAI_KHOAN.SDT,dia_chi.TINH  , TAI_KHOAN.TRANG_THAI, TAI_KHOAN.EMAIL\n" +
                "\tFROM TAI_KHOAN JOIN dia_chi ON dia_chi.ID_USER = tai_khoan.ID_USER";
        DataUser du;
        List<DataUser> datauser = new ArrayList<DataUser>();
        ResultSet rs;
        PreparedStatement statement;
        try {
            statement = DBConnect.connect().getConnection().prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                du = new DataUser(rs.getInt("id_user"),rs.getString("ten_nd"),rs.getString("sdt"),rs.getString("tinh"),rs.getString("trang_thai"),rs.getString("email"));
                datauser.add(du);
            }

            return datauser;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static void main(String[] args) {

    }
}
