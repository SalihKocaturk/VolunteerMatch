class UserModel {
  final String id;
  final String name;
  final String? imagePath;
  final int score;
  final int level; // ⬅️ eklendi

  const UserModel({
    required this.id,
    required this.name,
    required this.score,
    required this.level, // ⬅️ eklendi
    this.imagePath,
  });
}
