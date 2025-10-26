use dkrdb;
CREATE  TABLE if not exists data1 
(
  id         bigint(20) NOT NULL      AUTO_INCREMENT,
  datetime   timestamp  NULL          DEFAULT CURRENT_TIMESTAMP,
  channel    int(11)                  DEFAULT NULL,
  value      float                    DEFAULT NULL,
  PRIMARY KEY (id)
);
--
