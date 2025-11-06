INSERT INTO tipo_usuario (descripcion_tipo, nombre_tipo, created_at) VALUES
('Usuario con acceso total al sistema', 'Administrador', NOW()),
('Usuario paciente con acceso limitado', 'Paciente', NOW()),
('Usuario médico con acceso a pacientes', 'Doctor', NOW());

INSERT INTO usuario (nombre_usuario, password, tipo_usuario_id_tipo_usuario, created_at) VALUES 
('admin1', SHA2('admin123', 256), 1, NOW()),
('paciente1', SHA2('pac123', 256), 2, NOW()),
('doctor1', SHA2('doc123', 256), 3, NOW());

INSERT INTO registro_doctor (rut_doctor, nombre_doctor, fecha_nacimiento_doctor, created_at) VALUES
('12345678-9', 'Dr. Juan Pérez', '1980-05-15', NOW()),
('98765432-1', 'Dra. María López', '1975-08-22', NOW());

INSERT INTO registro_personas (rut, email, numero_telefono, direccion, usuario_id_usuario) VALUES
('11111111-1', 'paciente1@email.com', '+56912345678', 'Calle 123, Santiago', 2),
('22222222-2', 'paciente2@email.com', '+56987654321', 'Avenida 456, Valparaíso', 2);

INSERT INTO estado_paciente (calificacion, registro_personas_rut, registro_personas_usuario_id_usuario) VALUES
(85, '11111111-1', 2),
(92, '22222222-2', 2);

INSERT INTO tratamiento_medico (registro_personas_rut, registro_personas_usuario_id_usuario, registro_doctor_rut_doctor) VALUES
('11111111-1', 2, '12345678-9'),
('22222222-2', 2, '98765432-1');

SELECT rp.rut, rp.email, ep.calificacion 
FROM registro_personas rp
JOIN estado_paciente ep ON rp.rut = ep.registro_personas_rut;

SELECT rd.nombre_doctor, rp.rut as rut_paciente, rp.email
FROM registro_doctor rd
JOIN tratamiento_medico tm ON rd.rut_doctor = tm.registro_doctor_rut_doctor
JOIN registro_personas rp ON tm.registro_personas_rut = rp.rut;

SELECT rp.rut, rp.email, ep.calificacion
FROM registro_personas rp
JOIN estado_paciente ep ON rp.rut = ep.registro_personas_rut
WHERE ep.calificacion < 90;

SELECT rd.nombre_doctor, COUNT(tm.registro_personas_rut) as total_pacientes
FROM registro_doctor rd
LEFT JOIN tratamiento_medico tm ON rd.rut_doctor = tm.registro_doctor_rut_doctor
GROUP BY rd.nombre_doctor;

SELECT tu.nombre_tipo, COUNT(u.id_usuario) as total_usuarios
FROM tipo_usuario tu
LEFT JOIN usuario u ON tu.id_tipo_usuario = u.tipo_usuario_id_tipo_usuario
GROUP BY tu.nombre_tipo;