#Craeting an database and table

DROP DATABASE IF EXISTS Produksie_Bord;
CREATE DATABASE Produksie_Bord;
USE Produksie_Bord;


CREATE TABLE beast_data(
emplyee_id INT NOT NULL,
date_time DATE,
masjien_name VARCHAR(50) NOT NULL,
produksie INT,
primary key(emplyee_id)
);

INSERT INTO beast_data(emplyee_id, date_time, masjien_name, produksie)
VALUES
(1, '2024-02-12', 'Beast 1', 2500);