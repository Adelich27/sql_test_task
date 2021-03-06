-- MySQL Script generated by MySQL Workbench
-- Sat Mar 26 23:32:09 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema test_task
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema test_task
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `test_task` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci ;
USE `test_task` ;

-- -----------------------------------------------------
-- Table `test_task`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test_task`.`person` (
  `person_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` TEXT(20) NOT NULL,
  `last_name` TEXT(20) NOT NULL,
  `father_name` TEXT(20) NOT NULL,
  `phone` TEXT(10) NOT NULL,
  `additional_phone` TEXT(10) NULL,
  `email` TEXT(20) NOT NULL,
  `application_parameters_application_id` INT NOT NULL,
  `passport_person_passport_person_id` INT NOT NULL,
  PRIMARY KEY (`person_id`, `application_parameters_application_id`, `passport_person_passport_person_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test_task`.`application_parameters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test_task`.`application_parameters` (
  `application_id` INT NOT NULL AUTO_INCREMENT,
  `product_type` TEXT(40) NOT NULL,
  `loan_purpose` TEXT(40) NOT NULL,
  `sum` DECIMAL(15,2) NOT NULL,
  `lending_rate` DOUBLE(5,2) NOT NULL,
  `additional_services` TINYINT(1) NOT NULL,
  `credit_term` INT(3) NOT NULL,
  `sum_total` DECIMAL(10,2) NOT NULL,
  `application_date` DATE NOT NULL,
  `person_person_id` INT NOT NULL,
  `person_application_parameters_application_id` INT NOT NULL,
  `person_passport_person_passport_person_id` INT NOT NULL,
  PRIMARY KEY (`application_id`, `person_person_id`, `person_application_parameters_application_id`, `person_passport_person_passport_person_id`),
  INDEX `fk_application_parameters_person1_idx` (`person_person_id` ASC, `person_application_parameters_application_id` ASC, `person_passport_person_passport_person_id` ASC) VISIBLE,
  CONSTRAINT `fk_application_parameters_person1`
    FOREIGN KEY (`person_person_id` , `person_application_parameters_application_id` , `person_passport_person_passport_person_id`)
    REFERENCES `test_task`.`person` (`person_id` , `application_parameters_application_id` , `passport_person_passport_person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test_task`.`passport_person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test_task`.`passport_person` (
  `serial` INT(4) NOT NULL,
  `nubmer` INT(6) NOT NULL,
  `issue_date` DATE NOT NULL,
  `department_code` INT(6) NOT NULL,
  `issued_by` TEXT(50) NOT NULL,
  `date_of_birthday` DATE NOT NULL,
  `place_of_birth` TEXT(20) NOT NULL,
  `place_of_registration` TEXT(40) NOT NULL,
  `person_person_id` INT NOT NULL,
  `person_application_parameters_application_id` INT NOT NULL,
  `person_passport_person_passport_person_id` INT NOT NULL,
  PRIMARY KEY (`person_person_id`, `person_application_parameters_application_id`, `person_passport_person_passport_person_id`),
  INDEX `fk_passport_person_person1_idx` (`person_person_id` ASC, `person_application_parameters_application_id` ASC, `person_passport_person_passport_person_id` ASC) VISIBLE,
  CONSTRAINT `fk_passport_person_person1`
    FOREIGN KEY (`person_person_id` , `person_application_parameters_application_id` , `person_passport_person_passport_person_id`)
    REFERENCES `test_task`.`person` (`person_id` , `application_parameters_application_id` , `passport_person_passport_person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test_task`.`work_person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test_task`.`work_person` (
  `region_of_work` TEXT(40) NOT NULL,
  `name_organization` TEXT(30) NOT NULL,
  `inn` TEXT(12) NOT NULL,
  `position` TEXT(20) NOT NULL,
  `salary` DECIMAL(10,2) NOT NULL,
  `work_start_date` DATE NOT NULL,
  `passport_person_person_person_id` INT NOT NULL,
  `passport_person_person_application_parameters_application_id` INT NOT NULL,
  `passport_person_person_passport_person_passport_person_id` INT NOT NULL,
  PRIMARY KEY (`passport_person_person_person_id`, `passport_person_person_application_parameters_application_id`, `passport_person_person_passport_person_passport_person_id`),
  INDEX `fk_work_person_passport_person1_idx` (`passport_person_person_person_id` ASC, `passport_person_person_application_parameters_application_id` ASC, `passport_person_person_passport_person_passport_person_id` ASC) VISIBLE,
  CONSTRAINT `fk_work_person_passport_person1`
    FOREIGN KEY (`passport_person_person_person_id` , `passport_person_person_application_parameters_application_id` , `passport_person_person_passport_person_passport_person_id`)
    REFERENCES `test_task`.`passport_person` (`person_person_id` , `person_application_parameters_application_id` , `person_passport_person_passport_person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test_task`.`additional_services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test_task`.`additional_services` (
  `additional_services_id` INT NOT NULL AUTO_INCREMENT,
  `service_name` TEXT(50) NOT NULL,
  `sum` DECIMAL(10,2) NOT NULL,
  `application_parameters_application_id` INT NOT NULL,
  PRIMARY KEY (`additional_services_id`, `application_parameters_application_id`),
  INDEX `fk_additional_services_application_parameters1_idx` (`application_parameters_application_id` ASC) VISIBLE,
  CONSTRAINT `fk_additional_services_application_parameters1`
    FOREIGN KEY (`application_parameters_application_id`)
    REFERENCES `test_task`.`application_parameters` (`application_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
