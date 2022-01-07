package dao;

import bean.User;
import db.DBConnect;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Objects;

public class UserDAO {
    private static UserDAO userDAO;

    public UserDAO() {

    }

    public static UserDAO getInstance() {
        if (userDAO == null) {
            userDAO = new UserDAO();
        }
        return userDAO;
    }

    public User checkLogin(String username, String password) {
        try {
            ResultSet resultSet = DBConnect.connect().executeQuery("SELECT * FROM TAI_KHOAN WHERE USER_NAME=" + username + "AND MAT_KHAU =" + password);
            User user = null;
            if (resultSet.next()) {
                user = new User();
                user.setUsername(resultSet.getString("USER_NAME"));
                user.setFullName(resultSet.getString("TEN_ND"));

            }
            if (Objects.requireNonNull(user).getUsername().equals(username) && !resultSet.next()) {
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return null;
        }
        return null;
    }


}
