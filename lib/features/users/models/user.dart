class User {
  final String id;
  final String name;
  final String photoUrl;
  final String email;
  final bool isApplicant;
  final bool isOldWorker;

  User({
    required this.id,
    required this.name,
    required this.photoUrl,
    required this.email,
    this.isApplicant = false,
    this.isOldWorker = false,
  });
}
