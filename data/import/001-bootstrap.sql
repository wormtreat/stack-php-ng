CREATE DATABASE test;
CREATE USER 'webuser'@'webserver' IDENTIFIED BY 'superHappyBunnies!';
GRANT ALL ON test.* TO 'webuser'@'webserver';
FLUSH PRIVILEGES;
