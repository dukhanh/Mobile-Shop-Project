package db;

import java.sql.*;

public class DBConnect {
    private static DBConnect dbConnect;
    private static Connection connection;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/databaseshop?useUnicode=true&characterEncoding=UTF-8";
    private static final String USER = "root";
    private static final String PASSWORD = "";

//    private static final String DB_URL = "jdbc:mysql://remotemysql.com:3306/8oY1dXmabC?useUnicode=true&characterEncoding=UTF-8";
//    private static final String USER = "8oY1dXmabC";
//    private static final String PASSWORD = "7wKG0VKWt3";


    public static Statement connect() throws SQLException, ClassNotFoundException {
        if (connection == null || connection.isClosed()) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(DB_URL, USER, PASSWORD);
        }
        return connection.createStatement();
    }



    public static void main(String[] args) throws SQLException, ClassNotFoundException {

    }
}
