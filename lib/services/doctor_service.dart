import '../models/doctor.dart';

class DoctorService {
  static List<Doctor> getDoctors() {
    return [
      Doctor(
        id: '1',
        name: 'Dr. Ayesha Khan',
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
      ),
      Doctor(
        id: '2',
        name: 'Dr. Hamza Rahman',
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
      ),
      Doctor(
        id: '3',
        name: 'Dr. Maria Faisal',
        specialty: 'Pediatrician',
        imageUrl: 'https://i.pravatar.cc/150?img=36',
        rating: 4.7,
        totalReviews: 318,
        hospital: 'Children\'s Hospital Lahore',
        experience: '9 years',
        education: 'MBBS (Allama Iqbal Medical College), DCH (UK)',
        description: 'Trusted pediatrician focusing on preventive care, child nutrition, and developmental milestones with a friendly, family-first approach.',
        availableDays: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'],
        consultationFee: 'Rs. 3,000',
      ),
      Doctor(
        id: '4',
        name: 'Dr. Usman Siddiqui',
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
      ),
      Doctor(
        id: '5',
        name: 'Dr. Sana Javed',
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
      ),
      Doctor(
        id: '6',
        name: 'Dr. Bilal Qureshi',
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
      ),
    ];
  }

  static List<Doctor> searchDoctors(String query) {
    final doctors = getDoctors();
    if (query.isEmpty) return doctors;
    return doctors
        .where((doctor) =>
            doctor.name.toLowerCase().contains(query.toLowerCase()) ||
            doctor.specialty.toLowerCase().contains(query.toLowerCase()) ||
            doctor.hospital.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}

