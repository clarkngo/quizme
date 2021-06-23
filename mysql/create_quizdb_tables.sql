-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema quizdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema quizdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `quizdb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema graduationdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema graduationdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `graduationdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `quizdb` ;

-- -----------------------------------------------------
-- Table `quizdb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quizdb`.`user` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quizdb`.`quiztype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quizdb`.`quiztype` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Description` VARCHAR(45) NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quizdb`.`submission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quizdb`.`submission` (
  `Id` INT NOT NULL,
  `Fk_UserId_Submission` INT NULL,
  `Fk_QuizTypeId_Submission` INT NULL,
  `Pass` TINYINT(1) NULL,
  PRIMARY KEY (`Id`),
  INDEX `QuizTypeId_idx` (`Fk_QuizTypeId_Submission` ASC) VISIBLE,
  INDEX `Fk_UserId_Submission_idx` (`Fk_UserId_Submission` ASC) VISIBLE,
  CONSTRAINT `Fk_UserId_Submission`
    FOREIGN KEY (`Fk_UserId_Submission`)
    REFERENCES `quizdb`.`submission` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Fk_QuizTypeId_Submission`
    FOREIGN KEY (`Fk_QuizTypeId_Submission`)
    REFERENCES `quizdb`.`quiztype` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quizdb`.`question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quizdb`.`question` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Fk_QuizTypeId_Question` INT NULL,
  `Description` TINYTEXT NULL,
  PRIMARY KEY (`Id`),
  INDEX `QuizTypeId_idx` (`Fk_QuizTypeId_Question` ASC) VISIBLE,
  CONSTRAINT `QuizTypeId`
    FOREIGN KEY (`Fk_QuizTypeId_Question`)
    REFERENCES `quizdb`.`quiztype` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quizdb`.`choice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quizdb`.`choice` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Fk_QuestionId_Choice` INT NULL,
  `Description` TINYTEXT NULL,
  `IsAnswer` TINYINT(1) NULL,
  PRIMARY KEY (`Id`),
  INDEX `Fk_QuestionId_Choice_idx` (`Fk_QuestionId_Choice` ASC) VISIBLE,
  CONSTRAINT `Fk_QuestionId_Choice`
    FOREIGN KEY (`Fk_QuestionId_Choice`)
    REFERENCES `quizdb`.`question` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quizdb`.`feedback`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quizdb`.`feedback` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Fk_QuizTypeId_Feedback` INT NULL,
  `Rating` INT NULL,
  `Description` VARCHAR(45) NULL,
  PRIMARY KEY (`Id`),
  INDEX `QuizTypeId_idx` (`Fk_QuizTypeId_Feedback` ASC) VISIBLE,
  CONSTRAINT `Fk_QuizTypeId_Feedback`
    FOREIGN KEY (`Fk_QuizTypeId_Feedback`)
    REFERENCES `quizdb`.`quiztype` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quizdb`.`result`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quizdb`.`result` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Fk_UserId_Result` INT NULL,
  `Fk_QuizTypeId_Result` INT NULL,
  `Fk_QuestionId_Result` INT NULL,
  `Fk_ChoiceId_Result` INT NULL,
  `selAnswer` TINYINT(1) NULL,
  `isAnswer` TINYINT(1) NULL,
  PRIMARY KEY (`Id`),
  INDEX `ChoiceId_idx` (`Fk_ChoiceId_Result` ASC) VISIBLE,
  INDEX `Fk_UserId_Result_idx` (`Fk_UserId_Result` ASC) VISIBLE,
  INDEX `Fk_QuizTypeId_Result_idx` (`Fk_QuizTypeId_Result` ASC) VISIBLE,
  INDEX `Fk_QuestionId_Result_idx` (`Fk_QuestionId_Result` ASC) VISIBLE,
  CONSTRAINT `Fk_UserId_Result`
    FOREIGN KEY (`Fk_UserId_Result`)
    REFERENCES `quizdb`.`user` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Fk_QuizTypeId_Result`
    FOREIGN KEY (`Fk_QuizTypeId_Result`)
    REFERENCES `quizdb`.`quiztype` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Fk_QuestionId_Result`
    FOREIGN KEY (`Fk_QuestionId_Result`)
    REFERENCES `quizdb`.`question` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Fk_ChoiceId_Result`
    FOREIGN KEY (`Fk_ChoiceId_Result`)
    REFERENCES `quizdb`.`choice` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
