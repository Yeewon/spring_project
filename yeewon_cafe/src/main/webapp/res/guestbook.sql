use yeewonweb;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema yeewonweb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema yeewonweb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `yeewonweb` DEFAULT CHARACTER SET utf8 ;
USE `yeewonweb` ;


-- -----------------------------------------------------
-- Table `yeewonweb`.`guestbook`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yeewonweb`.`guestbook` ;

CREATE TABLE IF NOT EXISTS `yeewonweb`.`guestbook` (
  `articleno` INT NOT NULL AUTO_INCREMENT,
  `userid` VARCHAR(16) NOT NULL,
  `subject` VARCHAR(100) NOT NULL,
  `content` VARCHAR(2000) NOT NULL,
  `regtime` TIMESTAMP NOT NULL DEFAULT current_timestamp,
  INDEX `guestbook_userid_FK_idx` (`userid` ASC) VISIBLE,
  PRIMARY KEY (`articleno`),
  CONSTRAINT `guestbook_userid_FK`
    FOREIGN KEY (`userid`)
    REFERENCES `yeewonweb`.`yeewon_member` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Table `yeewonweb`.`guestbook`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yeewonweb`.`guestbook` ;

CREATE TABLE IF NOT EXISTS `yeewonweb`.`guestbook` (
  `articleno` INT NOT NULL AUTO_INCREMENT,
  `userid` VARCHAR(16) NOT NULL,
  `subject` VARCHAR(100) NOT NULL,
  `content` VARCHAR(2000) NOT NULL,
  `regtime` TIMESTAMP NOT NULL DEFAULT current_timestamp,
  INDEX `guestbook_userid_FK_idx` (`userid` ASC) VISIBLE,
  PRIMARY KEY (`articleno`),
  CONSTRAINT `guestbook_userid_FK`
    FOREIGN KEY (`userid`)
    REFERENCES `yeewonweb`.`yeewon_member` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

