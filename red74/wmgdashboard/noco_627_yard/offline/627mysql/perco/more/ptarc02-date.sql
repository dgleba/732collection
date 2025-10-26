


drop table if exists mydates;

CREATE TABLE arc_mydates
(
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  mydate datetime,
  PRIMARY KEY (`id`)
);
CREATE TABLE mydates
(
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  mydate datetime,
  PRIMARY KEY (`id`)
);

DROP PROCEDURE IF EXISTS filldates;
DELIMITER ||
CREATE PROCEDURE filldates(dateStart DATE, dateEnd DATE)
BEGIN
  WHILE dateStart <= dateEnd DO
    INSERT INTO mydates (mydate) VALUES (dateStart);
    SET dateStart = date_add(dateStart, INTERVAL 1 DAY);
  END WHILE;
END;
||
DELIMITER ;
CALL filldates('2021-01-01','2021-04-01');

select mydates limit 2;


