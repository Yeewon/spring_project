
-- -----------------------------------------------------
-- Table `yeewonweb`.`yeewon_member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yeewonweb`.`yeewon_member` ;

CREATE TABLE IF NOT EXISTS `yeewonweb`.`yeewon_member` (
  `userid` VARCHAR(16) NOT NULL,
  `username` VARCHAR(20) NOT NULL,
  `userpwd` VARCHAR(16) NOT NULL,
  `email` VARCHAR(50) NULL,
  `address` VARCHAR(100) NULL,
  `joindate` TIMESTAMP NULL DEFAULT current_timestamp,
  PRIMARY KEY (`userid`))
ENGINE = InnoDB;

select *
from yeewon_member;


INSERT INTO yeewon_member (userid, username, userpwd, email, address)
VALUES('admin', '관리자', 'admin', 'admin@gamil.com','서울시 강남구');

INSERT INTO yeewon_member (userid, username, userpwd, email, address)
VALUES('yeewon', '정예원', 'yeewon', 'yes3427@gamil.com','서울시 도봉구');

INSERT INTO yeewon_member (userid, username, userpwd, email, address)
VALUES('wonyoung', '정원영', '1234', 'wonyoung@gamil.com','서울시 노원구');

INSERT INTO yeewon_member (userid, username, userpwd, email, address)
VALUES('eunkyung', '김은경', 'eunkyung', 'eunkyung@gamil.com','서울시 강남구');

commit;