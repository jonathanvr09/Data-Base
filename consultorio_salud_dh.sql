-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema consultorio_dh
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema consultorio_dh
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `consultorio_dh` DEFAULT CHARACTER SET utf8 ;
USE `consultorio_dh` ;

-- -----------------------------------------------------
-- Table `consultorio_dh`.`Pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consultorio_dh`.`Pacientes` (
  `idPaciente` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `identificacion_salud` VARCHAR(45) NULL,
  PRIMARY KEY (`idPaciente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consultorio_dh`.`Medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consultorio_dh`.`Medico` (
  `idMedico` INT NOT NULL,
  `matricula` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` INT NULL,
  `especialidad` VARCHAR(45) NULL,
  PRIMARY KEY (`idMedico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consultorio_dh`.`Turno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consultorio_dh`.`Turno` (
  `idTurno` INT NOT NULL,
  `dia_hora` DATETIME NULL,
  `Pacientes_idPaciente` INT NOT NULL,
  `Medico_idMedico` INT NOT NULL,
  PRIMARY KEY (`idTurno`, `Pacientes_idPaciente`, `Medico_idMedico`),
  INDEX `fk_Turno_Pacientes1_idx` (`Pacientes_idPaciente` ASC) VISIBLE,
  INDEX `fk_Turno_Medico1_idx` (`Medico_idMedico` ASC) VISIBLE,
  CONSTRAINT `fk_Turno_Pacientes1`
    FOREIGN KEY (`Pacientes_idPaciente`)
    REFERENCES `consultorio_dh`.`Pacientes` (`idPaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Turno_Medico1`
    FOREIGN KEY (`Medico_idMedico`)
    REFERENCES `consultorio_dh`.`Medico` (`idMedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
