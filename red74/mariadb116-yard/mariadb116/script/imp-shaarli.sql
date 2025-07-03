use dkrdb;

create table if not exists jsonTableName( jsonColumnName json );

-- load data  infile '/crib/shaarli.json'
--   into table jsonTableName
--   fields terminated by '\0' escaped by ''
--   lines terminated by '\0';


-- notes

-- albe@racknerd-4f4016:/ap/dkr/dkrcollection617a/bmark616h-yard/php605m$ make ijson
-- ERROR 1290 (HY000) at line 5: The MySQL server is running with the --secure-file-priv option so it cannot execute this statement
-- ERROR 3948 (42000) at line 5: Loading local data is disabled; this must be enabled on both the client and server sides



-- SET CHARACTER SET 'utf8';
-- SET collation_connection = 'utf8_general_ci';

-- LOAD DATA LOCAL
LOAD DATA 
INFILE "/crib/shaarli.csv" \
INTO TABLE shaarli_in  \
CHARACTER SET utf8 \
FIELDS TERMINATED BY '\t' optionally enclosed by '\"' escaped by '\\' LINES TERMINATED BY '\n' \
ignore 1 lines   ;

-- LOAD DATA LOCAL
-- INFILE "/crib/shaarli.csv" \
-- INTO TABLE shaarli  \
-- CHARACTER SET utf8 \
-- FIELDS TERMINATED BY '\t' optionally enclosed by '\"' escaped by '\\' LINES TERMINATED BY '\n' \
-- ignore 1 lines  \
-- (@a,Asset, Description, 
-- @x,@x,@x,@x,@x,
-- @x,@x,@x,@x,@x,
-- @x,@x,@x,@x,@x,
-- @x,@x,@x,@x,@x,
-- @x,@x,@x,@x,@x,
-- @x,@x,@x,@x,@x
-- )  ;


