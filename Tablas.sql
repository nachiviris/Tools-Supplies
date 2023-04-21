CREATE TABLESPACE TBS_TS_DATA DATAFILE
'C:\TBS_TS\TS\DF_TS_DATA.DBF' SIZE 20M DEFAULT STORAGE
(INITIAL 5M NEXT 5M PCTINCREASE 0);


CREATE TABLESPACE TBS_TS_IDX DATAFILE
'C:\TBS_TS\TS\DF_TS_IDX.DBF' SIZE 20M DEFAULT STORAGE
(INITIAL 5M NEXT 5M PCTINCREASE 0);

CREATE TABLE Usuario (
    usuario_id INT NOT NULL CONSTRAINT PK_USU_ID PRIMARY KEY USING INDEX TABLESPACE TBS_TS_IDX,
    nombre_usuario VARCHAR2(50) NOT NULL,
    apellido_usuario VARCHAR2(100),
    usuario VARCHAR2(50),
    password VARCHAR2(40),
    estado INT NOT NULL
)TABLESPACE TBS_TS_DATA;


CREATE TABLE Clientes (
    cliente_id INT NOT NULL CONSTRAINT PK_CLI_ID PRIMARY KEY USING INDEX TABLESPACE TBS_TS_IDX,
    nombre_cliente VARCHAR2(50) NOT NULL,
    direccion_cliente VARCHAR2(100),
    telefono_cliente VARCHAR2(50),
    correo_cliente VARCHAR2(40)
)TABLESPACE TBS_TS_DATA;

CREATE TABLE Empleados (
    empleado_id INT NOT NULL CONSTRAINT PK_EMP_ID PRIMARY KEY USING INDEX TABLESPACE TBS_TS_IDX,
    nombre_empleado VARCHAR2(50) NOT NULL,
    direccion_empleado VARCHAR2(100),
    telefono_empleado VARCHAR2(50),
    correo_empleado VARCHAR2(40),
    puesto_empleado VARCHAR2(20)
)TABLESPACE TBS_TS_DATA;

ALTER TABLE Empleados RENAME COLUMN telefono_cliente TO telefono_empleado;
ALTER TABLE Empleados RENAME COLUMN correo_cliente TO correo_empleado;

select * from Empleados;

CREATE TABLE Ordenes (
    orden_id INT NOT NULL CONSTRAINT PK_ORD_ID PRIMARY KEY USING INDEX TABLESPACE TBS_TS_IDX,
    cliente_id INT NOT NULL,
    empleado_id INT NOT NULL,
    nombre_orden VARCHAR2(50) NOT NULL,
    fecha_orden DATE NOT NULL,
    descripcion VARCHAR2(100) NOT NULL,
    CONSTRAINT FK_Ordenes_Clientes FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    CONSTRAINT FK_Ordenes_Empleados FOREIGN KEY (empleado_id) REFERENCES Empleados(empleado_id)
)TABLESPACE TBS_TS_DATA;

select * from Ordenes;

CREATE TABLE DetalleOrdenes (
    orden_id INT NOT NULL CONSTRAINT PK_DETORD_ID PRIMARY KEY USING INDEX TABLESPACE TBS_TS_IDX,
    producto_id INT NOT NULL,
    precio_unitario_producto NUMBER (10,2) NOT NULL,
    cantidad_producto INT NOT NULL,
    descuento_producto NUMBER (3,2) NOT NULL,
    descripcion_producto VARCHAR2(100),
    CONSTRAINT FK_DetalleOrdenes_Ordenes FOREIGN KEY (orden_id) REFERENCES Ordenes(orden_id),
    CONSTRAINT FK_DetalleOrdenes_Producto FOREIGN KEY (producto_id) REFERENCES Productos(producto_id)
)TABLESPACE TBS_TS_DATA;

select * from DetalleOrdenes;

CREATE TABLE Productos (
    producto_id INT NOT NULL CONSTRAINT PK_PRO_ID PRIMARY KEY USING INDEX TABLESPACE TBS_TS_IDX,
    proveedor_id INT NOT NULL,
    categoria_id INT NOT NULL,
    nombre_producto VARCHAR2(50) NOT NULL,
    fecha_orden DATE NOT NULL,
    descripcion_producto VARCHAR2(100) NOT NULL,
    CONSTRAINT FK_Productos_Proveedores FOREIGN KEY (proveedor_id) REFERENCES Proveedores(proveedor_id),
    CONSTRAINT FK_Productos_Categorias FOREIGN KEY (categoria_id) REFERENCES Categorias(producto_id)
)TABLESPACE TBS_TS_DATA;

CREATE TABLE Proveedores (
    proveedor_id INT NOT NULL CONSTRAINT PK_PROV_ID PRIMARY KEY USING INDEX TABLESPACE TBS_TS_IDX,
    nombre_proveedor VARCHAR2(50) NOT NULL,
    nombre_contacto_proveedor VARCHAR2(50) NOT NULL,
    direccion_proveedor VARCHAR2(50) NOT NULL,
    telefono_proveedor VARCHAR2(50) NOT NULL
)TABLESPACE TBS_TS_DATA;


CREATE TABLE Categorias (
    categoria_id INT NOT NULL CONSTRAINT PK_CAT_ID PRIMARY KEY USING INDEX TABLESPACE TBS_TS_IDX2,
    nombre_categoria VARCHAR2(50) NOT NULL,
    descripcion_categoria VARCHAR2(50) NOT NULL
)TABLESPACE TBS_TS_DATA;




