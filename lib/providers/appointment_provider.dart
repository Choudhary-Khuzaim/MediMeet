import 'package:flutter/foundation.dart';
import '../models/appointment.dart';

class AppointmentProvider with ChangeNotifier {
  final List<Appointment> _appointments = [];

  List<Appointment> get appointments => _appointments;

  List<Appointment> get upcomingAppointments {
    final now = DateTime.now();
    return _appointments
        .where(
          (apt) =>
              apt.status == 'upcoming' &&
              (apt.dateTime.isAfter(now) || apt.dateTime.isAtSameMomentAs(now)),
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
      _appointments[index] = _appointments[index].copyWith(status: status);
      notifyListeners();
    }
  }

  void cancelAppointment(String id) {
    updateAppointmentStatus(id, 'cancelled');
  }
}
