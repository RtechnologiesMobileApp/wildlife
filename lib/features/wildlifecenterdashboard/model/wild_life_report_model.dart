class WildlifeReportModel {
  final String animal;
  final String condition;
  final String time;
  final String location;
  final String? photo;

  WildlifeReportModel({
    required this.animal,
    required this.condition,
    required this.time,
    required this.location,
    this.photo,
  });
}
