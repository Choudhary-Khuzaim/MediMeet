class Appointment {
  final String id;
  final String doctorId;
  final String doctorName;
  final String doctorSpecialty;
  final String doctorImageUrl;
  final DateTime dateTime;
  final String status; // 'upcoming', 'completed', 'cancelled'
  final String reason;
  final String notes;

  Appointment({
    required this.id,
    required this.doctorId,
    required this.doctorName,
    required this.doctorSpecialty,
    required this.doctorImageUrl,
    required this.dateTime,
    required this.status,
    required this.reason,
    required this.notes,
  });
}
