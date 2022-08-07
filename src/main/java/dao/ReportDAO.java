package dao;

import db.DBConnect;
import model.Report;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
    public List<Report> showAllReports(){

        String sql = "SELECT NAME, EMAIL, PHONE, TITLE, DESCRIPTION FROM REPORTS ";
        Report rp;
        List<Report> report = new ArrayList<Report>();
        ResultSet rs;
        PreparedStatement statement;
        try {
            statement = DBConnect.connect().getConnection().prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                rp = new Report(rs.getString("NAME"),rs.getString("EMAIL"),rs.getString("PHONE"),rs.getString("TITLE"),rs.getString("DESCRIPTION"));
                report.add(rp);
            }

            return report;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {

    }

}
