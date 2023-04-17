/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author crist
 */
public class DetalleOrden {
    private int orden_id;
    private int producto_id;
    private double precio_unitario_producto;
    private int cantidad_producto;
    private double descuento_producto;
    private String descripcion_producto;

    public DetalleOrden(int orden_id, int producto_id, double precio_unitario_producto, int cantidad_producto, double descuento_producto, String descripcion_producto) {
        this.orden_id = orden_id;
        this.producto_id = producto_id;
        this.precio_unitario_producto = precio_unitario_producto;
        this.cantidad_producto = cantidad_producto;
        this.descuento_producto = descuento_producto;
        this.descripcion_producto = descripcion_producto;
    }

    public int getOrden_id() {
        return orden_id;
    }

    public void setOrden_id(int orden_id) {
        this.orden_id = orden_id;
    }

    public int getProducto_id() {
        return producto_id;
    }

    public void setProducto_id(int producto_id) {
        this.producto_id = producto_id;
    }

    public double getPrecio_unitario_producto() {
        return precio_unitario_producto;
    }

    public void setPrecio_unitario_producto(double precio_unitario_producto) {
        this.precio_unitario_producto = precio_unitario_producto;
    }

    public int getCantidad_producto() {
        return cantidad_producto;
    }

    public void setCantidad_producto(int cantidad_producto) {
        this.cantidad_producto = cantidad_producto;
    }

    public double getDescuento_producto() {
        return descuento_producto;
    }

    public void setDescuento_producto(double descuento_producto) {
        this.descuento_producto = descuento_producto;
    }

    public String getDescripcion_producto() {
        return descripcion_producto;
    }

    public void setDescripcion_producto(String descripcion_producto) {
        this.descripcion_producto = descripcion_producto;
    }

    @Override
    public String toString() {
        return "DetalleOrden{" +
                "orden_id=" + orden_id +
                ", producto_id=" + producto_id +
                ", precio_unitario_producto=" + precio_unitario_producto +
                ", cantidad_producto=" + cantidad_producto +
                ", descuento_producto=" + descuento_producto +
                ", descripcion_producto='" + descripcion_producto + '\'' +
                '}';
    }
}
