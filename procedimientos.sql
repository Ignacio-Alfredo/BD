USE `mydb`;

-- ========================================================
-- Procedimientos para tipo_usuario
-- ========================================================

DELIMITER ;;
CREATE PROCEDURE sp_tipo_usuario_insertar(
    IN p_descripcion_tipo VARCHAR(100),
    IN p_nombre_tipo VARCHAR(20),
    IN p_created_by INT
)
BEGIN
    INSERT INTO tipo_usuario (descripcion_tipo, nombre_tipo, created_at, created_by)
    VALUES (p_descripcion_tipo, p_nombre_tipo, NOW(), p_created_by);
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_tipo_usuario_eliminar_logico(
    IN p_id_tipo_usuario INT
)
BEGIN
    UPDATE tipo_usuario
    SET deleted = 1,
        update_at = NOW()
    WHERE id_tipo_usuario = p_id_tipo_usuario;
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_tipo_usuario_obtener_activos()
BEGIN
    SELECT * FROM tipo_usuario
    WHERE deleted IS NULL OR deleted = 0;
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_tipo_usuario_obtener_todos()
BEGIN
    SELECT * FROM tipo_usuario;
END;;
DELIMITER ;


-- ========================================================
-- Procedimientos para usuario
-- ========================================================

DELIMITER ;;
CREATE PROCEDURE sp_usuario_insertar(
    IN p_nombre_usuario VARCHAR(50),
    IN p_password VARCHAR(255),
    IN p_tipo_usuario_id_tipo_usuario INT,
    IN p_created_by INT
)
BEGIN
    INSERT INTO usuario (nombre_usuario, password, tipo_usuario_id_tipo_usuario, created_at, created_by)
    VALUES (p_nombre_usuario, p_password, p_tipo_usuario_id_tipo_usuario, NOW(), p_created_by);
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_usuario_eliminar_logico(
    IN p_id_usuario INT
)
BEGIN
    UPDATE usuario
    SET deleted = 1,
        update_at = NOW()
    WHERE id_usuario = p_id_usuario;
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_usuario_obtener_activos()
BEGIN
    SELECT * FROM usuario
    WHERE deleted IS NULL OR deleted = 0;
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_usuario_obtener_todos()
BEGIN
    SELECT * FROM usuario;
END;;
DELIMITER ;


-- ========================================================
-- Procedimientos para registro_personas
-- ========================================================

DELIMITER ;;
CREATE PROCEDURE sp_registro_personas_insertar(
    IN p_rut VARCHAR(12),
    IN p_email VARCHAR(50),
    IN p_numero_telefono VARCHAR(20),
    IN p_direccion VARCHAR(50),
    IN p_usuario_id_usuario INT,
    IN p_created_by INT
)
BEGIN
    INSERT INTO registro_personas (rut, email, numero_telefono, direccion, usuario_id_usuario, created_at, created_by)
    VALUES (p_rut, p_email, p_numero_telefono, p_direccion, p_usuario_id_usuario, NOW(), p_created_by);
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_registro_personas_eliminar_logico(
    IN p_rut VARCHAR(12)
)
BEGIN
    UPDATE registro_personas
    SET deleted = 1,
        update_at = NOW()
    WHERE rut = p_rut;
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_registro_personas_obtener_activos()
BEGIN
    SELECT * FROM registro_personas
    WHERE deleted IS NULL OR deleted = 0;
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_registro_personas_obtener_todos()
BEGIN
    SELECT * FROM registro_personas;
END;;
DELIMITER ;


-- ========================================================
-- Procedimientos para estado_paciente
-- ========================================================

