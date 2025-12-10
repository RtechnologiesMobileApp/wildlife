class ClinicModel {
  final String name;
  final String distance;
  final String phone;
  final String address;
  final String hours;
  final String services;
  final double? rating;
  final String description;

  ClinicModel({
    required this.name,
    required this.distance,
    required this.phone,
    this.address = "Address not available",
    this.hours = "Hours not available",
    this.services = "Services information coming soon",
    this.rating = 4.0,
    this.description = "Clinic details coming soon",
  });
}
