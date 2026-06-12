const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');

const userSchema = new mongoose.Schema(
    {
        name: {
            type: String,
            required: true,
        },
        email: {
            type: String,
            required: true,
            unique: true,
            lowercase: true,
            trim: true,
        },
        phone: {
            type: String,
            required: true,
        },
        password: {
            type: String,
            required: true,
        },
        role: {
            type: String,
            enum: ['patient', 'doctor'],
            default: 'patient',
        },
        doctorProfile: {
            specialty: { type: String },
            imageUrl: { type: String },
            rating: { type: Number, default: 5.0 },
            totalReviews: { type: Number, default: 0 },
            hospital: { type: String },
            experience: { type: String },
            education: { type: String },
            description: { type: String },
            availableDays: [{ type: String }],
            consultationFee: { type: String },
        },
    },
    {
        timestamps: true,
    }
);

userSchema.methods.matchPassword = async function (enteredPassword) {
    return await bcrypt.compare(enteredPassword, this.password);
};

userSchema.pre('save', async function (next) {
    if (!this.isModified('password')) {
        return next();
    }

    const salt = await bcrypt.genSalt(10);
    this.password = await bcrypt.hash(this.password, salt);
});

const User = mongoose.model('User', userSchema);

module.exports = User;
