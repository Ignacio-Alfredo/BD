SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

CREATE TABLE IF NOT EXISTS `mydb`.`tipo_usuario` (
`id_tipo_usuario` INT NOT NULL AUTO_INCREMENT,
`descripcion_tipo` VARCHAR(100) NOT NULL,
`nombre_tipo` VARCHAR(20) NOT NULL,
`created_at` DATETIME NULL,
`update_at` DATETIME NULL,
`created_by` INT NULL,
`update_by` INT NULL,
`deleted` TINYINT NULL,
PRIMARY KEY (`id_tipo_usuario`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
`id_usuario` INT NOT NULL AUTO_INCREMENT,
`nombre_usuario` VARCHAR(50) NOT NULL,
`password` VARCHAR(255) NOT NULL,
`created_at` DATETIME NULL,
`update_at` DATETIME NULL,
`created_by` INT NULL,
`update_by` INT NULL,
`deleted` TINYINT NULL,
`tipo_usuario_id_tipo_usuario` INT NOT NULL,
PRIMARY KEY (`id_usuario`),
INDEX `fk_usuario_tipo_usuario_idx` (`tipo_usuario_id_tipo_usuario` ASC) VISIBLE,
CONSTRAINT `fk_usuario_tipo_usuario`
    FOREIGN KEY (`tipo_usuario_id_tipo_usuario`)
    REFERENCES `mydb`.`tipo_usuario` (`id_tipo_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`registro_personas` (
`rut` VARCHAR(12) NOT NULL,
`email` VARCHAR(50) NOT NULL,
`numero_telefono` VARCHAR(20) NOT NULL,
`direccion` VARCHAR(50) NOT NULL,
`created_at` DATETIME NULL,
`update_at` DATETIME NULL,
`created_by` INT NULL,
`update_by` INT NULL,
`deleted` TINYINT NULL,
`usuario_id_usuario` INT NOT NULL,
PRIMARY KEY (`rut`, `usuario_id_usuario`),
UNIQUE INDEX `rut_UNIQUE` (`rut` ASC) VISIBLE,
UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
INDEX `fk_personas_usuario1_idx` (`usuario_id_usuario` ASC) VISIBLE,
CONSTRAINT `fk_personas_usuario1`
    FOREIGN KEY (`usuario_id_usuario`)
    REFERENCES `mydb`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`estado_paciente` (
`id_estado_paciente` INT NOT NULL AUTO_INCREMENT,
`calificacion` TINYINT(2) NOT NULL,
`created_at` DATETIME NULL,
`update_at` DATETIME NULL,
`created_by` INT NULL,
`update_by` INT NULL,
`deleted` TINYINT NULL,
`registro_personas_rut` VARCHAR(12) NOT NULL,
`registro_personas_usuario_id_usuario` INT NOT NULL,
PRIMARY KEY (`id_estado_paciente`),
INDEX `fk_estado_paciente_registro_personas1_idx` (`registro_personas_rut` ASC, `registro_personas_usuario_id_usuario` ASC) VISIBLE,
CONSTRAINT `fk_estado_paciente_registro_personas1`
    FOREIGN KEY (`registro_personas_rut` , `registro_personas_usuario_id_usuario`)
    REFERENCES `mydb`.`registro_personas` (`rut` , `usuario_id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`registro_doctor` (
`rut_doctor` VARCHAR(12) NOT NULL,
`nombre_doctor` VARCHAR(45) NOT NULL,
`fecha_nacimiento_doctor` DATE NOT NULL,
`created_at` DATETIME NULL,
`update_at` DATETIME NULL,
`created_by` INT NULL,
`update_by` INT NULL,
`deleted` TINYINT NULL,
PRIMARY KEY (`rut_doctor`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`tratamiento_medico` (
`id_tratamiento_medico` INT NOT NULL AUTO_INCREMENT,
`created_at` DATETIME NULL,
`update_at` DATETIME NULL,
`created_by` INT NULL,
`update_by` INT NULL,
`deleted` TINYINT NULL,
`registro_personas_rut` VARCHAR(12) NOT NULL,
`registro_personas_usuario_id_usuario` INT NOT NULL,
`registro_doctor_rut_doctor` VARCHAR(12) NOT NULL,
PRIMARY KEY (`id_tratamiento_medico`),
INDEX `fk_tratamiento_medico_registro_personas1_idx` (`registro_personas_rut` ASC, `registro_personas_usuario_id_usuario` ASC) VISIBLE,
INDEX `fk_tratamiento_medico_registro_doctor1_idx` (`registro_doctor_rut_doctor` ASC) VISIBLE,
CONSTRAINT `fk_tratamiento_medico_registro_personas1`
    FOREIGN KEY (`registro_personas_rut` , `registro_personas_usuario_id_usuario`)
    REFERENCES `mydb`.`registro_personas` (`rut` , `usuario_id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT `fk_tratamiento_medico_registro_doctor1`
    FOREIGN KEY (`registro_doctor_rut_doctor`)
    REFERENCES `mydb`.`registro_doctor` (`rut_doctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`medicamentos` (
`id_medicamento` INT NOT NULL AUTO_INCREMENT,
`nombre_medicamento` VARCHAR(50) NOT NULL,
`descripcion_medicamento` VARCHAR(100) NOT NULL,
`dosis` VARCHAR(20) NOT NULL,
`created_at` DATETIME NULL,
`update_at` DATETIME NULL,
`created_by` INT NULL,
`update_by` INT NULL,
`deleted` TINYINT NULL,
`tratamiento_medico_id_tratamiento_medico` INT NOT NULL,
PRIMARY KEY (`id_medicamento`),
INDEX `fk_medicamentos_tratamiento_medico1_idx` (`tratamiento_medico_id_tratamiento_medico` ASC) VISIBLE,
CONSTRAINT `fk_medicamentos_tratamiento_medico1`
    FOREIGN KEY (`tratamiento_medico_id_tratamiento_medico`)
    REFERENCES `mydb`.`tratamiento_medico` (`id_tratamiento_medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`genero` (
`id_genero` INT NOT NULL AUTO_INCREMENT,
`nombre_genero` VARCHAR(45) NOT NULL,
`descripcion_genero` VARCHAR(100) NOT NULL,
`created_at` DATETIME NULL,
`update_at` DATETIME NULL,
`created_by` INT NULL,
`update_by` INT NULL,
`deleted` TINYINT NULL,
`registro_personas_rut` VARCHAR(12) NOT NULL,
`registro_personas_usuario_id_usuario` INT NOT NULL,
PRIMARY KEY (`id_genero`),
INDEX `fk_genero_registro_personas1_idx` (`registro_personas_rut` ASC, `registro_personas_usuario_id_usuario` ASC) VISIBLE,
UNIQUE INDEX `id_genero_UNIQUE` (`id_genero` ASC) VISIBLE,
CONSTRAINT `fk_genero_registro_personas1`
    FOREIGN KEY (`registro_personas_rut` , `registro_personas_usuario_id_usuario`)
    REFERENCES `mydb`.`registro_personas` (`rut` , `usuario_id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`chat` (
`id_chat` INT NOT NULL AUTO_INCREMENT,
`mensaje_doctor` LONGTEXT NOT NULL,
`mensaje_paciente` LONGTEXT NOT NULL,
`created_at` DATETIME NULL,
`update_at` DATETIME NULL,
`created_by` INT NULL,
`update_by` INT NULL,
`deleted` TINYINT NULL,
`usuario_id_usuario` INT NOT NULL,
`registro_doctor_rut_doctor` VARCHAR(12) NOT NULL,
PRIMARY KEY (`id_chat`),
INDEX `fk_chat_usuario1_idx` (`usuario_id_usuario` ASC) VISIBLE,
INDEX `fk_chat_registro_doctor1_idx` (`registro_doctor_rut_doctor` ASC) VISIBLE,
CONSTRAINT `fk_chat_usuario1`
    FOREIGN KEY (`usuario_id_usuario`)
    REFERENCES `mydb`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT `fk_chat_registro_doctor1`
    FOREIGN KEY (`registro_doctor_rut_doctor`)
    REFERENCES `mydb`.`registro_doctor` (`rut_doctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`sintomas` (
`id_sintomas` INT NOT NULL AUTO_INCREMENT,
`nombre_sintomas` VARCHAR(50) NOT NULL,
`descripcion_sintomas` VARCHAR(200) NOT NULL,
`created_at` DATETIME NULL,
`update_at` DATETIME NULL,
`created_by` INT NULL,
`update_by` INT NULL,
`deleted` TINYINT NULL,
`estado_paciente_id_estado_paciente` INT NOT NULL,
PRIMARY KEY (`id_sintomas`),
INDEX `fk_sintomas_estado_paciente1_idx` (`estado_paciente_id_estado_paciente` ASC) VISIBLE,
CONSTRAINT `fk_sintomas_estado_paciente1`
    FOREIGN KEY (`estado_paciente_id_estado_paciente`)
    REFERENCES `mydb`.`estado_paciente` (`id_estado_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

ALTER TABLE `mydb`.`tipo_usuario`
ADD CONSTRAINT `chk_nombre_tipo_not_empty` CHECK (LENGTH(`nombre_tipo`) > 0),
ADD CONSTRAINT `chk_descripcion_tipo_not_empty` CHECK (LENGTH(`descripcion_tipo`) > 0),
ADD CONSTRAINT `chk_tipo_usuario_deleted_bool` CHECK (`deleted` IN (0, 1) OR `deleted` IS NULL);

ALTER TABLE `mydb`.`usuario`
ADD CONSTRAINT `chk_nombre_usuario_not_empty` CHECK (LENGTH(`nombre_usuario`) > 0),
ADD CONSTRAINT `chk_password_not_empty` CHECK (LENGTH(`password`) > 0),
ADD CONSTRAINT `chk_usuario_deleted_bool` CHECK (`deleted` IN (0, 1) OR `deleted` IS NULL);

ALTER TABLE `mydb`.`registro_personas`
ADD CONSTRAINT `chk_rut_format` CHECK (LENGTH(`rut`) BETWEEN 10 AND 12),
ADD CONSTRAINT `chk_email_format` CHECK (`email` LIKE '%@%.%'),
ADD CONSTRAINT `chk_registro_personas_deleted_bool` CHECK (`deleted` IN (0, 1) OR `deleted` IS NULL);

ALTER TABLE `mydb`.`estado_paciente`
ADD CONSTRAINT `chk_calificacion_range` CHECK (`calificacion` >= 0 AND `calificacion` <= 100),
ADD CONSTRAINT `chk_estado_paciente_deleted_bool` CHECK (`deleted` IN (0, 1) OR `deleted` IS NULL);

ALTER TABLE `mydb`.`registro_doctor`
ADD CONSTRAINT `chk_rut_doctor_format` CHECK (LENGTH(`rut_doctor`) BETWEEN 10 AND 12),
ADD CONSTRAINT `chk_nombre_doctor_not_empty` CHECK (LENGTH(`nombre_doctor`) > 0),
ADD CONSTRAINT `chk_fecha_nacimiento_past` CHECK (`fecha_nacimiento_doctor` < CURDATE()),
ADD CONSTRAINT `chk_registro_doctor_deleted_bool` CHECK (`deleted` IN (0, 1) OR `deleted` IS NULL);

ALTER TABLE `mydb`.`tratamiento_medico`
ADD CONSTRAINT `chk_tratamiento_medico_deleted_bool` CHECK (`deleted` IN (0, 1) OR `deleted` IS NULL);

ALTER TABLE `mydb`.`medicamentos`
ADD CONSTRAINT `chk_nombre_medicamento_not_empty` CHECK (LENGTH(`nombre_medicamento`) > 0),
ADD CONSTRAINT `chk_dosis_not_empty` CHECK (LENGTH(`dosis`) > 0),
ADD CONSTRAINT `chk_medicamentos_deleted_bool` CHECK (`deleted` IN (0, 1) OR `deleted` IS NULL);

ALTER TABLE `mydb`.`genero`
ADD CONSTRAINT `chk_nombre_genero_not_empty` CHECK (LENGTH(`nombre_genero`) > 0),
ADD CONSTRAINT `chk_genero_deleted_bool` CHECK (`deleted` IN (0, 1) OR `deleted` IS NULL);

ALTER TABLE `mydb`.`chat`
ADD CONSTRAINT `chk_mensaje_doctor_not_empty` CHECK (LENGTH(`mensaje_doctor`) > 0),
ADD CONSTRAINT `chk_mensaje_paciente_not_empty` CHECK (LENGTH(`mensaje_paciente`) > 0),
ADD CONSTRAINT `chk_chat_deleted_bool` CHECK (`deleted` IN (0, 1) OR `deleted` IS NULL);

ALTER TABLE `mydb`.`sintomas`
ADD CONSTRAINT `chk_nombre_sintomas_not_empty` CHECK (LENGTH(`nombre_sintomas`) > 0),
ADD CONSTRAINT `chk_sintomas_deleted_bool` CHECK (`deleted` IN (0, 1) OR `deleted` IS NULL);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;