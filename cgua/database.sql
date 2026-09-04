CREATE DATABASE IF NOT EXISTS cgua_university CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE cgua_university;
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS inquiries;
DROP TABLE IF EXISTS applications;
DROP TABLE IF EXISTS programs;
DROP TABLE IF EXISTS users;
SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE users(id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(120) NOT NULL,email VARCHAR(160) NOT NULL UNIQUE,password VARCHAR(255) NOT NULL,role ENUM('student','lecturer','admin') DEFAULT 'student',created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE programs(id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(160) NOT NULL,faculty VARCHAR(120) NOT NULL,level VARCHAR(60) NOT NULL,duration INT NOT NULL,description TEXT,created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE applications(id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(120) NOT NULL,email VARCHAR(160) NOT NULL,phone VARCHAR(50),program_id INT NOT NULL,status ENUM('Pending','Approved','Rejected') DEFAULT 'Pending',created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,FOREIGN KEY(program_id) REFERENCES programs(id) ON DELETE CASCADE);
CREATE TABLE inquiries(id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(120) NOT NULL,email VARCHAR(160) NOT NULL,message TEXT NOT NULL,created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
INSERT INTO users(name,email,password,role) VALUES
('CGUA Administrator','admin@cgua.test','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCq5m2q7r7Vj8Z5V7K6','admin'),
('Dr. Adventure','lecturer@cgua.test','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCq5m2q7r7Vj8Z5V7K6','lecturer');
INSERT INTO programs(name,faculty,level,duration,description) VALUES
('Computer Science','Computing & Technology','Undergraduate',4,'Software, algorithms, AI and digital systems.'),
('Cyber Security','Computing & Technology','Undergraduate',4,'Security engineering, networks and digital defence.'),
('Software Engineering','Computing & Technology','Undergraduate',4,'Modern software design and development.'),
('Mechanical Engineering','Engineering','Undergraduate',5,'Design, mechanics and manufacturing.'),
('Business Administration','Business & Management','Undergraduate',4,'Leadership, strategy and entrepreneurship.'),
('Mass Communication','Arts & Social Sciences','Undergraduate',4,'Media, communication and digital storytelling.'),
('Biochemistry','Natural Sciences','Undergraduate',4,'Molecular science and life sciences.'),
('Architecture','Environmental Design','Undergraduate',5,'Design, buildings and sustainable environments.');
