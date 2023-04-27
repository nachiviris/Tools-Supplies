-- Crear el usuario con los permisos de DBA
CREATE USER system_ts IDENTIFIED BY systemts;

-- Asignar roles de DBA al usuario
GRANT DBA TO system_ts;

-- Otorgar privilegios adicionales de DBA al usuario
-- Puedes agregar otros privilegios de DBA que desees otorgar
GRANT ALTER DATABASE TO system_ts;
GRANT BACKUP ANY TABLE TO system_ts;
GRANT RESTORE ANY TABLE TO system_ts;
GRANT CREATE SESSION TO system_ts;
GRANT ALTER SYSTEM TO system_ts;


INSERT INTO Usuario (usuario_id, nombre_usuario, apellido_usuario, usuario, password, estado)
VALUES (1, 'Jose', 'Bernal', 'jose', '123', 1);

drop table usuario;

CREATE TABLE Usuario (
    usuario_id INT NOT NULL CONSTRAINT PK_USU_ID PRIMARY KEY USING INDEX TABLESPACE TBS_TS_IDX,
    nombre_usuario VARCHAR2(50) NOT NULL,
    apellido_usuario VARCHAR2(100),
    usuario VARCHAR2(50),
    password VARCHAR2(40),
    estado INT NOT NULL
)TABLESPACE TBS_TS_DATA;

select * from usuario;

COMMIT;