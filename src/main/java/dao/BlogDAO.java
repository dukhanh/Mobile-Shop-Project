package dao;

import db.DBConnect;
import dto.ResponseBlogsDTO;
import model.Blog;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BlogDAO {
    private static BlogDAO instance;
    private static int PER_PAGE = 6;
    private BlogDAO() {
    }

    public static BlogDAO getInstance() {
        if (instance == null) {
            instance = new BlogDAO();
        }
        return instance;
    }

    public static  ResponseBlogsDTO getBlogsPerPage(int page) {
        String sql1 = "SELECT * FROM `blogs` join hinh_anh on blogs.avatar = hinh_anh.ID_SANPHAM limit ?,?";
        String sql2 = "SELECT COUNT(blogs.id) as COUNT FROM `blogs` join hinh_anh on blogs.avatar = hinh_anh.ID_SANPHAM;";
        List<Blog> data = new ArrayList<Blog>();
        int start = (page-1)*PER_PAGE;
        Blog blog;
        ResultSet rs;
        PreparedStatement statement;
        int countPage = 0;
        ResponseBlogsDTO response;
        try {
            statement = DBConnect.connect().getConnection().prepareStatement(sql1);
            statement.setInt(1, start);
            statement.setInt(2, PER_PAGE);
            rs = statement.executeQuery();
           
            while (rs.next()) {
                 blog = new Blog(rs.getInt("id"), rs.getString("title"), rs.getString("description"), rs.getDate("create_date"), rs.getString("URL_ANH"),rs.getString("create_by"));
                data.add(blog);
            }
            statement = DBConnect.connect().getConnection().prepareStatement(sql2);
            rs = statement.executeQuery();
            while (rs.next()) {
            	countPage = rs.getInt("COUNT")%PER_PAGE == 0 ? rs.getInt("count")/PER_PAGE:rs.getInt("count")/PER_PAGE+1 ;
			}
            
            response = new ResponseBlogsDTO(countPage, data);
            return response;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }


    public static  Blog getBlogById(int id) {
        String sql1 = "SELECT * FROM `blogs` join hinh_anh on blogs.avatar = hinh_anh.ID_SANPHAM WHERE id = ?";
        Blog blog = null;
        ResultSet rs;
        PreparedStatement statement;
        try {
            statement = DBConnect.connect().getConnection().prepareStatement(sql1);
            statement.setInt(1, id);
            rs = statement.executeQuery();
           
            while (rs.next()) {
                 blog = new Blog(rs.getInt("id"), rs.getString("title"), rs.getString("description"), rs.getDate("create_date"), rs.getString("URL_ANH"),rs.getString("create_by"));                
            }
           
            return blog;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    
    public static void main(String[] args) {
        
    }
    
    public static  List<Blog> getBlogsRandom() {
        String sql = "SELECT * FROM blogs AS b JOIN( SELECT CEIL( RAND() *( SELECT MAX(id) FROM blogs )) AS id ) AS r JOIN hinh_anh h ON h.ID_SANPHAM = b.avatar WHERE b.id >= r.id ORDER BY r.id ASC LIMIT 3";
        List<Blog> data = new ArrayList<Blog>();
        Blog blog;
        ResultSet rs;
        PreparedStatement statement;
        try {
            statement = DBConnect.connect().getConnection().prepareStatement(sql);
            rs = statement.executeQuery();
           
            while (rs.next()) {
                 blog = new Blog(rs.getInt("id"), rs.getString("title"), rs.getString("description"), rs.getDate("create_date"), rs.getString("URL_ANH"),rs.getString("create_by"));
                data.add(blog);
            }
            return data;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
}
