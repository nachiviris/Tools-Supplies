/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

/**
 *
 * @author crist
 */
import conexion.Conexion;
import java.sql.*;
import java.sql.Connection;


public class Ctrl_Producto {


    public boolean guardarProducto(int producto_id, String nombre_producto, String descripcion_producto, int categoria_id, int proveedor_id) {
        try {
            Connection con = Conexion.getConexion();
            PreparedStatement ps = con.prepareStatement("INSERT INTO Productos (producto_id, nombre_producto, descripcion_producto, categoria_id, proveedor_id) VALUES (?, ?, ?, ?, ?)");
            ps.setInt(1, producto_id);
            ps.setString(2, nombre_producto);
            ps.setString(3, descripcion_producto);
            ps.setInt(4, categoria_id);
            ps.setInt(5, proveedor_id);
            int result = ps.executeUpdate();
            if (result > 0) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("Error al guardar el producto: " + e.getMessage());
        }
        return false;
    }

    public boolean productoExiste(int producto_id) {
        try {
            Connection con = Conexion.getConexion();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Productos WHERE producto_id = ?");
            ps.setInt(1, producto_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("Error al buscar el producto: " + e.getMessage());
        }
        return false;
    }

    public boolean actualizarProducto(int producto_id, int proveedor_id, int categoria_id, String nombre_producto, String descripcion_producto, String fecha_orden) {
        try {
            Connection con = Conexion.getConexion();
            PreparedStatement ps = con.prepareStatement("UPDATE Productos SET proveedor_id = ?, categoria_id = ?, nombre_producto = ?, descripcion_producto = ?, fecha_orden = ? WHERE producto_id = ?");
            ps.setInt(1, proveedor_id);
            ps.setInt(2, categoria_id);
            ps.setString(3, nombre_producto);
            ps.setString(4, descripcion_producto);
            ps.setString(5, fecha_orden);
            ps.setInt(6, producto_id);
            int result = ps.executeUpdate();
            if (result > 0) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("Error al actualizar el producto: " + e.getMessage());
        }
        return false;
    }

    public boolean eliminarProducto(int producto_id) {
        try {
            Connection con = Conexion.getConexion();
            PreparedStatement ps = con.prepareStatement("DELETE FROM Productos WHERE producto_id = ?");
            ps.setInt(1, producto_id);
            int result = ps.executeUpdate();
            if (result > 0) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("Error al eliminar el producto: " + e.getMessage());
        }
        return false;
    }

    public boolean actualizarStock(int producto_id, int cantidad) {
        try {
            Connection con = Conexion.getConexion();
            PreparedStatement ps = con.prepareStatement("UPDATE Productos SET stock = stock + ? WHERE producto_id = ?");
            ps.setInt(1, cantidad);
            ps.setInt(2, producto_id);
            int result = ps.executeUpdate();
            if (result > 0) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("Error al actualizar el stock del producto: " + e.getMessage());
        }
        return false;
    }

    public boolean existeProducto(String trim) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}