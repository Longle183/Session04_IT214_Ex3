-- Medicare Pharmacy Service Database Initialization
CREATE DATABASE IF NOT EXISTS medicare_pharmacy_db;
USE medicare_pharmacy_db;

CREATE TABLE IF NOT EXISTS medicines (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    code VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    manufacturer VARCHAR(255),
    category VARCHAR(100),
    unit_price DECIMAL(10, 2),
    stock_quantity INT DEFAULT 0,
    expiry_date DATE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO medicines (name, code, description, manufacturer, category, unit_price, stock_quantity, expiry_date, is_active) VALUES
('Paracetamol 500mg', 'MED-001', 'Pain reliever and fever reducer', 'Imexpharm', 'Analgesic', 5000.00, 500, '2027-12-31', TRUE),
('Amoxicillin 500mg', 'MED-002', 'Antibiotic for bacterial infections', 'DHG Pharma', 'Antibiotic', 15000.00, 200, '2027-06-30', TRUE),
('Vitamin C 1000mg', 'MED-003', 'Immune system support supplement', 'Traphaco', 'Supplement', 8000.00, 300, '2028-03-31', TRUE),
('Ibuprofen 400mg', 'MED-004', 'Anti-inflammatory pain reliever', 'Danapha', 'NSAID', 12000.00, 150, '2027-09-30', TRUE);
