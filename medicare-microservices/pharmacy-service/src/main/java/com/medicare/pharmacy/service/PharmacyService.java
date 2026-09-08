package com.medicare.pharmacy.service;

import com.medicare.pharmacy.entity.Medicine;
import com.medicare.pharmacy.repository.MedicineRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PharmacyService {

    @Autowired
    private MedicineRepository medicineRepository;

    public List<Medicine> getAllMedicines() {
        return medicineRepository.findAll();
    }

    public Optional<Medicine> getMedicineById(Long id) {
        return medicineRepository.findById(id);
    }

    public List<Medicine> getMedicinesByCategory(String category) {
        return medicineRepository.findByCategory(category);
    }

    public List<Medicine> getActiveMedicines() {
        return medicineRepository.findByIsActiveTrue();
    }

    public Medicine createMedicine(Medicine medicine) {
        if (medicineRepository.existsByCode(medicine.getCode())) {
            throw new RuntimeException("Medicine code already exists: " + medicine.getCode());
        }
        return medicineRepository.save(medicine);
    }

    public Medicine updateMedicine(Long id, Medicine updatedMedicine) {
        Medicine medicine = medicineRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Medicine not found with id: " + id));

        medicine.setName(updatedMedicine.getName());
        medicine.setCode(updatedMedicine.getCode());
        medicine.setDescription(updatedMedicine.getDescription());
        medicine.setManufacturer(updatedMedicine.getManufacturer());
        medicine.setCategory(updatedMedicine.getCategory());
        medicine.setUnitPrice(updatedMedicine.getUnitPrice());
        medicine.setStockQuantity(updatedMedicine.getStockQuantity());
        medicine.setExpiryDate(updatedMedicine.getExpiryDate());
        medicine.setIsActive(updatedMedicine.getIsActive());

        return medicineRepository.save(medicine);
    }

    public void deleteMedicine(Long id) {
        if (!medicineRepository.existsById(id)) {
            throw new RuntimeException("Medicine not found with id: " + id);
        }
        medicineRepository.deleteById(id);
    }
}
