const asyncHandler = require('express-async-handler');
const Appointment = require('../models/appointmentModel');
const User = require('../models/userModel');

// @desc    Book a new appointment
// @route   POST /api/appointments
// @access  Private
const bookAppointment = asyncHandler(async (req, res) => {
    const { doctorId, dateTime, reason, notes } = req.body;

    // Verify doctor exists and has doctor role
    const doctor = await User.findOne({ _id: doctorId, role: 'doctor' });
    if (!doctor) {
        res.status(404);
        throw new Error('Doctor not found');
    }

    const appointment = await Appointment.create({
        patient: req.user._id,
        doctor: doctorId,
        dateTime,
        reason,
        notes: notes || '',
    });

    res.status(201).json(appointment);
});

// @desc    Get logged in user's appointments
// @route   GET /api/appointments
// @access  Private
const getMyAppointments = asyncHandler(async (req, res) => {
    let query = {};
    if (req.user.role === 'doctor') {
        query = { doctor: req.user._id };
    } else {
        query = { patient: req.user._id };
    }

    const appointments = await Appointment.find(query)
        .populate('patient', 'name email phone')
        .populate('doctor', 'name email phone doctorProfile')
        .sort({ dateTime: 1 });

    res.json(appointments);
});

// @desc    Update appointment status
// @route   PUT /api/appointments/:id
// @access  Private
const updateAppointmentStatus = asyncHandler(async (req, res) => {
    const { status } = req.body;

    if (!['upcoming', 'completed', 'cancelled'].includes(status)) {
        res.status(400);
        throw new Error('Invalid status value');
    }

    const appointment = await Appointment.findById(req.params.id);

    if (!appointment) {
        res.status(404);
        throw new Error('Appointment not found');
    }

    // Check authorization: only the patient or the doctor can update this
    if (
        appointment.patient.toString() !== req.user._id.toString() &&
        appointment.doctor.toString() !== req.user._id.toString()
    ) {
        res.status(403);
        throw new Error('Not authorized to update this appointment');
    }

    appointment.status = status;
    const updatedAppointment = await appointment.save();

    res.json(updatedAppointment);
});

module.exports = {
    bookAppointment,
    getMyAppointments,
    updateAppointmentStatus,
};
