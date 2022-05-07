-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema shashish_online_book_store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema shashish_online_book_store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `shashish_online_book_store` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `shashish_online_book_store` ;

-- -----------------------------------------------------
-- Table `shashish_online_book_store`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shashish_online_book_store`.`orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(45) NOT NULL,
  `total` DOUBLE NOT NULL,
  `datetime` DATETIME NOT NULL,
  PRIMARY KEY (`order_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `shashish_online_book_store`.`uom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shashish_online_book_store`.`uom` (
  `uom_id` INT NOT NULL AUTO_INCREMENT,
  `uom_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`uom_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `shashish_online_book_store`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shashish_online_book_store`.`products` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `uom_id` INT NOT NULL,
  `price_per_unit` DOUBLE NOT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `fk_uom_id_idx` (`uom_id` ASC) VISIBLE,
  CONSTRAINT `fk_uom_id`
    FOREIGN KEY (`uom_id`)
    REFERENCES `shashish_online_book_store`.`uom` (`uom_id`)
    ON UPDATE RESTRICT)
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `shashish_online_book_store`.`order_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shashish_online_book_store`.`order_details` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NOT NULL,
  `quantity` DOUBLE NOT NULL,
  `total_price` DOUBLE NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_product_id_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `shashish_online_book_store`.`orders` (`order_id`)
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `shashish_online_book_store`.`products` (`product_id`)
    ON UPDATE RESTRICT)
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `shashish_online_book_store`.`uom` (`uom_id`, `uom_name`) VALUES ('1', 'Fiction');
INSERT INTO `shashish_online_book_store`.`uom` (`uom_id`, `uom_name`) VALUES ('2', 'Non-Fiction');
INSERT INTO `shashish_online_book_store`.`products` (`product_id`, `name`, `uom_id`, `price_per_unit`) VALUES ('1', 'Data Base Management', '2', '330');
INSERT INTO `shashish_online_book_store`.`products` (`product_id`, `name`, `uom_id`, `price_per_unit`) VALUES ('2', 'Intro to Stats', '2', '300');
INSERT INTO `shashish_online_book_store`.`products` (`product_id`, `name`, `uom_id`, `price_per_unit`) VALUES ('3', 'Linear Algebre', '2', '440');
INSERT INTO `shashish_online_book_store`.`products` (`product_id`, `name`, `uom_id`, `price_per_unit`) VALUES ('4', 'Kite Runner', '1', '220');
INSERT INTO `shashish_online_book_store`.`products` (`product_id`, `name`, `uom_id`, `price_per_unit`) VALUES ('5', 'Alchemist', '1', '240');

