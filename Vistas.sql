--- Consultar Ordenes por cliente ---

CREATE VIEW ordenes_por_cliente AS
SELECT o.orden_id, o.nombre_orden, o.fecha_orden, c.nombre_cliente
FROM Ordenes o
JOIN Clientes c
ON o.cliente_id = c.cliente_id;

SELECT * FROM ordenes_por_cliente;

--- Consultar Ordenes por empleado ---

CREATE VIEW ordenes_por_empleado AS
SELECT o.orden_id, o.cliente_id, o.empleado_id, e.nombre_empleado, o.nombre_orden, o.fecha_orden, o.descripcion
FROM Ordenes o
JOIN Empleados e ON o.empleado_id = e.empleado_id;

select * from ordenes_por_empleado;
