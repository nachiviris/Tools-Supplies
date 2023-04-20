/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

/**
 *
 * @author crist
 */
import java.sql.*;

public class Ctrl_Producto {
    private Connection conexion;

    public Ctrl_Producto() {
        // Realizamos la conexión a la base de datos
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String servidor = "jdbc:oracle:oci8:@localhost:1521:orcl:Proyecto";
            String usuario = "";
            String password = "";
            conexion = DriverManager.getConnection(servidor, usuario, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public void guardarProducto(int producto_id, int proveedor_id, int categoria_id, String nombre_producto, String descripcion_producto, String fecha_orden) {
        try {
            String consulta = "INSERT INTO Productos (producto_id, proveedor_id, categoria_id, nombre_producto, descripcion_producto, fecha_orden) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conexion.prepareStatement(consulta);
            statement.setInt(1, producto_id);
            statement.setInt(2, proveedor_id);
            statement.setInt(3, categoria_id);
            statement.setString(4, nombre_producto);
            statement.setString(5, descripcion_producto);
            statement.setString(6, fecha_orden);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al guardar producto: " + e);
        }
    }

    public boolean consultarProducto(int producto_id) {
        try {
            String consulta = "SELECT * FROM Productos WHERE producto_id = ?";
            PreparedStatement statement = conexion.prepareStatement(consulta);
            statement.setInt(1, producto_id);
            ResultSet resultado = statement.executeQuery();
            return resultado.next();
        } catch (SQLException e) {
            System.out.println("Error al consultar producto: " + e);
        }
        return false;
    }

    public void actualizarProducto(int producto_id, String nuevoNombre, String nuevaDescripcion, String nuevaFechaOrden) {
        try {
            String consulta = "UPDATE Productos SET nombre_producto = ?, descripcion_producto = ?, fecha_orden = ? WHERE producto_id = ?";
            PreparedStatement statement = conexion.prepareStatement(consulta);
            statement.setString(1, nuevoNombre);
            statement.setString(2, nuevaDescripcion);
            statement.setString(3, nuevaFechaOrden);
            statement.setInt(4, producto_id);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al actualizar producto: " + e);
        }
    }

    public void eliminarProducto(int producto_id) {
        try {
            String consulta = "DELETE FROM Productos WHERE producto_id = ?";
            PreparedStatement statement = conexion.prepareStatement(consulta);
            statement.setInt(1, producto_id);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar producto: " + e);
        }
    }

    public void actualizarStock(int producto_id, int cantidad) {
        try {
            String consulta = "UPDATE Productos SET stock = stock + ? WHERE producto_id = ?";
            PreparedStatement statement = conexion.prepareStatement(consulta);
            statement.setInt(1, cantidad);
            statement.setInt(2, producto_id);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al actualizar stock del producto: " + e);
        }
    }

    public void cerrarConexion() {
        try {
            conexion.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}