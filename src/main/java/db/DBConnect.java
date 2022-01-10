package db;

import java.sql.*;

public class DBConnect {
    private static DBConnect dbConnect;
    private static Connection connection;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/databaseshop?useUnicode=true&characterEncoding=utf-8";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public static Statement connect() throws SQLException, ClassNotFoundException {
        if (connection == null || connection.isClosed()) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            return connection.createStatement();

        } else {
            return connection.createStatement();
        }
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        int sl = 10;
        ResultSet rs = connect().executeQuery("SELECT * FROM SAN_PHAM LIMIT "+ sl);
        while(rs.next()) {
            System.out.println(rs.getString(2));
        }
    }
}