package db;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author mauen
 */
public class cn {

    Connection con;

    public cn() throws ClassNotFoundException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establece la conexión con la base de datos clinica
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinica", "root", "");
        } catch (Exception e) {
            System.err.println("Error: " + e);
        }
    }

    public Connection getConnection() {
        return con;
    }
}
