-- Run this script to create the database and users table
CREATE DATABASE IF NOT EXISTS onlinebookstore;
USE onlinebookstore;

CREATE TABLE IF NOT EXISTS users (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    username    VARCHAR(50)  NOT NULL UNIQUE,
    fname       VARCHAR(50),
    lname       VARCHAR(50),
    email       VARCHAR(100) NOT NULL UNIQUE,
    password    VARCHAR(255) NOT NULL,
    phone       VARCHAR(20),
    gender      VARCHAR(10),
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
