/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author crist
 */
public class Producto {
    private int producto_id;
    private int proveedor_id;
    private int categoria_id;
    private String nombre_producto;
    private String descripcion_producto;

    public Producto(int producto_id, int proveedor_id, int categoria_id, String nombre_producto, String descripcion_producto) {
        this.producto_id = producto_id;
        this.proveedor_id = proveedor_id;
        this.categoria_id = categoria_id;
        this.nombre_producto = nombre_producto;
        this.descripcion_producto = descripcion_producto;
    }
 public Producto () {
     this.producto_id = 0;
        this.nombre_producto = "";
        this.descripcion_producto = "";
        this.categoria_id = 0;
        this.proveedor_id = 0;
        
 }
    

    public int getProducto_id() {
        return producto_id;
    }

    public void setProducto_id(int producto_id) {
        this.producto_id = producto_id;
    }

    public int getProveedor_id() {
        return proveedor_id;
    }

    public void setProveedor_id(int proveedor_id) {
        this.proveedor_id = proveedor_id;
    }

    public int getCategoria_id() {
        return categoria_id;
    }

    public void setCategoria_id(int categoria_id) {
        this.categoria_id = categoria_id;
    }

    public String getNombre_producto() {
        return nombre_producto;
    }

    public void setNombre_producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
    }

    public String getDescripcion_producto() {
        return descripcion_producto;
    }

    public void setDescripcion_producto(String descripcion_producto) {
        this.descripcion_producto = descripcion_producto;
    }

    @Override
    public String toString() {
        return "Producto{" +
                "producto_id=" + producto_id +
                ", proveedor_id=" + proveedor_id +
                ", categoria_id=" + categoria_id +
                ", nombre_producto='" + nombre_producto + '\'' +
                ", descripcion_producto='" + descripcion_producto + '\'' +
                '}';
    }
}