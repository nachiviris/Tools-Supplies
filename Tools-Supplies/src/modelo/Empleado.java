/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author Nacho
 */
public class Empleado {
    
    ///Atributos
    private int empleado_id;
    private String nombre_empleado;
    private String direccion_empleado;
    private String telefono_empleado;
    private String correo_empleado;
    private String puesto_empleado;
    
    
    ////Constructor

    public Empleado(int empleado_id, String nombre_empleado, String direccion_empleado, String telefono_empleado, String correo_empleado, String puesto_empleado) {
        this.empleado_id = empleado_id;
        this.nombre_empleado = nombre_empleado;
        this.direccion_empleado = direccion_empleado;
        this.telefono_empleado = telefono_empleado;
        this.correo_empleado = correo_empleado;
        this.puesto_empleado = puesto_empleado;
    }

    public int getEmpleado_id() {
        return empleado_id;
    }

    public void setEmpleado_id(int empleado_id) {
        this.empleado_id = empleado_id;
    }

    public String getNombre_empleado() {
        return nombre_empleado;
    }

    public void setNombre_empleado(String nombre_empleado) {
        this.nombre_empleado = nombre_empleado;
    }

    public String getDireccion_empleado() {
        return direccion_empleado;
    }

    public void setDireccion_empleado(String direccion_empleado) {
        this.direccion_empleado = direccion_empleado;
    }

    public String getTelefono_empleado() {
        return telefono_empleado;
    }

    public void setTelefono_empleado(String telefono_empleado) {
        this.telefono_empleado = telefono_empleado;
    }

    public String getCorreo_empleado() {
        return correo_empleado;
    }

    public void setCorreo_empleado(String correo_empleado) {
        this.correo_empleado = correo_empleado;
    }

    public String getPuesto_empleado() {
        return puesto_empleado;
    }

    public void setPuesto_empleado(String puesto_empleado) {
        this.puesto_empleado = puesto_empleado;
    }
    
    
    
}
