--- Registrar cliente ---
CREATE OR REPLACE PROCEDURE REGISTRAR_CLIENTE(
    P_CLIENTE_ID IN Clientes.cliente_id%TYPE,
    P_NOMBRE_CLIENTE IN Clientes.nombre_cliente%TYPE,
    P_DIRECCION_CLIENTE IN Clientes.direccion_cliente%TYPE,
    P_TELEFONO_CLIENTE IN Clientes.telefono_cliente%TYPE,
    P_CORREO_CLIENTE IN Clientes.correo_cliente%TYPE
) AS
BEGIN
    INSERT INTO Clientes (cliente_id, nombre_cliente, direccion_cliente, telefono_cliente, correo_cliente)
    VALUES (P_CLIENTE_ID, P_NOMBRE_CLIENTE, P_DIRECCION_CLIENTE, P_TELEFONO_CLIENTE, P_CORREO_CLIENTE);
    
    COMMIT;
END;

BEGIN
    REGISTRAR_CLIENTE('2', 'John Mesen', 'Calle 123', '6080-9965', 'johnmesen342@ufide.ac.cr');
END;

--- Modificar Cliente ---

CREATE OR REPLACE PROCEDURE MODIFICAR_CLIENTE(
    P_CLIENTE_ID IN CLIENTES.CLIENTE_ID%TYPE,
    P_NOMBRE_CLIENTE IN CLIENTES.NOMBRE_CLIENTE%TYPE,
    P_DIRECCION_CLIENTE IN CLIENTES.DIRECCION_CLIENTE%TYPE,
    P_TELEFONO_CLIENTE IN CLIENTES.TELEFONO_CLIENTE%TYPE,
    P_CORREO_CLIENTE IN CLIENTES.CORREO_CLIENTE%TYPE
)
AS
BEGIN
    UPDATE CLIENTES
    SET NOMBRE_CLIENTE = P_NOMBRE_CLIENTE,
        DIRECCION_CLIENTE = P_DIRECCION_CLIENTE,
        TELEFONO_CLIENTE = P_TELEFONO_CLIENTE,
        CORREO_CLIENTE = P_CORREO_CLIENTE
    WHERE CLIENTE_ID = P_CLIENTE_ID;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('El cliente con ID ' || P_CLIENTE_ID || ' ha sido modificado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Ha ocurrido un error al intentar modificar el cliente con ID ' || P_CLIENTE_ID || '. ' || SQLERRM);
END;

BEGIN
    MODIFICAR_CLIENTE('1', 'Carlos Eduardo', 'Calle 123', '6080-9965', 'carloseduardo342@ufide.ac.cr');
END;

--- Registrar empleado ---

CREATE OR REPLACE PROCEDURE registrar_empleado (
    p_empleado_id Empleados.empleado_id%TYPE,
    p_nombre_empleado Empleados.nombre_empleado%TYPE,
    p_direccion_empleado Empleados.direccion_empleado%TYPE,
    p_telefono_empleado Empleados.telefono_empleado%TYPE,
    p_correo_empleado Empleados.correo_empleado%TYPE,
    p_puesto_empleado Empleados.puesto_empleado%TYPE
) AS
BEGIN
    INSERT INTO Empleados (
        empleado_id,
        nombre_empleado,
        direccion_empleado,
        telefono_empleado,
        correo_empleado,
        puesto_empleado
    ) VALUES (
        p_empleado_id,
        p_nombre_empleado,
        p_direccion_empleado,
        p_telefono_empleado,
        p_correo_empleado,
        p_puesto_empleado
    );
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('El empleado ha sido registrado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Ha ocurrido un error al registrar el empleado.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

BEGIN
  REGISTRAR_EMPLEADO('1', 'Manuel Quesada', 'Calle 502', '808854157', 'manuelquesada@gmail,com', 'Bodega');
END;


--- Registrar orden ---

CREATE OR REPLACE PROCEDURE registrar_orden
(
  p_orden_id IN Ordenes.orden_id%TYPE,
  p_cliente_id IN Ordenes.cliente_id%TYPE,
  p_empleado_id IN Ordenes.empleado_id%TYPE,
  p_nombre_orden IN Ordenes.nombre_orden%TYPE,
  p_fecha_orden IN Ordenes.fecha_orden%TYPE,
  p_descripcion IN Ordenes.descripcion%TYPE
)
AS
BEGIN
  INSERT INTO Ordenes(orden_id, cliente_id, empleado_id, nombre_orden, fecha_orden, descripcion)
  VALUES(p_orden_id, p_cliente_id, p_empleado_id, p_nombre_orden, p_fecha_orden, p_descripcion);
  COMMIT;
END;

BEGIN
    registrar_orden('1', '2', '1', 'Orden_Martillo', '10/3/2023', 'Martillos');
END;

--- Modificar orden ---

CREATE OR REPLACE PROCEDURE modificar_orden (
    p_orden_id IN ORDENES.ORDEN_ID%TYPE,
    p_cliente_id IN ORDENES.CLIENTE_ID%TYPE,
    p_empleado_id IN ORDENES.EMPLEADO_ID%TYPE,
    p_nombre_orden IN ORDENES.NOMBRE_ORDEN%TYPE,
    p_fecha_orden IN ORDENES.FECHA_ORDEN%TYPE,
    p_descripcion IN ORDENES.DESCRIPCION%TYPE
) AS
BEGIN
    UPDATE ORDENES
    SET 
        CLIENTE_ID = p_cliente_id,
        EMPLEADO_ID = p_empleado_id,
        NOMBRE_ORDEN = p_nombre_orden,
        FECHA_ORDEN = p_fecha_orden,
        DESCRIPCION = p_descripcion
    WHERE ORDEN_ID = p_orden_id;
    
    COMMIT;
END;

----------------Procedures Categoria------------

----Create---
CREATE OR REPLACE PROCEDURE crear_categoria (
    p_nombre_categoria IN VARCHAR2,
    p_descripcion_categoria IN VARCHAR2
) AS
BEGIN
    INSERT INTO Categorias (categoria_id, nombre_categoria, descripcion_categoria)
    VALUES (seq_categoria.nextval, p_nombre_categoria, p_descripcion_categoria);
    COMMIT;
END;
---Replace
CREATE OR REPLACE PROCEDURE obtener_categoria (
    p_categoria_id IN INT,
    p_nombre_categoria OUT VARCHAR2,
    p_descripcion_categoria OUT VARCHAR2
) AS
BEGIN
    SELECT nombre_categoria, descripcion_categoria
    INTO p_nombre_categoria, p_descripcion_categoria
    FROM Categorias
    WHERE categoria_id = p_categoria_id;
END;
----Update---
CREATE OR REPLACE PROCEDURE actualizar_categoria (
    p_categoria_id IN INT,
    p_nombre_categoria IN VARCHAR2,
    p_descripcion_categoria IN VARCHAR2
) AS
BEGIN
    UPDATE Categorias
    SET nombre_categoria = p_nombre_categoria, descripcion_categoria = p_descripcion_categoria
    WHERE categoria_id = p_categoria_id;
    COMMIT;
END;
----Delete-----
CREATE OR REPLACE PROCEDURE eliminar_categoria (
    p_categoria_id IN INT
) AS
BEGIN
    DELETE FROM Categorias
    WHERE categoria_id = p_categoria_id;
    COMMIT;
END;

