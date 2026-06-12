const mongoose = require('mongoose');

const medicalRecordSchema = new mongoose.Schema(
    {
        patient: {
            type: mongoose.Schema.Types.ObjectId,
            required: true,
            ref: 'User',
        },
        doctorName: {
            type: String,
            required: true,
        },
        doctorSpecialty: {
            type: String,
            default: '',
        },
        date: {
            type: Date,
            default: Date.now,
        },
        diagnosis: {
            type: String,
            required: true,
        },
        prescription: {
            type: String,
            default: '',
        },
        symptoms: [
            {
                type: String,
            },
        ],
        notes: {
            type: String,
            default: '',
        },
        attachments: [
            {
                type: String,
            },
        ],
    },
    {
        timestamps: true,
    }
);

const MedicalRecord = mongoose.model('MedicalRecord', medicalRecordSchema);

module.exports = MedicalRecord;
