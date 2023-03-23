--- Consultar el nombre de un cliente a partir de su ID ---

CREATE OR REPLACE FUNCTION obtener_nombre_cliente(cliente_id IN NUMBER) RETURN VARCHAR2
IS
  nombre_cliente VARCHAR2(50);
BEGIN
  SELECT nombre_cliente INTO nombre_cliente
  FROM Clientes
  WHERE cliente_id = obtener_nombre_cliente.cliente_id;
  
  RETURN nombre_cliente;
END;

SELECT obtener_nombre_cliente(1) FROM dual;

--- Detalle de Orden a partir de la tabla Productos ---
/*CREATE FUNCTION obtener_detalle_orden(orden_id INTEGER) 
RETURN sys_refcursor AS 
detalle_cursor sys_refcursor; 
BEGIN 
    OPEN detalle_cursor FOR 
    SELECT d.producto_id, p.nombre_producto, d.precio_unitario, d.cantidad, d.descuento 
    FROM DetalleOrdenes d 
    INNER JOIN Productos p ON d.producto_id = p.producto_id 
    WHERE d.orden_id = orden_id; 
    RETURN detalle_cursor; 
END; */

--- Contar la cantidad de productos disponibles de un producto en especifico ---
/*CREATE OR REPLACE FUNCTION contar_productos(nombre_producto VARCHAR2) RETURN NUMBER IS
  contador NUMBER(10);
BEGIN
  SELECT COUNT(*) INTO contador
  FROM productos
  WHERE nombre_producto LIKE '%' || nombre_producto || '%'
  AND cantidad_stock > 0;
  RETURN contador;
END;*/

--- Obtener nombre del proveedor de un producto ---
/*CREATE OR REPLACE FUNCTION obtener_nombre_proveedor(p_producto_id IN NUMBER)
  RETURN VARCHAR2
AS
  v_nombre_proveedor VARCHAR2(100);
BEGIN
  SELECT pr.nombre_proveedor
  INTO v_nombre_proveedor
  FROM proveedores pr
  JOIN productos p ON pr.proveedor_id = p.proveedor_id
  WHERE p.producto_id = p_producto_id;

  RETURN v_nombre_proveedor;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN NULL;
END;*/