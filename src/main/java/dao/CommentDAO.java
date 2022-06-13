package dao;

import db.DBConnect;
import model.Comment;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO {
    private static CommentDAO instance;
    private static int PER_PAGE = 6;
    private CommentDAO() {
    }

    public static CommentDAO getInstance() {
        if (instance == null) {
            instance = new CommentDAO();
        }
        return instance;
    }

    public static  List<Comment> getCommentByBlogId(int blogId) {
        String sql1 = "SELECT * FROM `comments` JOIN tai_khoan on tai_khoan.ID_USER = comments.user_id WHERE `blog_id` = ?";
        Comment comment;
        List<Comment> comments = new ArrayList<Comment>();
        ResultSet rs;
        PreparedStatement statement;
        try {
            statement = DBConnect.connect().getConnection().prepareStatement(sql1);
            statement.setInt(1, blogId);
            rs = statement.executeQuery();
           
            while (rs.next()) {
            	comment = new Comment(rs.getString("description"),rs.getString("USER_NAME"),rs.getDate("create_date"));
            	comments.add(comment);
            }
            
            return comments;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }


   
    public static void main(String[] args) {
        
    }

}
