alter session set "_ORACLE_SCRIPT" = TRUE;

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
estado int not null
)TABLESPACE TBS_TS_DATA;

create table tb_cliente(
idCliente int NOT NULL CONSTRAINT PK_CLI_ID PRIMARY KEY USING INDEX TABLESPACE TBS_TS_IDX,
nombre varchar(30) not null,
apellido varchar(30) not null,
cedula varchar(15) not null,
telefono varchar(15) not null,
direccion varchar(100) not null,
estado int not null
)TABLESPACE TBS_TS_DATA;

create table tb_detalle_venta(
idDetalleVenta int NULL,
idCabeceraVenta int not null,
idProducto int not null,
cantidad int not null,
precioUnitario number(10,2) not null,
subtotal number(10,2) not null,
descuento number(10,2) not null,
iva number(10,2) not null,
totalPagar number(10,2) not null,
estado int not null,
CONSTRAINT PK_DETVEN_ID PRIMARY KEY (idDetalleVenta) USING INDEX TABLESPACE TBS_TS_IDX,
CONSTRAINT FK_Tbdetalleventa_Cabeceraventa FOREIGN KEY (idCabeceraVenta) REFERENCES tb_cabecera_venta(idCabeceraVenta),
CONSTRAINT FK_Tbdetalleventa_Producto FOREIGN KEY (idProducto) REFERENCES tb_producto(idProducto)
)TABLESPACE TBS_TS_DATA;

create table tb_producto(
idProducto int NOT NULL,
idCategoria int not null,
nombre varchar(100) not null,
cantidad int not null,
precio number(10,2) not null,
descripcion varchar(200) not null,
porcentajeIva int not null,
estado int not null,
CONSTRAINT PK_PRO_ID PRIMARY KEY (idProducto) USING INDEX TABLESPACE TBS_TS_IDX,
CONSTRAINT FK_Tbproducto_Categoria FOREIGN KEY (idCategoria) REFERENCES tb_categoria(idCategoria)
)TABLESPACE TBS_TS_DATA;


create table tb_cabecera_venta(
idCabeceraVenta int NOT NULL,
idCliente int not null,
valorPagar number(10,2) not null,
fechaVenta date not null,
estado int not null,
    CONSTRAINT PK_CV_ID PRIMARY KEY (idCabeceraVenta) USING INDEX TABLESPACE TBS_TS_IDX,
    CONSTRAINT FK_CabeceraVenta_Cliente FOREIGN KEY (idCliente) REFERENCES tb_cliente(idCliente)
)TABLESPACE TBS_TS_DATA;



create table tb_categoria(
idCategoria int NOT NULL CONSTRAINT PK_CAT_ID PRIMARY KEY USING INDEX TABLESPACE TBS_TS_IDX,
descripcion varchar(200) not null,
estado int not null
)TABLESPACE TBS_TS_DATA;

