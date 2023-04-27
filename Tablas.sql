CREATE TABLESPACE TBS_TS_DATA DATAFILE
'C:\TBS_TS\TS\DF_TS_DATA.DBF' SIZE 20M DEFAULT STORAGE
(INITIAL 5M NEXT 5M PCTINCREASE 0);


CREATE TABLESPACE TBS_TS_IDX DATAFILE
'C:\TBS_TS\TS\DF_TS_IDX.DBF' SIZE 20M DEFAULT STORAGE
(INITIAL 5M NEXT 5M PCTINCREASE 0);

create table tb_usuario(
idUsuario int NOT NULL CONSTRAINT PK_U_ID PRIMARY KEY USING INDEX TABLESPACE TBS_TS_IDX,
nombre varchar(30) not null,
apellido varchar(30) not null,
usuario varchar(15) not null,
password varchar(15) not null,
telefono varchar(15) not null,
estado int(1) not null
)TABLESPACE TBS_TS_DATA;


create table tb_cliente(
idCliente int NOT NULL CONSTRAINT PK_CLI_ID PRIMARY KEY USING INDEX TABLESPACE TBS_TS_IDX,
nombre varchar(30) not null,
apellido varchar(30) not null,
cedula varchar(15) not null,
telefono varchar(15) not null,
direccion varchar(100) not null,
estado int(1) not null
)TABLESPACE TBS_TS_DATA;


create table tb_detalle_venta(
idDetalleVenta int NULL CONSTRAINT PK_DETVEN_ID PRIMARY KEY USING INDEX TABLESPACE TBS_TS_IDX,
idCabeceraVenta int (11) not null,
idProducto int (11) not null,
cantidad int(11) not null,
precioUnitario double(10,2) not null,
subtotal double(10,2) not null,
descuento double(10,2) not null,
iva double(10,2) not null,
totalPagar double(10,2) not null,
estado int(1) not null
)TABLESPACE TBS_TS_DATA;



create table tb_producto(
idProducto int NOT NULL CONSTRAINT PK_PRO_ID PRIMARY KEY USING INDEX TABLESPACE TBS_TS_IDX,
nombre varchar(100) not null,
cantidad int(11) not null,
precio double(10,2) not null,
descripcion varchar(200) not null,
porcentajeIva int(2) not null,
idCategoria int(11) not null,
estado int(1) not null
)TABLESPACE TBS_TS_DATA;

create table tb_cabecera_venta(
idCabeceraVenta int NOT NULL CONSTRAINT PK_CV_ID PRIMARY KEY USING INDEX TABLESPACE TBS_TS_IDX,
idCliente int(11) not null,
valorPagar double(10,2) not null,
fechaVenta date not null,
estado int(1) not null
)TABLESPACE TBS_TS_DATA;




create table tb_categoria(
idCategoria int NOT NULL CONSTRAINT PK_CAT_ID PRIMARY KEY USING INDEX TABLESPACE TBS_TS_IDX,
descripcion varchar(200) not null,
estado int(1) not null
)TABLESPACE TBS_TS_DATA;





