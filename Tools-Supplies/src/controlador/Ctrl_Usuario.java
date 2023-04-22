/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

import conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import modelo.Cliente;
import modelo.Usuario;

/**
 *
 * @author Nacho
 */
public class Ctrl_Usuario {
    
     /**
     * **************************************************
     * metodo para Iniciar Sesion
     * **************************************************
     */
     
   public boolean loginUser(Usuario objeto) {
        boolean respuesta = false;
        Connection cn = Conexion.getConexion();
        String sql = "select  usuario, password from Usuario where usuario = '" + objeto.getUsuario() + "' and password = '" + objeto.getPassword() + "'";
        Statement st;
        try {
            st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                respuesta = true;
            }
        } catch (SQLException e) {
            System.out.println("Error al Iniciar Sesion");
            JOptionPane.showMessageDialog(null, "Error al Iniciar Sesion");
        }
        return respuesta;
    }
   
    public boolean existeUsuario(String usuario) {
        boolean respuesta = false;
        String sql = "select usuario from usuario where usuario = '" + usuario + "';";
        Statement st;
        try {
            Connection cn = Conexion.getConexion();
            st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                respuesta = true;
            }
        } catch (SQLException e) {
            System.out.println("Error al consultar usuario: " + e);
        }
        return respuesta;
    }
    
    public boolean guardar(Usuario objeto) {
        boolean respuesta = false;
        Connection cn = Conexion.getConexion();
        try {
            PreparedStatement consulta = cn.prepareStatement("insert into usuario values(?,?,?,?,?,?)");
            consulta.setInt(1, 0);//id
            consulta.setString(2, objeto.getNombre_usuario());
            consulta.setString(3, objeto.getApellido_usuario());
            consulta.setString(4, objeto.getUsuario());
            consulta.setString(5, objeto.getPassword());
            consulta.setInt(6, objeto.getEstado());
            if (consulta.executeUpdate() > 0) {
                respuesta = true;
            }
            cn.close();
        } catch (SQLException e) {
            System.out.println("Error al guardar usuario: " + e);
        }
        return respuesta;
    }
    
    
    /**
     * **************************************************
     * metodo para eliminar un usuario
     * **************************************************
     */
    public boolean eliminar(int usuario_id) {
        boolean respuesta = false;
        Connection cn = Conexion.getConexion();
        try {
            PreparedStatement consulta = cn.prepareStatement(
                    "delete from usuario where usuario_id ='" + usuario_id + "'");
            consulta.executeUpdate();

            if (consulta.executeUpdate() > 0) {
                respuesta = true;
            }
            cn.close();
        } catch (SQLException e) {
            System.out.println("Error al eliminar usuario: " + e);
        }
        return respuesta;
    }
    
    
     /**
     * **************************************************
     * metodo para actualizar un usuario
     * **************************************************
     */
    public boolean actualizar(Usuario objeto, int idUsuario) {
        boolean respuesta = false;
        Connection cn = Conexion.getConexion();
        try {

            PreparedStatement consulta = cn.prepareStatement("update usuario set nombre=?, apellido = ?, usuario = ?, password= ?, estado = ? where usuario_id ='" + idUsuario + "'");
            consulta.setString(1, objeto.getNombre_usuario());
            consulta.setString(2, objeto.getApellido_usuario());
            consulta.setString(3, objeto.getUsuario());
            consulta.setString(4, objeto.getPassword());
            consulta.setInt(6, objeto.getEstado());

            if (consulta.executeUpdate() > 0) {
                respuesta = true;
            }
            cn.close();
        } catch (SQLException e) {
            System.out.println("Error al actualizar usuario: " + e);
        }
        return respuesta;
    }
    
}
