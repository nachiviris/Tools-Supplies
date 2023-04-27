package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    //conexion local
    public static Connection conectar() {
        try {
            Connection cn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/orcl", "SYSTEM_TS", "systemts");
            return cn;
        } catch (SQLException e) {
            System.out.println("Error en la conexion local " + e);
        }
        return null;
    }
}
