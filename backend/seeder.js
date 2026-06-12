const mongoose = require('mongoose');
const dotenv = require('dotenv');
const User = require('./models/userModel');
const Appointment = require('./models/appointmentModel');
const MedicalRecord = require('./models/medicalRecordModel');
const connectDB = require('./config/db');

// Load environment variables
dotenv.config();

// Connect to Database
connectDB();

const doctors = [
    {
        name: 'Dr. Ayesha Khan',
        email: 'ayesha@medimeet.com',
        phone: '+92 300 7654321',
        password: 'password123',
        role: 'doctor',
        doctorProfile: {
            specialty: 'Cardiologist',
            imageUrl: 'https://i.pravatar.cc/150?img=48',
            rating: 4.8,
            totalReviews: 284,
            hospital: 'Aga Khan University Hospital, Karachi',
            experience: '14 years',
            education: 'MBBS (AKUH), FCPS Cardiology',
            description: 'Renowned interventional cardiologist focusing on preventive cardiology, cardiac imaging, and post-operative cardiac care for complex cases.',
            availableDays: ['Monday', 'Wednesday', 'Friday'],
            consultationFee: 'Rs. 4,500',
        }
    },
    {
        name: 'Dr. Hamza Rahman',
        email: 'hamza@medimeet.com',
        phone: '+92 300 7654322',
        password: 'password123',
        role: 'doctor',
        doctorProfile: {
            specialty: 'Neurologist',
            imageUrl: 'https://i.pravatar.cc/150?img=15',
            rating: 4.9,
            totalReviews: 192,
            hospital: 'Shifa International Hospital, Islamabad',
            experience: '11 years',
            education: 'MBBS (KEMU), FCPS Neurology',
            description: 'Specialist in movement disorders, migraine management, and epilepsy care with an emphasis on lifestyle-centered treatment plans.',
            availableDays: ['Tuesday', 'Thursday', 'Saturday'],
            consultationFee: 'Rs. 4,000',
        }
    },
    {
        name: 'Dr. Maria Faisal',
        email: 'maria@medimeet.com',
        phone: '+92 300 7654323',
        password: 'password123',
        role: 'doctor',
        doctorProfile: {
            specialty: 'Pediatrician',
            imageUrl: 'https://i.pravatar.cc/150?img=36',
            rating: 4.7,
            totalReviews: 318,
            hospital: "Children's Hospital Lahore",
            experience: '9 years',
            education: 'MBBS (Allama Iqbal Medical College), DCH (UK)',
            description: 'Trusted pediatrician focusing on preventive care, child nutrition, and developmental milestones with a friendly, family-first approach.',
            availableDays: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'],
            consultationFee: 'Rs. 3,000',
        }
    },
    {
        name: 'Dr. Usman Siddiqui',
        email: 'usman@medimeet.com',
        phone: '+92 300 7654324',
        password: 'password123',
        role: 'doctor',
        doctorProfile: {
            specialty: 'Orthopedic Surgeon',
            imageUrl: 'https://i.pravatar.cc/150?img=34',
            rating: 4.6,
            totalReviews: 164,
            hospital: 'Liaquat National Hospital, Karachi',
            experience: '17 years',
            education: 'MBBS (Dow), FRCS (UK)',
            description: 'Expert in sports injuries, joint replacements, and trauma orthopedics helping athletes and patients return to active lifestyles.',
            availableDays: ['Monday', 'Wednesday', 'Friday'],
            consultationFee: 'Rs. 5,500',
        }
    },
    {
        name: 'Dr. Sana Javed',
        email: 'sana@medimeet.com',
        phone: '+92 300 7654325',
        password: 'password123',
        role: 'doctor',
        doctorProfile: {
            specialty: 'Dermatologist',
            imageUrl: 'https://i.pravatar.cc/150?img=28',
            rating: 4.8,
            totalReviews: 265,
            hospital: 'Cosmetique Clinic, Lahore',
            experience: '13 years',
            education: 'MBBS (FMH), Diploma in Dermatology (UK)',
            description: 'Cosmetic and medical dermatology specialist treating acne, pigmentation issues, laser therapies, and advanced skincare procedures.',
            availableDays: ['Tuesday', 'Thursday', 'Saturday'],
            consultationFee: 'Rs. 3,800',
        }
    },
    {
        name: 'Dr. Bilal Qureshi',
        email: 'bilal@medimeet.com',
        phone: '+92 300 7654326',
        password: 'password123',
        role: 'doctor',
        doctorProfile: {
            specialty: 'Psychiatrist',
            imageUrl: 'https://i.pravatar.cc/150?img=52',
            rating: 4.9,
            totalReviews: 208,
            hospital: 'Indus Hospital, Karachi',
            experience: '15 years',
            education: 'MBBS (DUHS), FCPS Psychiatry',
            description: 'Compassionate mental health consultant specializing in anxiety, depression, adolescent psychiatry, and holistic therapy plans.',
            availableDays: ['Monday', 'Wednesday', 'Friday'],
            consultationFee: 'Rs. 4,200',
        }
    }
];

