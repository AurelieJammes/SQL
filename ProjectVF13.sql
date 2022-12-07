-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ProjectVF13
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ProjectVF13
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ProjectVF13` DEFAULT CHARACTER SET utf8 ;
USE `ProjectVF13` ;

-- -----------------------------------------------------
-- Table `ProjectVF13`.`Individual`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjectVF13`.`Individual` (
  `Id` INT NOT NULL,
  `Name` VARCHAR(25) NOT NULL,
  `Adress` VARCHAR(300) NOT NULL,
  `Profile_Picture` BLOB(55) NOT NULL,
  `Date_of_birth` DATETIME NOT NULL,
  `Role` VARCHAR(25) NOT NULL,
  `Salary` INT NOT NULL,
  `Gender` VARCHAR(25) NOT NULL,
  `Marital_status` VARCHAR(25) NOT NULL,
  `nb_of_children` INT NOT NULL,
  `Id_number` VARCHAR(100) NOT NULL,
  `Id_expiration_date` DATETIME NOT NULL,
  `driver_expiration_date` DATETIME NOT NULL,
  `driver_license` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjectVF13`.`Car`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjectVF13`.`Car` (
  `Id_License` VARCHAR(25) NOT NULL,
  `Individual_Id` INT NOT NULL,
  `Brand` VARCHAR(25) NOT NULL,
  `Plate` VARCHAR(25) NOT NULL,
  `VIN` VARCHAR(100) NOT NULL,
  `Year` YEAR NOT NULL,
  `Owner` VARCHAR(25) NOT NULL,
  `Nb_of_seats` INT NOT NULL,
  `Nb_of_doors` INT NOT NULL,
  `car_model` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`Id_License`),
  INDEX `fk_Car_Individual1_idx` (`Individual_Id` ASC) VISIBLE,
  UNIQUE INDEX `VIN_UNIQUE` (`VIN` ASC) VISIBLE,
  UNIQUE INDEX `Plate_UNIQUE` (`Plate` ASC) VISIBLE,
  UNIQUE INDEX `Id License_UNIQUE` (`Id_License` ASC) VISIBLE,
  UNIQUE INDEX `Owner_UNIQUE` (`Owner` ASC) VISIBLE,
  CONSTRAINT `fk_Car_Individual1`
    FOREIGN KEY (`Individual_Id`)
    REFERENCES `ProjectVF13`.`Individual` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjectVF13`.`Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjectVF13`.`Location` (
  `Id` VARCHAR(25) NOT NULL,
  `City` VARCHAR(25) NOT NULL,
  `Longitude` VARCHAR(25) NOT NULL,
  `Latitute` VARCHAR(25) NOT NULL,
  `Country` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjectVF13`.`Review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjectVF13`.`Review` (
  `ID` VARCHAR(55) NOT NULL,
  `Comment` VARCHAR(55) NOT NULL,
  `Rating` INT NOT NULL,
  `Date` DATETIME NOT NULL,
  `Car_price` INT NOT NULL,
  `borrowing_period` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjectVF13`.`Borrow`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjectVF13`.`Borrow` (
  `Individual_Id` INT NOT NULL,
  `Location_Id` VARCHAR(25) NOT NULL,
  `Review_ID` VARCHAR(55) NOT NULL,
  `Borrow_Id` VARCHAR(45) NOT NULL,
  `Car_Id_License1` VARCHAR(25) NOT NULL,
  INDEX `fk_Borrow_Individual1_idx` (`Individual_Id` ASC) VISIBLE,
  INDEX `fk_Borrow_Location1_idx` (`Location_Id` ASC) VISIBLE,
  INDEX `fk_Borrow_Review1_idx` (`Review_ID` ASC) VISIBLE,
  PRIMARY KEY (`Borrow_Id`),
  UNIQUE INDEX `Borrow_Id_UNIQUE` (`Borrow_Id` ASC) VISIBLE,
  INDEX `fk_Borrow_Car1_idx` (`Car_Id_License1` ASC) VISIBLE,
  CONSTRAINT `fk_Borrow_Individual1`
    FOREIGN KEY (`Individual_Id`)
    REFERENCES `ProjectVF13`.`Individual` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Borrow_Location1`
    FOREIGN KEY (`Location_Id`)
    REFERENCES `ProjectVF13`.`Location` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Borrow_Review1`
    FOREIGN KEY (`Review_ID`)
    REFERENCES `ProjectVF13`.`Review` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Borrow_Car1`
    FOREIGN KEY (`Car_Id_License1`)
    REFERENCES `ProjectVF13`.`Car` (`Id_License`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `ProjectVF13`.`Individual`
-- -----------------------------------------------------
START TRANSACTION;
USE `ProjectVF13`;
INSERT INTO `ProjectVF13`.`Individual` (`Id`, `Name`, `Adress`, `Profile_Picture`, `Date_of_birth`, `Role`, `Salary`, `Gender`, `Marital_status`, `nb_of_children`, `Id_number`, `Id_expiration_date`, `driver_expiration_date`, `driver_license`) VALUES (01, 'Aurélie Jammes', 'Paris', 0x24496E646976696475616C5B5D203D205B0A20202020202020202020202020202750726F66696C65207069637475726527203D3E2066696C655F6765745F636F6E74656E7473282268747470733A2F2F692E696D6775722E636F6D2F555963486B4B442E706E672220290A20202020202020202020202020205D3B, '1999-08-24', 'Data Scientist', 3000, 'Women', 'Single', 2, '324567815432', '2023-09-17', '2027-09-15', 'S-514-778-616-977');
INSERT INTO `ProjectVF13`.`Individual` (`Id`, `Name`, `Adress`, `Profile_Picture`, `Date_of_birth`, `Role`, `Salary`, `Gender`, `Marital_status`, `nb_of_children`, `Id_number`, `Id_expiration_date`, `driver_expiration_date`, `driver_license`) VALUES (02, 'Emma Adenis', 'Toulouse', 0x24496E646976696475616C5B5D203D205B0A20202020202020202020202020202750726F66696C65207069637475726527203D3E2066696C655F6765745F636F6E74656E7473282268747470733A2F2F692E696D6775722E636F6D2F555963486B4B442E706E672220290A20202020202020202020202020205D3B, '2003-07-11', 'Student', 0, 'Women', 'Married', 2, '987476365481', '2025-09-18', '2027-11-16', 'A-514-986-616-543');
INSERT INTO `ProjectVF13`.`Individual` (`Id`, `Name`, `Adress`, `Profile_Picture`, `Date_of_birth`, `Role`, `Salary`, `Gender`, `Marital_status`, `nb_of_children`, `Id_number`, `Id_expiration_date`, `driver_expiration_date`, `driver_license`) VALUES (03, 'Pascale Charil', 'Lille', 0x24496E646976696475616C5B5D203D205B0A20202020202020202020202020202750726F66696C65207069637475726527203D3E2066696C655F6765745F636F6E74656E7473282268747470733A2F2F692E696D6775722E636F6D2F555963486B4B442E706E672220290A20202020202020202020202020205D3B, '1967-05-01', 'Shopkeeper', 1200, 'Women', 'Married', 2, '093756231463', '2022-12-08', '2028-12-29', 'J-953-268-616-021');
INSERT INTO `ProjectVF13`.`Individual` (`Id`, `Name`, `Adress`, `Profile_Picture`, `Date_of_birth`, `Role`, `Salary`, `Gender`, `Marital_status`, `nb_of_children`, `Id_number`, `Id_expiration_date`, `driver_expiration_date`, `driver_license`) VALUES (04, 'Alain Jammes', 'Paris', 0x24496E646976696475616C5B5D203D205B0A20202020202020202020202020202750726F66696C65207069637475726527203D3E2066696C655F6765745F636F6E74656E7473282268747470733A2F2F692E696D6775722E636F6D2F555963486B4B442E706E672220290A20202020202020202020202020205D3B, '1965-09-13', 'Chief', 1500, 'Men', 'Married', 2, '123986409376', '2024-06-12', '2026-04-13', 'I-135-778-853-093');
INSERT INTO `ProjectVF13`.`Individual` (`Id`, `Name`, `Adress`, `Profile_Picture`, `Date_of_birth`, `Role`, `Salary`, `Gender`, `Marital_status`, `nb_of_children`, `Id_number`, `Id_expiration_date`, `driver_expiration_date`, `driver_license`) VALUES (05, 'Enzo Chacon', 'Lyon', 0x24496E646976696475616C5B5D203D205B0A20202020202020202020202020202750726F66696C65207069637475726527203D3E2066696C655F6765745F636F6E74656E7473282268747470733A2F2F692E696D6775722E636F6D2F555963486B4B442E706E672220290A20202020202020202020202020205D3B, '2002-11-30', 'Student', 0, 'Men', 'Single', 4, '018397525397', '2024-01-28', '2027-09-16', 'K-084-137-616-074');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ProjectVF13`.`Car`
-- -----------------------------------------------------
START TRANSACTION;
USE `ProjectVF13`;
INSERT INTO `ProjectVF13`.`Car` (`Id_License`, `Individual_Id`, `Brand`, `Plate`, `VIN`, `Year`, `Owner`, `Nb_of_seats`, `Nb_of_doors`, `car_model`) VALUES ('A', 01, 'Toyota', 'AA-123-BB', '4Y1SL65848Z411439', 2018, 'Eric', 5, 4, 'yaris');
INSERT INTO `ProjectVF13`.`Car` (`Id_License`, `Individual_Id`, `Brand`, `Plate`, `VIN`, `Year`, `Owner`, `Nb_of_seats`, `Nb_of_doors`, `car_model`) VALUES ('B', 03, 'Ferrari', 'BB-456-CC', '9I1ML65848Z411439', 2020, 'William', 2, 2, 'Magnum');
INSERT INTO `ProjectVF13`.`Car` (`Id_License`, `Individual_Id`, `Brand`, `Plate`, `VIN`, `Year`, `Owner`, `Nb_of_seats`, `Nb_of_doors`, `car_model`) VALUES ('C', 04, 'Peugeot', 'CC-789-DD', '1Y1PL25948Z411439', 2005, 'Paul', 5, 4, '3008');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ProjectVF13`.`Location`
-- -----------------------------------------------------
START TRANSACTION;
USE `ProjectVF13`;
INSERT INTO `ProjectVF13`.`Location` (`Id`, `City`, `Longitude`, `Latitute`, `Country`) VALUES ('Pa', 'Paris', '14.5', '20.8', 'France');
INSERT INTO `ProjectVF13`.`Location` (`Id`, `City`, `Longitude`, `Latitute`, `Country`) VALUES ('NYC', 'New York', '46.8', '57.9', 'USA');
INSERT INTO `ProjectVF13`.`Location` (`Id`, `City`, `Longitude`, `Latitute`, `Country`) VALUES ('Ro', 'Rome', '80.9', '68.3', 'Italie');
INSERT INTO `ProjectVF13`.`Location` (`Id`, `City`, `Longitude`, `Latitute`, `Country`) VALUES ('Dxb', 'Dubai', '46.9', '38.5', 'EAU');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ProjectVF13`.`Review`
-- -----------------------------------------------------
START TRANSACTION;
USE `ProjectVF13`;
INSERT INTO `ProjectVF13`.`Review` (`ID`, `Comment`, `Rating`, `Date`, `Car_price`, `borrowing_period`) VALUES ('A1', 'TB', 5, '2022-12-21', 6000, 20);
INSERT INTO `ProjectVF13`.`Review` (`ID`, `Comment`, `Rating`, `Date`, `Car_price`, `borrowing_period`) VALUES ('B1', 'Perfect', 5, '2020-05-19', 300000, 52);
INSERT INTO `ProjectVF13`.`Review` (`ID`, `Comment`, `Rating`, `Date`, `Car_price`, `borrowing_period`) VALUES ('C1', 'RAS', 4, '2021-05-30', 4500, 10);
INSERT INTO `ProjectVF13`.`Review` (`ID`, `Comment`, `Rating`, `Date`, `Car_price`, `borrowing_period`) VALUES ('D1', 'Good', 3, '2022-11-24', 5000, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ProjectVF13`.`Borrow`
-- -----------------------------------------------------
START TRANSACTION;
USE `ProjectVF13`;
INSERT INTO `ProjectVF13`.`Borrow` (`Individual_Id`, `Location_Id`, `Review_ID`, `Borrow_Id`, `Car_Id_License1`) VALUES (05, 'Pa', 'A1', '1A', 'A');
INSERT INTO `ProjectVF13`.`Borrow` (`Individual_Id`, `Location_Id`, `Review_ID`, `Borrow_Id`, `Car_Id_License1`) VALUES (03, 'NYC', 'B1', '1B', 'B');
INSERT INTO `ProjectVF13`.`Borrow` (`Individual_Id`, `Location_Id`, `Review_ID`, `Borrow_Id`, `Car_Id_License1`) VALUES (02, 'Pa', 'B1', '1C', 'C');
INSERT INTO `ProjectVF13`.`Borrow` (`Individual_Id`, `Location_Id`, `Review_ID`, `Borrow_Id`, `Car_Id_License1`) VALUES (03, 'Ro', 'D1', '1D', 'B');
INSERT INTO `ProjectVF13`.`Borrow` (`Individual_Id`, `Location_Id`, `Review_ID`, `Borrow_Id`, `Car_Id_License1`) VALUES (01, 'Ro', 'A1', '1E', 'A');
INSERT INTO `ProjectVF13`.`Borrow` (`Individual_Id`, `Location_Id`, `Review_ID`, `Borrow_Id`, `Car_Id_License1`) VALUES (05, 'NYC', 'C1', 'B1', 'C');
INSERT INTO `ProjectVF13`.`Borrow` (`Individual_Id`, `Location_Id`, `Review_ID`, `Borrow_Id`, `Car_Id_License1`) VALUES (02, 'Pa', 'B1', 'B2', 'C');
INSERT INTO `ProjectVF13`.`Borrow` (`Individual_Id`, `Location_Id`, `Review_ID`, `Borrow_Id`, `Car_Id_License1`) VALUES (03, 'Dxb', 'B1', 'B3', 'B');
INSERT INTO `ProjectVF13`.`Borrow` (`Individual_Id`, `Location_Id`, `Review_ID`, `Borrow_Id`, `Car_Id_License1`) VALUES (01, 'Dxb', 'A1', 'B4', 'A');
INSERT INTO `ProjectVF13`.`Borrow` (`Individual_Id`, `Location_Id`, `Review_ID`, `Borrow_Id`, `Car_Id_License1`) VALUES (02, 'Ro', 'C1', 'B5', 'C');

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



-- Retrieve all individuals with the following attributes: id, name, ID number, ID expiration date, driver license, driver expiration date.
SELECT i.id, i.name, i.Id_number, i.Id_expiration_date, i.driver_license, i.driver_expiration_date
FROM individual i ;


-- Retrieve all individuals that are car owners with the following attributes: name, car license plate.
SELECT c.owner, c.Plate
FROM car c ;

-- Retrieve all individuals associated with an active car sharing as a user.
SELECT i.*
FROM individual i, borrow b
WHERE b.individual_id = i.id ;

-- Retrieve all reviews associated with a given car sharing user; 
-- the result shall display the following attributes: user name, pickup location, start date, end date, review score, review comment
SELECT i.Name, l.city, r.borrowing_period, r.rating, r.Comment
FROM  individual i,location l,review r, borrow b
WHERE i.id = b.Individual_Id AND l.id = b.Location_Id AND r.ID = b.Review_ID ;

-- Retrieve all individuals with expired ID card or expired driver licence.
SELECT i.*
FROM individual i
WHERE i.Id_expiration_date < '2022-12-06' OR i.driver_expiration_date < '2022-12-06';

-- Assuming that the access to certain pickup locations can be prohibited to old cars, 
-- provide a query that allows to retrieve all cars that are older than a given year
SELECT c.*
FROM car c
WHERE c.year > '2010' ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
