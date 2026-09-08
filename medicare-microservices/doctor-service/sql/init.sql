-- Medicare Doctor Service Database Initialization
CREATE DATABASE IF NOT EXISTS medicare_doctor_db;
USE medicare_doctor_db;

CREATE TABLE IF NOT EXISTS doctors (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    license_number VARCHAR(50) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(255) UNIQUE,
    department VARCHAR(100),
    experience_years INT,
    is_available BOOLEAN DEFAULT TRUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO doctors (full_name, specialization, license_number, phone, email, department, experience_years, is_available) VALUES
('Dr. Nguyen Van Thanh', 'Cardiology', 'LIC-001', '0901111111', 'thanh.nguyen@medicare.vn', 'Cardiology', 15, TRUE),
('Dr. Tran Thi Lan', 'Pediatrics', 'LIC-002', '0902222222', 'lan.tran@medicare.vn', 'Pediatrics', 10, TRUE),
('Dr. Le Minh Duc', 'Orthopedics', 'LIC-003', '0903333333', 'duc.le@medicare.vn', 'Orthopedics', 8, TRUE);
