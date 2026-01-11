# MEDIMEET - Health & Doctor Appointment App

A comprehensive Flutter mobile application for managing doctor appointments, viewing medical records, and finding healthcare providers.

## Features

- **Doctors List**: Browse and search for doctors by specialty, name, or hospital
- **Doctor Details**: View comprehensive doctor profiles with ratings, experience, and availability
- **Appointment Booking**: Book appointments with calendar selection and time slots
- **Appointment Management**: View upcoming, completed, and all appointments
- **Medical Records**: Access and view your medical history and records
- **Modern UI**: Beautiful, intuitive interface with Material Design 3

## Project Structure

```
lib/
├── main.dart                 # App entry point with navigation
├── models/                   # Data models
│   ├── doctor.dart          # Doctor model
│   ├── appointment.dart     # Appointment model
│   └── medical_record.dart  # Medical record model
├── screens/                  # App screens
│   ├── home_screen.dart     # Home/Dashboard screen
│   ├── doctors_list_screen.dart
│   ├── doctor_detail_screen.dart
│   ├── booking_screen.dart
│   ├── appointments_screen.dart
│   └── medical_records_screen.dart
├── widgets/                  # Reusable UI components
│   ├── doctor_card.dart
│   ├── appointment_card.dart
│   └── medical_record_card.dart
├── providers/                # State management
│   └── appointment_provider.dart
├── services/                 # Data services
│   ├── doctor_service.dart
│   └── medical_record_service.dart
└── utils/                    # Utilities
    ├── app_colors.dart
    └── app_theme.dart
```

## Getting Started

### Prerequisites

- Flutter SDK (3.9.2 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Dependencies

- `flutter`: SDK
- `provider`: State management
- `intl`: Date/time formatting
- `table_calendar`: Calendar widget for booking
- `flutter_svg`: SVG support (optional)

## App Screens

### Home Screen
- Quick action cards for navigation
- Upcoming appointments preview
- Top doctors list
- Search functionality

### Doctors List Screen
- Search and filter doctors
- Specialty filter chips
- Doctor cards with ratings and reviews

### Doctor Detail Screen
- Complete doctor profile
- Ratings and reviews
- Available days
- Book appointment button

### Booking Screen
- Calendar date selection
- Time slot selection
- Reason and notes input
- Appointment confirmation

### Appointments Screen
- Tabbed view (Upcoming, Completed, All)
- Appointment cards with details
- Cancel appointment functionality

### Medical Records Screen
- List of medical records
- Detailed record view
- Diagnosis, prescription, and notes

## State Management

The app uses Provider for state management:
- `AppointmentProvider`: Manages appointments (add, cancel, filter)

## UI/UX Features

- Material Design 3
- Custom color scheme (green/medical theme)
- Responsive layouts
- Smooth navigation
- Empty states
- Loading indicators
- Error handling

## Future Enhancements

- User authentication
- Push notifications
- Video consultations
- Prescription management
- Lab reports integration
- Payment integration
- Doctor reviews and ratings

## License

This project is created for educational purposes.