const importData = async () => {
    try {
        await User.deleteMany();
        await Appointment.deleteMany();
        await MedicalRecord.deleteMany();

        console.log('Database cleared!');

        // Insert Doctors
        const createdDoctors = [];
        for (const doc of doctors) {
            const createdDoc = await User.create(doc);
            createdDoctors.push(createdDoc);
        }
        console.log(`${createdDoctors.length} Doctors seeded!`);

        // Insert Default Patient
        const patientData = {
            name: 'Demo Patient',
            email: 'patient@gmail.com',
            phone: '+92 300 1234567',
            password: 'password123',
            role: 'patient'
        };
        const createdPatient = await User.create(patientData);
        console.log('Default Patient seeded! (email: patient@gmail.com, password: password123)');

        // Seed some sample Medical Records for the Patient
        await MedicalRecord.create([
            {
                patient: createdPatient._id,
                doctorName: createdDoctors[0].name,
                doctorSpecialty: createdDoctors[0].doctorProfile.specialty,
                date: new Date(Date.now() - 25 * 24 * 60 * 60 * 1000), // 25 days ago
                diagnosis: 'Hypertension (Stage I)',
                prescription: 'Losartan 50mg once daily\nAtorvastatin 20mg at bedtime',
                symptoms: ['Elevated BP', 'Occasional headaches', 'Mild fatigue'],
                notes: 'Advised DASH diet, morning walk for 30 minutes, and BP monitoring twice a week. Review after 6 weeks.',
                attachments: []
            },
            {
                patient: createdPatient._id,
                doctorName: createdDoctors[1].name,
                doctorSpecialty: createdDoctors[1].doctorProfile.specialty,
                date: new Date(Date.now() - 55 * 24 * 60 * 60 * 1000), // 55 days ago
                diagnosis: 'Chronic Migraine',
                prescription: 'Topiramate 25mg twice daily\nParacetamol 1g SOS',
                symptoms: ['Throbbing headache', 'Photophobia', 'Nausea'],
                notes: 'Discussed migraine triggers, hydration goals, and keeping a headache diary. Next review in 2 months.',
                attachments: []
            }
        ]);
        console.log('Sample Medical Records seeded!');

        // Seed some sample Appointments
        await Appointment.create([
            {
                patient: createdPatient._id,
                doctor: createdDoctors[0]._id,
                dateTime: new Date(Date.now() + 2 * 24 * 60 * 60 * 1000), // 2 days in future
                status: 'upcoming',
                reason: 'Routine Cardiology Follow-up',
                notes: 'Checking blood pressure response to new medication.'
            },
            {
                patient: createdPatient._id,
                doctor: createdDoctors[2]._id,
                dateTime: new Date(Date.now() - 5 * 24 * 60 * 60 * 1000), // 5 days in past
                status: 'completed',
                reason: 'Child Nutrition Consultation',
                notes: 'Discuss dietary plan for seasonal health.'
            }
        ]);
        console.log('Sample Appointments seeded!');

        console.log('Data Import Successful!');
        process.exit();
    } catch (error) {
        console.error(`Error with data import: ${error.message}`);
        process.exit(1);
    }
};

const destroyData = async () => {
    try {
        await User.deleteMany();
        await Appointment.deleteMany();
        await MedicalRecord.deleteMany();

        console.log('Data Destroyed Successful!');
        process.exit();
    } catch (error) {
        console.error(`Error with data destroy: ${error.message}`);
        process.exit(1);
    }
};

if (process.argv[2] === '-d') {
    destroyData();
} else {
    importData();
}
