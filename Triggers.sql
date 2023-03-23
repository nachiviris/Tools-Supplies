--- Eliminar clientes ---
CREATE TRIGGER eliminar_cliente
BEFORE DELETE ON Clientes
FOR EACH ROW
BEGIN
    DELETE FROM Clientes
    WHERE cliente_id = OLD.cliente_id;
END;

--- Eliminar producto ---

/*CREATE TRIGGER eliminar_producto
BEFORE DELETE ON Productos
FOR EACH ROW
BEGIN
    DELETE FROM Productos
    WHERE producto_id = OLD.producto_id;
END*/

--- Historial de clientes eliminados --- 

/*CREATE TRIGGER historial_clientes
ON Clientes
AFTER INSERT, DELETE
AS
BEGIN
    IF EXISTS(SELECT * FROM inserted)
    BEGIN
        INSERT INTO ClientesActuales (cliente_id, nombre_cliente, direccion_cliente, telefono_cliente, correo_cliente)
        SELECT cliente_id, nombre_cliente, direccion_cliente, telefono_cliente, correo_cliente
        FROM inserted
    END
    IF EXISTS(SELECT * FROM deleted)
    BEGIN
        INSERT INTO ClientesEliminados (cliente_id, nombre_cliente, direccion_cliente, telefono_cliente, correo_cliente)
        SELECT cliente_id, nombre_cliente, direccion_cliente, telefono_cliente, correo_cliente
        FROM deleted
    END
END*/