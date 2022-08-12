package dao;

import db.DBConnect;
import model.Account;
import model.Cart;
import model.DataUser;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
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

    public List<DataUser> showAllDataUSer() {
        String sql = "SELECT TAI_KHOAN.ID_USER, TAI_KHOAN.TEN_ND, TAI_KHOAN.SDT,dia_chi.TINH  , TAI_KHOAN.TRANG_THAI, TAI_KHOAN.EMAIL\n" +
                "\tFROM TAI_KHOAN JOIN dia_chi ON dia_chi.ID_USER = tai_khoan.ID_USER";
        List<DataUser> datauser = new ArrayList<DataUser>();
        ResultSet rs;
        PreparedStatement statement;
        try {
            statement = DBConnect.connect().getConnection().prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                DataUser du = new DataUser(rs.getInt("id_user"), rs.getString("email"), rs.getString("ten_nd"), rs.getString("tinh"), rs.getString("trang_thai"), rs.getString("sdt"));
                datauser.add(du);
            }

            return datauser;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Account> listUsers(){
        String sql = "SELECT * FROM TAI_KHOAN";
        List<Account> res = new LinkedList<>();
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            ResultSet rs = psupdate.executeQuery();

            while (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt("ID_USER"));
                a.setFullName(rs.getString("TEN_ND"));
                a.setEmail(rs.getString("EMAIL"));
                a.setPhoneNumber(rs.getString("SDT"));
                a.setRole(rs.getString("QUYEN_HAN"));
                a.setStatus(rs.getString("TRANG_THAI"));
                res.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return null;
        }
        return res;
    }

    public static void main(String[] args) {
        DataUserDAO dao = new DataUserDAO();
        List<Account> t = dao.listUsers();
        for(Account d: t){
            System.out.println(d);
        }
    }
}
