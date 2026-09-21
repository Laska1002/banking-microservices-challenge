\set ON_ERROR_STOP on

SELECT 'CREATE ROLE banking LOGIN PASSWORD ''banking_dev'''
WHERE NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'banking')\gexec

SELECT 'CREATE DATABASE customers_db OWNER banking'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'customers_db')\gexec

SELECT 'CREATE DATABASE accounts_db OWNER banking'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'accounts_db')\gexec

\connect customers_db
SET ROLE banking;
\ir database/customers.sql
RESET ROLE;

\connect accounts_db
SET ROLE banking;
\ir database/accounts.sql
RESET ROLE;
