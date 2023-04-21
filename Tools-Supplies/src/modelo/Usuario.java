/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author Nacho
 */
public class Usuario {
    
    private int usuario_id;
    private String nombre_usuario;
    private String apellido_usuario;
    private String usuario;
    private String password;
    private int estado;

    public Usuario(int usuario_id, String nombre_usuario, String apellido_usuario, String usuario, String password, int estado) {
        this.usuario_id = usuario_id;
        this.nombre_usuario = nombre_usuario;
        this.apellido_usuario = apellido_usuario;
        this.usuario = usuario;
        this.password = password;
        this.estado = estado;
    }


    public Usuario() {
        this.usuario_id = 0;
        this.nombre_usuario = "";
        this.apellido_usuario = "";
        this.usuario = "";
        this.password = "";
        this.estado = 0;
    }

   
    public int getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(int usuario_id) {
        this.usuario_id = usuario_id;
    }

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }

    public String getApellido_usuario() {
        return apellido_usuario;
    }

    public void setApellido_usuario(String apellido_usuario) {
        this.apellido_usuario = apellido_usuario;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

  
   
    
}
