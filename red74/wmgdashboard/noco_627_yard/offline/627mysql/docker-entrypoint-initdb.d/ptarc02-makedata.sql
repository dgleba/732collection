
drop table if exists mydates;
drop table if exists mydates_archive;



CREATE TABLE mydates_archive
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
CREATE PROCEDURE filldates(dateStart DATETIME, dateEnd DATETIME)
BEGIN
  WHILE dateStart <= dateEnd DO
    INSERT INTO mydates (mydate) VALUES (dateStart);
    SET dateStart = date_add(dateStart, INTERVAL 1 minute);
  END WHILE;
END;
||
DELIMITER ;


-- insert some data...

CALL filldates('2021-04-15 10:00:00','2021-04-15 18:00:00');




select * from mydates limit 2;


