enum EventImportance { low, medium, high }

enum EventJoinState { notJoined, pending, joined }

class Event {
  final String id;
  final String title;
  final String description;
  final String location;
  final String imageUrl;
  final DateTime date;
  final EventImportance importance;
  final EventJoinState joinState;
  final int points;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.imageUrl,
    required this.date,
    this.importance = EventImportance.medium,
    this.joinState = EventJoinState.notJoined,
    this.points = 0,
  });
}
