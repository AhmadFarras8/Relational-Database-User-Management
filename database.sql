-- database.sql — fresh install for Student Management (Relational CRUD & User Management)
-- Import this file in phpMyAdmin (Import tab).

CREATE DATABASE IF NOT EXISTS db_school;
USE db_school;

DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS majors;
DROP TABLE IF EXISTS users;

-- 1) Majors table
CREATE TABLE majors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO majors (name) VALUES
('Informatics'), ('Information Systems'), ('Computer Science');

-- 2) Students table (major_id references majors)
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nim VARCHAR(20) NOT NULL,
    name VARCHAR(100) NOT NULL,
    major_id INT NOT NULL,
    CONSTRAINT fk_students_major
        FOREIGN KEY (major_id) REFERENCES majors(id)
        ON DELETE RESTRICT
);

-- 3) Sample data
INSERT INTO students (nim, name, major_id) VALUES
('2301001', 'Andi Pratama', 1),
('2301002', 'Siti Rahma', 2),
('2301003', 'Budi Santoso', 1),
('2301004', 'Dewi Lestari', 3);

-- 4) Users table for login
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'staff') NOT NULL DEFAULT 'staff'
);
-- The first admin is created by seed_admin.php (password hashes can't be typed by hand).
