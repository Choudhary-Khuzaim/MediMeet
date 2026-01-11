import '../models/medical_record.dart';

class MedicalRecordService {
  static List<MedicalRecord> getMedicalRecords() {
    return [
      MedicalRecord(
        id: '1',
        doctorName: 'Dr. Ayesha Khan',
        doctorSpecialty: 'Cardiologist',
        date: DateTime.now().subtract(const Duration(days: 25)),
        diagnosis: 'Hypertension (Stage I)',
        prescription: 'Losartan 50mg once daily\nAtorvastatin 20mg at bedtime',
        symptoms: ['Elevated BP', 'Occasional headaches', 'Mild fatigue'],
        notes: 'Advised DASH diet, morning walk for 30 minutes, and BP monitoring twice a week. Review after 6 weeks.',
        attachments: [],
      ),
      MedicalRecord(
        id: '2',
        doctorName: 'Dr. Hamza Rahman',
        doctorSpecialty: 'Neurologist',
        date: DateTime.now().subtract(const Duration(days: 55)),
        diagnosis: 'Chronic Migraine',
        prescription: 'Topiramate 25mg twice daily\nParacetamol 1g SOS',
        symptoms: ['Throbbing headache', 'Photophobia', 'Nausea'],
        notes: 'Discussed migraine triggers, hydration goals, and keeping a headache diary. Next review in 2 months.',
        attachments: [],
      ),
      MedicalRecord(
        id: '3',
        doctorName: 'Dr. Maria Faisal',
        doctorSpecialty: 'Pediatrician',
        date: DateTime.now().subtract(const Duration(days: 85)),
        diagnosis: 'Routine Well-Child Visit',
        prescription: 'Vitamin D3 supplement\nRoutine vaccination schedule',
        symptoms: [],
        notes: 'Growth parameters within WHO percentile. Encourage outdoor play and balanced diet. Follow-up in 6 months.',
        attachments: [],
      ),
    ];
  }
}

