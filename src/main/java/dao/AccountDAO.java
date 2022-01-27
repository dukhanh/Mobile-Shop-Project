package dao;

import bean.Account;
import db.DBConnect;
import mode_utility.Encrypt;

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
                account.setPassword(Encrypt.MD5(rs.getString("MAT_KHAU")));
                account.setPhoneNumber(rs.getString("SDT"));
                account.setAddress(rs.getString("DIA_CHI"));
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

    public Account checkAccountExists(String email){
        String sql = "SELECT * FROM TAI_KHOAN WHERE EMAIL= ?";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setString(1, email);
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

    public void addAccount(Account account){
        String sql = "INSERT INTO tai_khoan (EMAIL, TEN_ND, MAT_KHAU,TRANG_THAI,QUYEN_HAN,CREATE_DATE) VALUES (?,?, ?,?,?,now())";
        try {
            PreparedStatement prepareStatement = DBConnect.connect().getConnection().prepareStatement(sql);
            prepareStatement.setString(1,account.getEmail());
            prepareStatement.setString(2,account.getFullName());
            prepareStatement.setString(3, account.getPassword());
            prepareStatement.setString(4,account.getStatus());
            prepareStatement.setString(5,account.getRole());
            prepareStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
    public void updateAccount(String email, String name, String phone, String address){
        String sql = "UPDATE tai_khoan SET TEN_ND = ?, SDT = ?, DIA_CHI= ? WHERE EMAIL = ?";
        try {
            PreparedStatement prepareStatement = DBConnect.connect().getConnection().prepareStatement(sql);
            prepareStatement.setString(1,name);
            prepareStatement.setString(2,phone);
            prepareStatement.setString(3, address);
            prepareStatement.setString(4, email);
            prepareStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void resetPassword(String email, String newPassword){
        String sql = "UPDATE tai_khoan SET MAT_KHAU = ? WHERE EMAIL = ?";
        try {
            PreparedStatement prepareStatement = DBConnect.connect().getConnection().prepareStatement(sql);
            prepareStatement.setString(1,newPassword);
            prepareStatement.setString(2,email);
            prepareStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    
    public String getCurrentPassword(String email){
        String result = null;
        String sql = "Select MAT_KHAU from tai_khoan where EMAIL = ?";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setString(1, email);
            ResultSet rs = psupdate.executeQuery();
            while (rs.next()) {
                result =  rs.getString("MAT_KHAU");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return null;
        }
        return result;
    }

    public static void main(String[] args) {

        System.out.println(AccountDAO.getInstance().getCurrentPassword("dukhanhqt@gmail.com"));
    }


}
