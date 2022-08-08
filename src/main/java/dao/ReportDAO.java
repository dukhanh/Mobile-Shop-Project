package dao;

import db.DBConnect;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ReportDAO {
    private static ReportDAO instance;

    public ReportDAO() {
    }

    public static ReportDAO getInstance() {
        if (instance == null) {
            instance = new ReportDAO();
        }
        return instance;
    }

    public static  void insertReport(String name, String phone, String email,String title,String description) {
        String sql = "INSERT INTO `reports`(`name`, `phone`, `email`, `title`, `description`) VALUES (?,?,?,?,?)";
        try {
            PreparedStatement statement = DBConnect.connect().getConnection().prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, phone);
            statement.setString(3, email);
            statement.setString(4, title);
            statement.setString(5, description);
            
            statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {

    }

}
