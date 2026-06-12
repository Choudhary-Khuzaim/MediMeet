const asyncHandler = require('express-async-handler');
const User = require('../models/userModel');

// @desc    Get all doctors (with optional keyword search)
// @route   GET /api/doctors
// @access  Public
const getDoctors = asyncHandler(async (req, res) => {
    const keyword = req.query.keyword
        ? {
              role: 'doctor',
              $or: [
                  { name: { $regex: req.query.keyword, $options: 'i' } },
                  { 'doctorProfile.specialty': { $regex: req.query.keyword, $options: 'i' } },
                  { 'doctorProfile.hospital': { $regex: req.query.keyword, $options: 'i' } },
              ],
          }
        : { role: 'doctor' };

    const doctors = await User.find({ ...keyword }).select('-password');
    res.json(doctors);
});

// @desc    Get doctor by ID
// @route   GET /api/doctors/:id
// @access  Public
const getDoctorById = asyncHandler(async (req, res) => {
    const doctor = await User.findOne({ _id: req.params.id, role: 'doctor' }).select('-password');

    if (doctor) {
        res.json(doctor);
    } else {
        res.status(404);
        throw new Error('Doctor not found');
    }
});

module.exports = {
    getDoctors,
    getDoctorById,
};
