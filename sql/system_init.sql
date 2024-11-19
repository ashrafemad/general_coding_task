DROP DATABASE IF EXISTS :database_name;
CREATE DATABASE :database_name;
DROP ROLE IF EXISTS :username;
CREATE ROLE :username WITH ENCRYPTED PASSWORD ':password';
ALTER ROLE :username WITH LOGIN;
GRANT ALL ON DATABASE :database_name TO :username;
\c :database_name
GRANT ALL ON schema public to :username;
