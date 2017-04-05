-- MySQL Script generated by MySQL Workbench
-- Wed Apr  5 16:00:28 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sqlprime` DEFAULT CHARACTER SET utf8 ;
USE `sqlprime` ;

-- -----------------------------------------------------
-- Table `sqlprime`.`captation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlprime`.`captation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlprime`.`banks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlprime`.`banks` (
  `id` VARCHAR(10) NOT NULL,
  `name` VARCHAR(150) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlprime`.` proType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlprime`.` proType` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(50) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlprime`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlprime`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idNerus` INT NULL,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `remember_token` VARCHAR(100) NULL,
  `profilePhoto` VARCHAR(200) NULL,
  `permission` INT(2) NOT NULL DEFAULT 1,
  `type` INT(2) NULL,
  `cpf` VARCHAR(11) NULL,
  `rg` VARCHAR(18) NULL,
  `nickname` VARCHAR(20) NULL,
  `emailRt` VARCHAR(100) NULL,
  `cep` INT(8) NULL,
  `street` VARCHAR(150) NULL,
  `number` VARCHAR(20) NULL,
  `complement` VARCHAR(45) NULL,
  `nei` VARCHAR(50) NULL,
  `city` VARCHAR(50) NULL,
  `uf` CHAR(2) NULL,
  `formation` VARCHAR(50) NULL,
  `entityClass` VARCHAR(100) NULL,
  `numberRegister` VARCHAR(50) NULL,
  `phone` VARCHAR(14) NULL,
  `commercialPhone` VARCHAR(14) NULL,
  `cellPhone` VARCHAR(14) NULL,
  `empno` INT NULL,
  `birthday` DATE NULL,
  `banks_id` VARCHAR(10) NULL,
  `ag` VARCHAR(10) NULL,
  `account` VARCHAR(20) NULL,
  `accountType` VARCHAR(20) NULL,
  `commission` INT NULL,
  `cnpj` VARCHAR(14) NULL,
  `companyName` VARCHAR(255) NULL,
  `fantasyName` VARCHAR(255) NULL,
  `facebook` VARCHAR(150) NULL,
  `instagram` VARCHAR(150) NULL,
  `site` VARCHAR(255) NULL,
  `professionalInFocus` VARCHAR(255) NULL,
  ` proType_id` INT NULL,
  `note` LONGTEXT NULL,
  `faculty` VARCHAR(100) NULL,
  `period` VARCHAR(20) NULL,
  `teacher` VARCHAR(100) NULL,
  `course` VARCHAR(100) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  `captation_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_captation1_idx` (`captation_id` ASC),
  INDEX `fk_users_banks1_idx` (`banks_id` ASC),
  INDEX `fk_users_ proType1_idx` (` proType_id` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `idNerus_UNIQUE` (`idNerus` ASC),
  CONSTRAINT `fk_users_captation1`
    FOREIGN KEY (`captation_id`)
    REFERENCES `sqlprime`.`captation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_banks1`
    FOREIGN KEY (`banks_id`)
    REFERENCES `sqlprime`.`banks` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_ proType1`
    FOREIGN KEY (` proType_id`)
    REFERENCES `sqlprime`.` proType` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlprime`.`partner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlprime`.`partner` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `users_id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `birthday` DATE NULL,
  `email` VARCHAR(255) NULL,
  `cpf` VARCHAR(11) NULL,
  `rg` VARCHAR(18) NULL,
  `phone` VARCHAR(14) NULL,
  `cellPhone` VARCHAR(14) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`, `users_id`),
  INDEX `fk_partner_users1_idx` (`users_id` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  CONSTRAINT `fk_partner_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `sqlprime`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlprime`.`team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlprime`.`team` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `users_id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `birthday` DATE NULL,
  `email` VARCHAR(255) NULL,
  `phone` VARCHAR(14) NULL,
  `cellPhone` VARCHAR(14) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`, `users_id`),
  INDEX `fk_team_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_team_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `sqlprime`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlprime`.`calendar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlprime`.`calendar` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NULL,
  `type` VARCHAR(45) NULL,
  `date` DATETIME NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlprime`.`events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlprime`.`events` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `users_id` INT NOT NULL,
  `calendar_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`, `users_id`, `calendar_id`),
  INDEX `fk_events_users1_idx` (`users_id` ASC),
  INDEX `fk_events_calendar1_idx` (`calendar_id` ASC),
  CONSTRAINT `fk_events_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `sqlprime`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_events_calendar1`
    FOREIGN KEY (`calendar_id`)
    REFERENCES `sqlprime`.`calendar` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlprime`.`competitor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlprime`.`competitor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlprime`.`competitorBuy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlprime`.`competitorBuy` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `users_id` INT NOT NULL,
  `competitor_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`, `users_id`, `competitor_id`),
  INDEX `fk_competitorBuy_users1_idx` (`users_id` ASC),
  INDEX `fk_competitorBuy_competitor1_idx` (`competitor_id` ASC),
  CONSTRAINT `fk_competitorBuy_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `sqlprime`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_competitorBuy_competitor1`
    FOREIGN KEY (`competitor_id`)
    REFERENCES `sqlprime`.`competitor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlprime`.`claims`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlprime`.`claims` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `users_id` INT NOT NULL,
  `description` VARCHAR(150) NULL,
  `text` VARCHAR(45) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`, `users_id`),
  INDEX `fk_claims_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_claims_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `sqlprime`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlprime`.`complaint`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlprime`.`complaint` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(50) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlprime`.`visits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlprime`.`visits` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `users_id` INT NOT NULL,
  `date` DATETIME NULL,
  `complaint_id` INT NOT NULL,
  `feedback` LONGTEXT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`, `users_id`, `complaint_id`),
  INDEX `fk_visits_users1_idx` (`users_id` ASC),
  INDEX `fk_visits_complaint1_idx` (`complaint_id` ASC),
  CONSTRAINT `fk_visits_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `sqlprime`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_visits_complaint1`
    FOREIGN KEY (`complaint_id`)
    REFERENCES `sqlprime`.`complaint` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlprime`.`password_resets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlprime`.`password_resets` (
  `email` VARCHAR(255) NULL,
  `token` VARCHAR(255) NULL,
  `created_at` TIMESTAMP NULL)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
ALTER TABLE `password_resets` ADD INDEX(` email `);