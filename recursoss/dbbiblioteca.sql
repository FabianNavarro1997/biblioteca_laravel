-- MySQL Script generated by MySQL Workbench
-- Mon Dec  2 20:59:26 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema laravel
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema laravel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `laravel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `laravel` ;

-- -----------------------------------------------------
-- Table `laravel`.`libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`libro` (
  `id` INT(5) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NULL DEFAULT NULL,
  `isbn` VARCHAR(30) NULL DEFAULT NULL,
  `autor` VARCHAR(100) NULL DEFAULT NULL,
  `cantidad` TINYINT(2) NULL DEFAULT NULL,
  `editorial` VARCHAR(50) NULL DEFAULT NULL,
  `foto` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `laravel`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`usuario` (
  `id` INT(5) NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(50) NULL DEFAULT NULL,
  `password` VARCHAR(100) NULL DEFAULT NULL,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `laravel`.`libro_prestamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`libro_prestamo` (
  `id` INT(5) NOT NULL AUTO_INCREMENT,
  `usuario_id` INT(5) NULL DEFAULT NULL,
  `libro_id` INT(5) NULL DEFAULT NULL,
  `fecha_prestamo` DATE NULL DEFAULT NULL,
  `prestado_a` VARCHAR(100) NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT NULL,
  `fecha_devolucion` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `usuario_id` (`usuario_id` ASC) VISIBLE,
  INDEX `libro_id` (`libro_id` ASC) VISIBLE,
  CONSTRAINT `libro_prestamo_ibfk_1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `laravel`.`usuario` (`id`),
  CONSTRAINT `libro_prestamo_ibfk_2`
    FOREIGN KEY (`libro_id`)
    REFERENCES `laravel`.`libro` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `laravel`.`permiso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`permiso` (
  `id` INT(5) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `slug` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `laravel`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`rol` (
  `id` INT(5) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `laravel`.`permiso_rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`permiso_rol` (
  `id` INT(5) NOT NULL AUTO_INCREMENT,
  `rol_id` INT(5) NULL DEFAULT NULL,
  `permiso_id` INT(5) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `rol_id` (`rol_id` ASC) VISIBLE,
  INDEX `permiso_id` (`permiso_id` ASC) VISIBLE,
  CONSTRAINT `permiso_rol_ibfk_1`
    FOREIGN KEY (`rol_id`)
    REFERENCES `laravel`.`rol` (`id`),
  CONSTRAINT `permiso_rol_ibfk_2`
    FOREIGN KEY (`permiso_id`)
    REFERENCES `laravel`.`permiso` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `laravel`.`usuario_rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`usuario_rol` (
  `id` INT(5) NOT NULL AUTO_INCREMENT,
  `rol_id` INT(5) NULL DEFAULT NULL,
  `usuario_id` INT(5) NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `rol_id` (`rol_id` ASC) VISIBLE,
  INDEX `usuario_id` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `usuario_rol_ibfk_1`
    FOREIGN KEY (`rol_id`)
    REFERENCES `laravel`.`rol` (`id`),
  CONSTRAINT `usuario_rol_ibfk_2`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `laravel`.`usuario` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;