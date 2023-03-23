--- Cursor que indica los clientes de la ferreteria ---
SET SERVEROUTPUT ON
DECLARE
  CURSOR clientes_actuales IS
    SELECT * FROM Clientes;
BEGIN
  FOR cliente IN clientes_actuales LOOP
    DBMS_OUTPUT.PUT_LINE('ID del cliente: ' || cliente.cliente_id || ', Nombre del cliente: ' || cliente.nombre_cliente);
  END LOOP;
END;

--- Cursor que muestra los empleados de la ferreteria ---

SET SERVEROUTPUT ON
DECLARE
  CURSOR empleados_actuales IS
    SELECT *
    FROM Empleados;
BEGIN
  FOR empleado IN empleados_actuales LOOP
    DBMS_OUTPUT.PUT_LINE('ID del empleado: ' || empleado.empleado_id || ', Nombre del empleado: ' || empleado.nombre_empleado || ', Puesto: ' || empleado.puesto_empleado);
  END LOOP;
END;

--- Cursor que indica las ordenes registradas en el sistema --- 

SET SERVEROUTPUT ON
DECLARE
  CURSOR ordenes_registradas IS
    SELECT *
    FROM Ordenes;
BEGIN
  FOR orden IN ordenes_registradas LOOP
    DBMS_OUTPUT.PUT_LINE('ID de la orden: ' || orden.orden_id || ', Nombre de la orden: ' || orden.nombre_orden || ', Cliente: ' || orden.cliente_id || ', Empleado: ' || orden.empleado_id || ', Fecha: ' || orden.fecha_orden || ', Descripción: ' || orden.descripcion);
  END LOOP;
END;