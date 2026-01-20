
CREATE USER replica WITH PASSWORD 'pass';
CREATE DATABASE delphis_repl WITH OWNER replica;

-- Create readonly user
CREATE USER usr_readonly WITH PASSWORD 'readonly_pass';

-- Grant connect on database
GRANT CONNECT ON DATABASE delphis_repl TO usr_readonly;


-- #################################################################

-- junk...

-- CREATE ROLE postgres WITH LOGIN SUPERUSER PASSWORD 'postgres';

-- Create replication user
-- CREATE USER usr_replica WITH PASSWORD 'pgpass';

-- Grant necessary privileges
-- GRANT ALL PRIVILEGES ON DATABASE sakila TO usr_replica;


-- GRANT ALL ON SCHEMA public TO usr_replica;
-- GRANT ALL ON SCHEMA loxodonta_africana TO usr_replica;
-- GRANT USAGE ON SCHEMA loxodonta_africana TO usr_readonly;

-- CREATE USER usr_replica WITH PASSWORD 'replica';
-- CREATE DATABASE db_replica WITH OWNER usr_replica;
