
package conexion;

import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;



public class Conexion {

    private static Conexion conexion;
    
    private static final String DBURL="jdbc:oracle:thin:@//localhost:1521/orcl";
    
    private static Connection conn=null;
    
    private Conexion(){
        
        try{
            
            Class.forName("oracle.jdbc.OracleDriver").getDeclaredConstructor().newInstance();
            conn= DriverManager.getConnection(DBURL,"system_ts","systemts");
            
        }catch (ClassNotFoundException | SQLException | NoSuchMethodException | SecurityException |
                InstantiationException | IllegalAccessException | IllegalArgumentException |
                InvocationTargetException ex){
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE,null,ex);
        }
        
    }
    
    
    public static synchronized Connection getConexion(){
        
        if (conexion==null){
            conexion=new Conexion();
        }
        return conn;
    }
}
