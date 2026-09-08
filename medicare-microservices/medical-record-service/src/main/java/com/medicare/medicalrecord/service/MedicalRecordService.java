package com.medicare.medicalrecord.service;

import com.medicare.medicalrecord.entity.MedicalRecord;
import com.medicare.medicalrecord.repository.MedicalRecordRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MedicalRecordService {

    @Autowired
    private MedicalRecordRepository medicalRecordRepository;

    public List<MedicalRecord> getAllRecords() {
        return medicalRecordRepository.findAll();
    }

    public Optional<MedicalRecord> getRecordById(Long id) {
        return medicalRecordRepository.findById(id);
    }

    public List<MedicalRecord> getRecordsByPatientId(Long patientId) {
        return medicalRecordRepository.findByPatientId(patientId);
    }

    public List<MedicalRecord> getRecordsByDoctorId(Long doctorId) {
        return medicalRecordRepository.findByDoctorId(doctorId);
    }

    public MedicalRecord createRecord(MedicalRecord record) {
        return medicalRecordRepository.save(record);
    }

    public MedicalRecord updateRecord(Long id, MedicalRecord updatedRecord) {
        MedicalRecord record = medicalRecordRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Medical record not found with id: " + id));

        record.setPatientId(updatedRecord.getPatientId());
        record.setDoctorId(updatedRecord.getDoctorId());
        record.setAppointmentId(updatedRecord.getAppointmentId());
        record.setVisitDate(updatedRecord.getVisitDate());
        record.setDiagnosis(updatedRecord.getDiagnosis());
        record.setSymptoms(updatedRecord.getSymptoms());
        record.setTreatment(updatedRecord.getTreatment());
        record.setPrescription(updatedRecord.getPrescription());
        record.setFollowUpDate(updatedRecord.getFollowUpDate());

        return medicalRecordRepository.save(record);
    }

    public void deleteRecord(Long id) {
        if (!medicalRecordRepository.existsById(id)) {
            throw new RuntimeException("Medical record not found with id: " + id);
        }
        medicalRecordRepository.deleteById(id);
    }
}
