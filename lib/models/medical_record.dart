class MedicalRecord {
  final String id;
  final String doctorName;
  final String doctorSpecialty;
  final DateTime date;
  final String diagnosis;
  final String prescription;
  final List<String> symptoms;
  final String notes;
  final List<String> attachments; // URLs to images/files

  MedicalRecord({
    required this.id,
    required this.doctorName,
    required this.doctorSpecialty,
    required this.date,
    required this.diagnosis,
    required this.prescription,
    required this.symptoms,
    required this.notes,
    required this.attachments,
  });
}
