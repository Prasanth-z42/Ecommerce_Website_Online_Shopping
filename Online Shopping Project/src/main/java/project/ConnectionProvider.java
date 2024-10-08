package project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
    public static Connection getCon() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL driver
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ospjsp", "root", "duke"); // Replace with your DB details
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return con;
    }
}
