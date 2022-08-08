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

        String sql = "SELECT NAME, EMAIL, PHONE, TITLE, DESCRIPTION FROM REPORTS ";
        Feedback fb;
        List<Feedback> feedback = new ArrayList<Feedback>();
        ResultSet rs;
        PreparedStatement statement;
        try {
            statement = DBConnect.connect().getConnection().prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                fb = new Feedback(rs.getString("NAME"),rs.getString("EMAIL"),rs.getString("PHONE"),rs.getString("TITLE"),rs.getString("DESCRIPTION"));
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
