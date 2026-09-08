-- Medicare Patient Service Database Initialization
CREATE DATABASE IF NOT EXISTS medicare_patient_db;
USE medicare_patient_db;

CREATE TABLE IF NOT EXISTS patients (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(255) UNIQUE,
    date_of_birth DATE,
    gender VARCHAR(10),
    address TEXT,
    blood_type VARCHAR(5),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO patients (full_name, phone, email, date_of_birth, gender, address, blood_type) VALUES
('Nguyen Van A', '0901234567', 'nguyenvana@gmail.com', '1990-05-15', 'Male', '123 Le Loi, Q1, TP.HCM', 'A+'),
('Tran Thi B', '0912345678', 'tranthib@gmail.com', '1985-08-22', 'Female', '456 Nguyen Hue, Q1, TP.HCM', 'B-'),
('Le Van C', '0923456789', 'levanc@gmail.com', '1995-03-10', 'Male', '789 Hai Ba Trung, Q3, TP.HCM', 'O+');
