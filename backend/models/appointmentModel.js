const mongoose = require('mongoose');

const appointmentSchema = new mongoose.Schema(
    {
        patient: {
            type: mongoose.Schema.Types.ObjectId,
            required: true,
            ref: 'User',
        },
        doctor: {
            type: mongoose.Schema.Types.ObjectId,
            required: true,
            ref: 'User',
        },
        dateTime: {
            type: Date,
            required: true,
        },
        status: {
            type: String,
            required: true,
            enum: ['upcoming', 'completed', 'cancelled'],
            default: 'upcoming',
        },
        reason: {
            type: String,
            required: true,
        },
        notes: {
            type: String,
            default: '',
        },
    },
    {
        timestamps: true,
    }
);

const Appointment = mongoose.model('Appointment', appointmentSchema);

module.exports = Appointment;
