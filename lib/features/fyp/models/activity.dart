enum ActivityImportance { low, medium, high }

class Activity {
  final String id;
  final String title;
  final String description;
  final String location;
  final String imageUrl;
  final DateTime date;
  final bool isJoined;
  final ActivityImportance importance;
  final int points;

  Activity({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.imageUrl,
    required this.date,
    this.isJoined = false,
    this.importance = ActivityImportance.medium,
    this.points = 0,
  });
}
