-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema start4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema start4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `start4` DEFAULT CHARACTER SET utf8 ;
USE `start4` ;

-- -----------------------------------------------------
-- Table `start4`.`Taxa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `start4`.`Taxa` (
  `UF` CHAR(2) NOT NULL,
  `Valor` DECIMAL(10,3) NOT NULL,
  PRIMARY KEY (`UF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `start4`.`Eletronicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `start4`.`Eletronicos` (
  `idEletronico` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NOT NULL,
  `Potencia` INT(10) NOT NULL,
  PRIMARY KEY (`idEletronico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `start4`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `start4`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `start4`.`CalEnergia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `start4`.`CalEnergia` (
  `idEnergia` INT NOT NULL AUTO_INCREMENT,
  `tempo` INT NOT NULL,
  `qtdDias` INT NOT NULL,
  `UF_FK` CHAR(2) NOT NULL,
  `idEletronico_FK` INT NOT NULL,
  `idUsuario_FK` INT NOT NULL,
  PRIMARY KEY (`idEnergia`),
  INDEX `fk_CalEnergia_Taxa1_idx` (`UF_FK` ASC) VISIBLE,
  INDEX `fk_CalEnergia_Eletronicos1_idx` (`idEletronico_FK` ASC) VISIBLE,
  INDEX `fk_CalEnergia_Usuario1_idx` (`idUsuario_FK` ASC) VISIBLE,
  CONSTRAINT `fk_CalEnergia_Taxa1`
    FOREIGN KEY (`UF_FK`)
    REFERENCES `start4`.`Taxa` (`UF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CalEnergia_Eletronicos1`
    FOREIGN KEY (`idEletronico_FK`)
    REFERENCES `start4`.`Eletronicos` (`idEletronico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CalEnergia_Usuario1`
    FOREIGN KEY (`idUsuario_FK`)
    REFERENCES `start4`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `start4`.`CalImc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `start4`.`CalImc` (
  `idIMC` INT NOT NULL AUTO_INCREMENT,
  `sexo` CHAR(1) NOT NULL,
  `peso` DECIMAL(4,2) NOT NULL,
  `altura` DECIMAL(4,2) NOT NULL,
  `idUsuario_FK` INT NOT NULL,
  PRIMARY KEY (`idIMC`),
  INDEX `fk_CalImc_Usuario1_idx` (`idUsuario_FK` ASC) VISIBLE,
  CONSTRAINT `fk_CalImc_Usuario1`
    FOREIGN KEY (`idUsuario_FK`)
    REFERENCES `start4`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `start4`.`MET`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `start4`.`MET` (
  `idMET` INT NOT NULL AUTO_INCREMENT,
  `NomeExercicio` VARCHAR(45) NOT NULL,
  `MET` DOUBLE(4,2) NOT NULL,
  PRIMARY KEY (`idMET`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `start4`.`CalAtividadeFisica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `start4`.`CalAtividadeFisica` (
  `idAtividadeFisica` INT NOT NULL AUTO_INCREMENT,
  `tempo` INT NOT NULL,
  `idIMC_FK` INT NOT NULL,
  `idMET_FK` INT NOT NULL,
  PRIMARY KEY (`idAtividadeFisica`),
  INDEX `fk_CalAtividadeFisica_CalImc1_idx` (`idIMC_FK` ASC) VISIBLE,
  INDEX `fk_CalAtividadeFisica_MET1_idx` (`idMET_FK` ASC) VISIBLE,
  CONSTRAINT `fk_CalAtividadeFisica_CalImc1`
    FOREIGN KEY (`idIMC_FK`)
    REFERENCES `start4`.`CalImc` (`idIMC`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CalAtividadeFisica_MET1`
    FOREIGN KEY (`idMET_FK`)
    REFERENCES `start4`.`MET` (`idMET`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
