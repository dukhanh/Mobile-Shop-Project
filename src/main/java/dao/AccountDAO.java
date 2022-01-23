package dao;

import bean.Account;
import db.DBConnect;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDAO {
    private static AccountDAO accountDAO;

    public AccountDAO() {

    }

    public static AccountDAO getInstance() {
        if (accountDAO == null) {
            accountDAO = new AccountDAO();
        }
        return accountDAO;
    }

    public Account Login(String email, String password) {
        String sql = "SELECT * FROM TAI_KHOAN WHERE EMAIL= ? AND MAT_KHAU = ?";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setString(1, email);
            psupdate.setString(2, password);
            ResultSet rs = psupdate.executeQuery();
            while (rs.next()) {
                Account account = new Account();
                account.setId(rs.getInt("ID_USER"));
                account.setEmail(rs.getString("EMAIL"));
                account.setFullName(rs.getString("TEN_ND"));
                account.setPassword(rs.getString("MAT_KHAU"));
                account.setRole(rs.getString("QUYEN_HAN"));
                account.setStatus(rs.getString("TRANG_THAI"));
                return account;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return null;
        }
        return null;
    }


}
