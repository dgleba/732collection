-- CREATE TABLE IF NOT EXISTS test_table (
    -- id INT AUTO_INCREMENT PRIMARY KEY,
    -- name VARCHAR(50) NOT NULL,
    -- created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );
-- INSERT INTO test_table (name) VALUES ('Alice'), ('Bob'), ('Charlie'), ('dg11  2026-01-11_Sun  21.18');

-- pg_chameleon also needs SELECT on the replicated schema
GRANT SELECT ON delphis.* TO 'musr'@'%';

-- ------------------------------------------------------------
-- 3. Create readonly user
-- ------------------------------------------------------------
CREATE USER IF NOT EXISTS 'usr_readonly'@'%' IDENTIFIED BY '';

GRANT SELECT ON delphis.* TO 'usr_readonly'@'%';

-- ------------------------------------------------------------
-- 4. Create source schema (if not exists)
-- ------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS delphis
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

-- ------------------------------------------------------------
-- 5. Create allowed table (foo)
--    pg_chameleon will copy only this table because of limit_tables
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS delphis.foo (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    tiny_flag TINYINT(1),
    payload TEXT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- ------------------------------------------------------------
-- 6. Create skipped table (bar)
--    pg_chameleon will ignore this table because of skip_tables
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS delphis.bar (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    note VARCHAR(255)
) ENGINE=InnoDB;
-- ------------------------------------------------------------
-- 7. Apply privileges again (idempotent safety)
-- ------------------------------------------------------------
FLUSH PRIVILEGES;

use delphis;

-- -------------------------------------------------
--
-- Dumping data for table `bar`
--
LOCK TABLES `bar` WRITE;
/*!40000 ALTER TABLE `bar` DISABLE KEYS */;
INSERT INTO `bar` VALUES (1,'2026-01-19a. This table is skipped by pg_chameleon'),
(2,'These rows will NOT appear in PostgreSQL'),
(3,'Useful for verifying skip_tables behavior');
/*!40000 ALTER TABLE `bar` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Dumping data for table `foo`
--
LOCK TABLES `foo` WRITE;
/*!40000 ALTER TABLE `foo` DISABLE KEYS */;
INSERT INTO delphis.foo (tiny_flag, payload) VALUES(1, 'first rec');
INSERT INTO delphis.foo (tiny_flag, payload) VALUES(1, '0119 926');

UNLOCK TABLES;

-- -------------------------------------------------
GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'musr'@'%';
-- CREATE USER usr_replica ;
-- SET PASSWORD FOR usr_replica=PASSWORD('replica');
-- GRANT ALL ON sakila.* TO 'usr_replica';
-- GRANT ALL ON delphis_mediterranea.* TO 'usr_replica';
GRANT RELOAD ON *.* to 'musr';
GRANT REPLICATION CLIENT ON *.* to 'musr';
GRANT REPLICATION SLAVE ON *.* to 'musr';
FLUSH PRIVILEGES;
------------
