package javaclass;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {

    private static final String URL = "gateway01.ap-southeast-1.prod.alicloud.tidbcloud.com";
    private static final String USER = "Fd3c3RUAfdrJJQk.root";
    private static final String PASSWORD = "nwyLNH7KFkZfkTs4";

    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
