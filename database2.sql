-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema student
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema student
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `student` DEFAULT CHARACTER SET utf8 ;
USE `student` ;

-- -----------------------------------------------------
-- Table `student`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student`.`users` (
  `Full_Name` VARCHAR(30) NULL,
  `Mobile` VARCHAR(10) NULL,
  `UserID` VARCHAR(30) NOT NULL,
  `Password` VARCHAR(15) NULL,
  `Sec_Quest` VARCHAR(45) NULL,
  `Sec_Ans` VARCHAR(45) NULL,
  `AadharID` VARCHAR(12) NOT NULL,
  `WalletBalance` DECIMAL(10,2) NULL,
  `Profile_Image` LONGBLOB NULL,
  PRIMARY KEY (`UserID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student`.`rent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student`.`rent` (
  `UserID` VARCHAR(45) NOT NULL,
  `RentalID` INT(6) NOT NULL,
  `Instrument_Name` VARCHAR(45) NULL,
  `Quantity` INT(2) NULL,
  `Hire_Date` VARCHAR(45) NULL,
  `Due_Date` VARCHAR(45) NULL,
  `Total_Pay` DECIMAL(8,2) NULL,
  `Advance_Pay` DECIMAL(8,2) NULL,
  `Due_Pay` DECIMAL(8,2) NULL,
  `DeliveryAddress` VARCHAR(150) NULL,
  `Status` VARCHAR(15) NULL,
  `` VARCHAR(45) NULL,
  PRIMARY KEY (`RentalID`),
  CONSTRAINT `UserID`
    FOREIGN KEY ()
    REFERENCES `student`.`users` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student`.`user_ratings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student`.`user_ratings` (
  `UserID` VARCHAR(30) NOT NULL,
  `Instrument_Name` VARCHAR(45) NOT NULL,
  `review` VARCHAR(150) NULL,
  `rate` INT(1) NULL,
  PRIMARY KEY (`UserID`, `Instrument_Name`),
  CONSTRAINT `UserID`
    FOREIGN KEY ()
    REFERENCES `student`.`users` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student`.`favorite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student`.`favorite` (
  `UserID` VARCHAR(30) NOT NULL,
  `Instrumental_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`UserID`, `Instrumental_Name`),
  CONSTRAINT `UserID`
    FOREIGN KEY ()
    REFERENCES `student`.`users` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student`.`stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student`.`stock` (
  `Instrumental_Name` VARCHAR(40) NOT NULL,
  `In_Stock` INT(6) NULL,
  `Avail_Status` VARCHAR(15) NULL,
  PRIMARY KEY (`Instrumental_Name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student`.`instruments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student`.`instruments` (
  `sI` INT(11) NOT NULL,
  `Instrument_Name` VARCHAR(45) NOT NULL,
  `Instrument_Category` VARCHAR(30) NULL,
  `Instrument_Descr` VARCHAR(255) NULL,
  `Per_Day_Fare` DOUBLE(10,2) NULL,
  `Advance_Amt` DOUBLE(10,2) NULL,
  `AvailQuantity` INT(3) NULL,
  `Image1` LONGBLOB NULL,
  `Image2` LONGBLOB NULL,
  `discount` INT(3) NULL,
  `instrumentscol` VARCHAR(45) NULL,
  PRIMARY KEY (`sI`, `Instrument_Name`),
  CONSTRAINT `Instrument_Name`
    FOREIGN KEY ()
    REFERENCES `student`.`user_ratings` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Instrument_Name`
    FOREIGN KEY ()
    REFERENCES `student`.`favorite` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Instrument_Name`
    FOREIGN KEY ()
    REFERENCES `student`.`stock` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
