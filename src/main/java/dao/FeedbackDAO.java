package dao;

import db.DBConnect;
import model.Feedback;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDAO {
    private static FeedbackDAO instance;

    public FeedbackDAO() {
    }

    public static FeedbackDAO getInstance() {
        if (instance == null) {
            instance = new FeedbackDAO();
        }
        return instance;
    }

    public List<Feedback> showAllFeedbacks(){

        String sql = "SELECT tk.TEN_ND, tk.EMAIL, tk.SDT, dgsp.NGAY_DG, dgsp.NOIDUNG_DG FROM danh_gia_sp dgsp JOIN tai_khoan tk ON dgsp.ID_USER = tk.ID_USER";
        Feedback fb;
        List<Feedback> feedback = new ArrayList<Feedback>();
        ResultSet rs;
        PreparedStatement statement;
        try {
            statement = DBConnect.connect().getConnection().prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                fb = new Feedback(rs.getString("TEN_ND"),rs.getString("EMAIL"),rs.getString("SDT"),rs.getString("NGAY_DG"),rs.getString("NOIDUNG_DG"));
                feedback.add(fb);
            }

            return feedback;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {

    }
}
