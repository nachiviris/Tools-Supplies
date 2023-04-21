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

