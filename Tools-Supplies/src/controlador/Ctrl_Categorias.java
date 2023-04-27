/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import conexion.Conexion;

public class Ctrl_Categorias {
    
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;
    
    public Ctrl_Categorias() {
        con = Conexion.getConexion();
    }
    
    public boolean insertarCategoria(int id, String nombre, String descripcion) {
        boolean insertado = false;
        
        try {
            cs = con.prepareCall("{call insertar_categoria(?,?,?)}");
            cs.setInt(1, id);
            cs.setString(2, nombre);
            cs.setString(3, descripcion);
            
            int filasAfectadas = cs.executeUpdate();
            
            if (filasAfectadas > 0) {
                insertado = true;
            }
        } catch (SQLException e) {
            System.out.println("Error al insertar la categoría: " + e.getMessage());
        } finally {
            try {
                if (cs != null) {
                    cs.close();
                }
            } catch (SQLException e) {
                System.out.println("Error al cerrar el CallableStatement: " + e.getMessage());
            }
        }
        
        return insertado;
    }
    
    public boolean actualizarCategoria(int id, String nombre, String descripcion) {
        boolean actualizado = false;
        
        try {
            cs = con.prepareCall("{call actualizar_categoria(?,?,?)}");
            cs.setInt(1, id);
            cs.setString(2, nombre);
            cs.setString(3, descripcion);
            
            int filasAfectadas = cs.executeUpdate();
            
            if (filasAfectadas > 0) {
                actualizado = true;
            }
        } catch (SQLException e) {
            System.out.println("Error al actualizar la categoría: " + e.getMessage());
        } finally {
            try {
                if (cs != null) {
                    cs.close();
                }
            } catch (SQLException e) {
                System.out.println("Error al cerrar el CallableStatement: " + e.getMessage());
            }
        }
        
        return actualizado;
    }
    
    public boolean eliminarCategoria(int id) {
        boolean eliminado = false;
        
        try {
            cs = con.prepareCall("{call eliminar_categoria(?,?)}");
            cs.setInt(1, id);
            cs.registerOutParameter(2, Types.INTEGER);
            
            cs.executeUpdate();
            int filasAfectadas = cs.getInt(2);
            
            if (filasAfectadas > 0) {
                eliminado = true;
            }
        } catch (SQLException e) {
            System.out.println("Error al eliminar la categoría: " + e.getMessage());
        } finally {
            try {
                if (cs != null) {
                    cs.close();
                }
            } catch (SQLException e) {
                System.out.println("Error al cerrar el CallableStatement: " + e.getMessage());
            }
        }
        
        return eliminado;
    }
    
    public String[] obtenerCategoria(int id) {
        String[] categoria = null;
        
        try {
            cs = con.prepareCall("{call obtener_categoria(?,?)}");
            cs.setInt(1, id);
            cs.registerOutParameter(2, Types.ARRAY, "CATEGORIA_TAB");
            
            cs.executeUpdate();
            
            Object[] categoriaArr = (Object[]) cs.getArray(2).getArray();
            
        if (categoriaArr != null && categoriaArr.length > 0) {
            categoria = new String[3];
            categoria[0] = categoriaArr[0].toString(); // id
            categoria[1] = categoriaArr[1].toString(); // nombre
            categoria[2] = categoriaArr[2].toString(); // descripcion
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    } finally {
        try {
            if (cs != null) {
                cs.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    return categoria;
}

public boolean insertarCategoria(String nombre, String descripcion) {
    boolean insertado = false;
    
    try {
        cs = con.prepareCall("{call insertar_categoria(?,?)}");
        cs.setString(1, nombre);
        cs.setString(2, descripcion);
        
        int filasAfectadas = cs.executeUpdate();
        
        if (filasAfectadas > 0) {
            insertado = true;
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    } finally {
        try {
            if (cs != null) {
                cs.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    return insertado;
}

}