CREATE SCHEMA IF NOT EXISTS `csc2008`;
use csc2008;
CREATE TABLE IF NOT EXISTS actor (
   id INT AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS category (
   id INT AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS country (
   id INT AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS director (
   id INT AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS program (
   id VARCHAR(255) PRIMARY KEY,
   title VARCHAR(255) NOT NULL,
   duration INT NOT NULL,
   rating VARCHAR(20) NOT NULL,
   description TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS `cast` (
   program_id VARCHAR(255) NOT NULL,
   actor_id INT NOT NULL,
   PRIMARY KEY (program_id, actor_id),
   FOREIGN KEY (program_id) REFERENCES program(id),
   FOREIGN KEY (actor_id) REFERENCES actor(id)
);
CREATE TABLE IF NOT EXISTS directed (
   program_id VARCHAR(255) NOT NULL,
   director_id INT NOT NULL,
   PRIMARY KEY (program_id, director_id),
   FOREIGN KEY (program_id) REFERENCES program(id),
   FOREIGN KEY (director_id) REFERENCES director(id)
);
CREATE TABLE IF NOT EXISTS broadcast (
   program_id VARCHAR(255) NOT NULL,
   country_id INT NOT NULL,
   date DATE NOT NULL,
   year YEAR NOT NULL,
   PRIMARY KEY (program_id, country_id),
   FOREIGN KEY (program_id) REFERENCES program(id),
   FOREIGN KEY (country_id) REFERENCES country(id)
);
CREATE TABLE IF NOT EXISTS listed (
   program_id VARCHAR(255) NOT NULL,
   category_id INT NOT NULL,
   PRIMARY KEY (program_id, category_id),
   FOREIGN KEY (program_id) REFERENCES program(id),
   FOREIGN KEY (category_id) REFERENCES category(id)
);
