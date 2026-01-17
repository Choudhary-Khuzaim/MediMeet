import 'package:flutter/foundation.dart';
import '../models/appointment.dart';

class AppointmentProvider with ChangeNotifier {
  final List<Appointment> _appointments = [];

  List<Appointment> get appointments => _appointments;

  List<Appointment> get upcomingAppointments {
    return _appointments
        .where(
          (apt) =>
              apt.status == 'upcoming' && apt.dateTime.isAfter(DateTime.now()),
        )
        .toList()
      ..sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  List<Appointment> get completedAppointments {
    return _appointments.where((apt) => apt.status == 'completed').toList()
      ..sort((a, b) => b.dateTime.compareTo(a.dateTime));
  }

  void addAppointment(Appointment appointment) {
    _appointments.add(appointment);
    notifyListeners();
  }

  void updateAppointmentStatus(String id, String status) {
    final index = _appointments.indexWhere((apt) => apt.id == id);
    if (index != -1) {
      _appointments[index] = Appointment(
        id: _appointments[index].id,
        doctorId: _appointments[index].doctorId,
        doctorName: _appointments[index].doctorName,
        doctorSpecialty: _appointments[index].doctorSpecialty,
        doctorImageUrl: _appointments[index].doctorImageUrl,
        dateTime: _appointments[index].dateTime,
        status: status,
        reason: _appointments[index].reason,
        notes: _appointments[index].notes,
      );
      notifyListeners();
    }
  }

  void cancelAppointment(String id) {
    updateAppointmentStatus(id, 'cancelled');
  }
}
