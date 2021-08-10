CREATE DATABASE staff;
CREATE USER artur WITH ENCRYPTED PASSWORD 'python';
/*\l to list databases*/
/*\du to list users*/
GRANT ALL PRIVILEGES ON DATABASE staff TO artur;
/*\c Staff  to connect to a database as a specific user !!important*/
/*CREATE SCHEMA mystaff AUTHORIZATION artur;*/

/*DROP DATABASE Staff;*/
/*DROP USER Artur;*/