-- Medicare Appointment Service Database Initialization
CREATE DATABASE IF NOT EXISTS medicare_appointment_db;
USE medicare_appointment_db;

CREATE TABLE IF NOT EXISTS appointments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    patient_id BIGINT NOT NULL,
    doctor_id BIGINT NOT NULL,
    appointment_datetime DATETIME NOT NULL,
    status VARCHAR(20) DEFAULT 'SCHEDULED',
    reason TEXT,
    notes TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO appointments (patient_id, doctor_id, appointment_datetime, status, reason) VALUES
(1, 1, '2026-09-10 09:00:00', 'SCHEDULED', 'Routine checkup'),
(2, 2, '2026-09-10 10:30:00', 'SCHEDULED', 'Follow-up consultation'),
(3, 3, '2026-09-11 14:00:00', 'SCHEDULED', 'Knee pain');
