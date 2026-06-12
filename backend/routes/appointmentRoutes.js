const express = require('express');
const router = express.Router();
const {
    bookAppointment,
    getMyAppointments,
    updateAppointmentStatus,
} = require('../controllers/appointmentController');
const { protect } = require('../middlewares/authMiddleware');

router.route('/')
    .post(protect, bookAppointment)
    .get(protect, getMyAppointments);

router.route('/:id')
    .put(protect, updateAppointmentStatus);

module.exports = router;
