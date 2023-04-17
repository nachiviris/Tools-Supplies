/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author crist
 */
public class Categoria {
    private int categoria_id;
    private String nombre_categoria;
    private String descripcion_categoria;

    public Categoria(int categoria_id, String nombre_categoria, String descripcion_categoria) {
        this.categoria_id = categoria_id;
        this.nombre_categoria = nombre_categoria;
        this.descripcion_categoria = descripcion_categoria;
    }

    public int getCategoria_id() {
        return categoria_id;
    }

    public void setCategoria_id(int categoria_id) {
        this.categoria_id = categoria_id;
    }

    public String getNombre_categoria() {
        return nombre_categoria;
    }

    public void setNombre_categoria(String nombre_categoria) {
        this.nombre_categoria = nombre_categoria;
    }

    public String getDescripcion_categoria() {
        return descripcion_categoria;
    }

    public void setDescripcion_categoria(String descripcion_categoria) {
        this.descripcion_categoria = descripcion_categoria;
    }

    @Override
    public String toString() {
        return "Categoria{" +
                "categoria_id=" + categoria_id +
                ", nombre_categoria='" + nombre_categoria + '\'' +
                ", descripcion_categoria='" + descripcion_categoria + '\'' +
                '}';
    }
}
