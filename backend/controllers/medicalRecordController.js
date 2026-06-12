const asyncHandler = require('express-async-handler');
const MedicalRecord = require('../models/medicalRecordModel');

// @desc    Create a new medical record
// @route   POST /api/medical-records
// @access  Private
const createMedicalRecord = asyncHandler(async (req, res) => {
    const {
        doctorName,
        doctorSpecialty,
        date,
        diagnosis,
        prescription,
        symptoms,
        notes,
        attachments,
    } = req.body;

    const medicalRecord = await MedicalRecord.create({
        patient: req.user._id,
        doctorName,
        doctorSpecialty: doctorSpecialty || '',
        date: date || Date.now(),
        diagnosis,
        prescription: prescription || '',
        symptoms: symptoms || [],
        notes: notes || '',
        attachments: attachments || [],
    });

    res.status(201).json(medicalRecord);
});

// @desc    Get logged in user's medical records
// @route   GET /api/medical-records
// @access  Private
const getMyMedicalRecords = asyncHandler(async (req, res) => {
    const records = await MedicalRecord.find({ patient: req.user._id }).sort({ date: -1 });
    res.json(records);
});

// @desc    Delete medical record
// @route   DELETE /api/medical-records/:id
// @access  Private
const deleteMedicalRecord = asyncHandler(async (req, res) => {
    const record = await MedicalRecord.findById(req.params.id);

    if (!record) {
        res.status(404);
        throw new Error('Medical record not found');
    }

    // Check authorization: only the patient can delete their record
    if (record.patient.toString() !== req.user._id.toString()) {
        res.status(403);
        throw new Error('Not authorized to delete this medical record');
    }

    await record.deleteOne();
    res.json({ message: 'Medical record removed' });
});

module.exports = {
    createMedicalRecord,
    getMyMedicalRecords,
    deleteMedicalRecord,
};
