class Doctor {
  final String id;
  final String name;
  final String specialty;
  final String imageUrl;
  final double rating;
  final int totalReviews;
  final String hospital;
  final String experience;
  final String education;
  final String description;
  final List<String> availableDays;
  final String consultationFee;

  Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.imageUrl,
    required this.rating,
    required this.totalReviews,
    required this.hospital,
    required this.experience,
    required this.education,
    required this.description,
    required this.availableDays,
    required this.consultationFee,
  });
}