DELIMITER ;;
CREATE PROCEDURE sp_estado_paciente_insertar(
    IN p_calificacion TINYINT,
    IN p_registro_personas_rut VARCHAR(12),
    IN p_registro_personas_usuario_id_usuario INT,
    IN p_created_by INT
)
BEGIN
    INSERT INTO estado_paciente (calificacion, registro_personas_rut, registro_personas_usuario_id_usuario, created_at, created_by)
    VALUES (p_calificacion, p_registro_personas_rut, p_registro_personas_usuario_id_usuario, NOW(), p_created_by);
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_estado_paciente_eliminar_logico(
    IN p_id_estado_paciente INT
)
BEGIN
    UPDATE estado_paciente
    SET deleted = 1,
        update_at = NOW()
    WHERE id_estado_paciente = p_id_estado_paciente;
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_estado_paciente_obtener_activos()
BEGIN
    SELECT * FROM estado_paciente
    WHERE deleted IS NULL OR deleted = 0;
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_estado_paciente_obtener_todos()
BEGIN
    SELECT * FROM estado_paciente;
END;;
DELIMITER ;


-- ========================================================
-- Procedimientos para registro_doctor
-- ========================================================

DELIMITER ;;
CREATE PROCEDURE sp_registro_doctor_insertar(
    IN p_rut_doctor VARCHAR(12),
    IN p_nombre_doctor VARCHAR(45),
    IN p_fecha_nacimiento_doctor DATE,
    IN p_created_by INT
)
BEGIN
    INSERT INTO registro_doctor (rut_doctor, nombre_doctor, fecha_nacimiento_doctor, created_at, created_by)
    VALUES (p_rut_doctor, p_nombre_doctor, p_fecha_nacimiento_doctor, NOW(), p_created_by);
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_registro_doctor_eliminar_logico(
    IN p_rut_doctor VARCHAR(12)
)
BEGIN
    UPDATE registro_doctor
    SET deleted = 1,
        update_at = NOW()
    WHERE rut_doctor = p_rut_doctor;
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_registro_doctor_obtener_activos()
BEGIN
    SELECT * FROM registro_doctor
    WHERE deleted IS NULL OR deleted = 0;
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_registro_doctor_obtener_todos()
BEGIN
    SELECT * FROM registro_doctor;
END;;
DELIMITER ;


-- ========================================================
-- Procedimientos para tratamiento_medico
-- ========================================================

DELIMITER ;;
CREATE PROCEDURE sp_tratamiento_medico_insertar(
    IN p_registro_personas_rut VARCHAR(12),
    IN p_registro_personas_usuario_id_usuario INT,
    IN p_registro_doctor_rut_doctor VARCHAR(12),
    IN p_created_by INT
)
BEGIN
    INSERT INTO tratamiento_medico (registro_personas_rut, registro_personas_usuario_id_usuario, registro_doctor_rut_doctor, created_at, created_by)
    VALUES (p_registro_personas_rut, p_registro_personas_usuario_id_usuario, p_registro_doctor_rut_doctor, NOW(), p_created_by);
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_tratamiento_medico_eliminar_logico(
    IN p_id_tratamiento_medico INT
)
BEGIN
    UPDATE tratamiento_medico
    SET deleted = 1,
        update_at = NOW()
    WHERE id_tratamiento_medico = p_id_tratamiento_medico;
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_tratamiento_medico_obtener_activos()
BEGIN
    SELECT * FROM tratamiento_medico
    WHERE deleted IS NULL OR deleted = 0;
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_tratamiento_medico_obtener_todos()
BEGIN
    SELECT * FROM tratamiento_medico;
END;;
DELIMITER ;


-- ========================================================
-- Procedimientos para medicamentos
-- ========================================================

DELIMITER ;;
CREATE PROCEDURE sp_medicamentos_insertar(
    IN p_nombre_medicamento VARCHAR(50),
    IN p_descripcion_medicamento VARCHAR(100),
    IN p_dosis VARCHAR(20),
    IN p_tratamiento_medico_id_tratamiento_medico INT,
    IN p_created_by INT
)
BEGIN
    INSERT INTO medicamentos (nombre_medicamento, descripcion_medicamento, dosis, tratamiento_medico_id_tratamiento_medico, created_at, created_by)
    VALUES (p_nombre_medicamento, p_descripcion_medicamento, p_dosis, p_tratamiento_medico_id_tratamiento_medico, NOW(), p_created_by);
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_medicamentos_eliminar_logico(
    IN p_id_medicamento INT
)
BEGIN
    UPDATE medicamentos
    SET deleted = 1,
        update_at = NOW()
    WHERE id_medicamento = p_id_medicamento;
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_medicamentos_obtener_activos()
BEGIN
    SELECT * FROM medicamentos
    WHERE deleted IS NULL OR deleted = 0;
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_medicamentos_obtener_todos()
BEGIN
    SELECT * FROM medicamentos;
