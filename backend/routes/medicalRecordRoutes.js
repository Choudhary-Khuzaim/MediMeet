const express = require('express');
const router = express.Router();
const {
    createMedicalRecord,
    getMyMedicalRecords,
    deleteMedicalRecord,
} = require('../controllers/medicalRecordController');
const { protect } = require('../middlewares/authMiddleware');

router.route('/')
    .post(protect, createMedicalRecord)
    .get(protect, getMyMedicalRecords);

router.route('/:id')
    .delete(protect, deleteMedicalRecord);

module.exports = router;
