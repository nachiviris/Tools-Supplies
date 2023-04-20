/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author Nacho
 */
public class Orden {
    
     //Atributos
    private int orden_id;
    private int cliente_id;
    private int empleado_id;
    private String nombre_orden;
    private String fecha_orden;
    private String descripcion;
    
    //Contructor

    public Orden(int orden_id, int cliente_id, int empleado_id, String nombre_orden, String fecha_orden, String descripcion) {
        this.orden_id = orden_id;
        this.cliente_id = cliente_id;
        this.empleado_id = empleado_id;
        this.nombre_orden = nombre_orden;
        this.fecha_orden = fecha_orden;
        this.descripcion = descripcion;
    }

    public int getOrden_id() {
        return orden_id;
    }

    public void setOrden_id(int orden_id) {
        this.orden_id = orden_id;
    }

    public int getCliente_id() {
        return cliente_id;
    }

    public void setCliente_id(int cliente_id) {
        this.cliente_id = cliente_id;
    }

    public int getEmpleado_id() {
        return empleado_id;
    }

    public void setEmpleado_id(int empleado_id) {
        this.empleado_id = empleado_id;
    }

    public String getNombre_orden() {
        return nombre_orden;
    }

    public void setNombre_orden(String nombre_orden) {
        this.nombre_orden = nombre_orden;
    }

    public String getFecha_orden() {
        return fecha_orden;
    }

    public void setFecha_orden(String fecha_orden) {
        this.fecha_orden = fecha_orden;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
  
}