END;;
DELIMITER ;


-- ========================================================
-- Procedimientos para genero
-- ========================================================

DELIMITER ;;
CREATE PROCEDURE sp_genero_insertar(
    IN p_nombre_genero VARCHAR(45),
    IN p_descripcion_genero VARCHAR(100),
    IN p_registro_personas_rut VARCHAR(12),
    IN p_registro_personas_usuario_id_usuario INT,
    IN p_created_by INT
)
BEGIN
    INSERT INTO genero (nombre_genero, descripcion_genero, registro_personas_rut, registro_personas_usuario_id_usuario, created_at, created_by)
    VALUES (p_nombre_genero, p_descripcion_genero, p_registro_personas_rut, p_registro_personas_usuario_id_usuario, NOW(), p_created_by);
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_genero_eliminar_logico(
    IN p_id_genero INT
)
BEGIN
    UPDATE genero
    SET deleted = 1,
        update_at = NOW()
    WHERE id_genero = p_id_genero;
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_genero_obtener_activos()
BEGIN
    SELECT * FROM genero
    WHERE deleted IS NULL OR deleted = 0;
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_genero_obtener_todos()
BEGIN
    SELECT * FROM genero;
END;;
DELIMITER ;


-- ========================================================
-- Procedimientos para chat
-- ========================================================

DELIMITER ;;
CREATE PROCEDURE sp_chat_insertar(
    IN p_mensaje_doctor LONGTEXT,
    IN p_mensaje_paciente LONGTEXT,
    IN p_usuario_id_usuario INT,
    IN p_registro_doctor_rut_doctor VARCHAR(12),
    IN p_created_by INT
)
BEGIN
    INSERT INTO chat (mensaje_doctor, mensaje_paciente, usuario_id_usuario, registro_doctor_rut_doctor, created_at, created_by)
    VALUES (p_mensaje_doctor, p_mensaje_paciente, p_usuario_id_usuario, p_registro_doctor_rut_doctor, NOW(), p_created_by);
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_chat_eliminar_logico(
    IN p_id_chat INT
)
BEGIN
    UPDATE chat
    SET deleted = 1,
        update_at = NOW()
    WHERE id_chat = p_id_chat;
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_chat_obtener_activos()
BEGIN
    SELECT * FROM chat
    WHERE deleted IS NULL OR deleted = 0;
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_chat_obtener_todos()
BEGIN
    SELECT * FROM chat;
END;;
DELIMITER ;


-- ========================================================
-- Procedimientos para sintomas
-- ========================================================

DELIMITER ;;
CREATE PROCEDURE sp_sintomas_insertar(
    IN p_nombre_sintomas VARCHAR(50),
    IN p_descripcion_sintomas VARCHAR(200),
    IN p_estado_paciente_id_estado_paciente INT,
    IN p_created_by INT
)
BEGIN
    INSERT INTO sintomas (nombre_sintomas, descripcion_sintomas, estado_paciente_id_estado_paciente, created_at, created_by)
    VALUES (p_nombre_sintomas, p_descripcion_sintomas, p_estado_paciente_id_estado_paciente, NOW(), p_created_by);
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_sintomas_eliminar_logico(
    IN p_id_sintomas INT
)
BEGIN
    UPDATE sintomas
    SET deleted = 1,
        update_at = NOW()
    WHERE id_sintomas = p_id_sintomas;
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_sintomas_obtener_activos()
BEGIN
    SELECT * FROM sintomas
    WHERE deleted IS NULL OR deleted = 0;
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE sp_sintomas_obtener_todos()
BEGIN
    SELECT * FROM sintomas;
END;;
DELIMITER ;