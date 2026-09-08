-- Medicare Medical Record Service Database Initialization
CREATE DATABASE IF NOT EXISTS medicare_medical_record_db;
USE medicare_medical_record_db;

CREATE TABLE IF NOT EXISTS medical_records (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    patient_id BIGINT NOT NULL,
    doctor_id BIGINT NOT NULL,
    appointment_id BIGINT,
    visit_date DATE NOT NULL,
    diagnosis TEXT,
    symptoms TEXT,
    treatment TEXT,
    prescription TEXT,
    follow_up_date DATE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO medical_records (patient_id, doctor_id, appointment_id, visit_date, diagnosis, symptoms, treatment) VALUES
(1, 1, 1, '2026-09-01', 'Hypertension Stage 1', 'Headache, dizziness', 'Lifestyle change, medication'),
(2, 2, 2, '2026-09-02', 'Common cold', 'Runny nose, sore throat', 'Rest, fluids, antihistamine');
