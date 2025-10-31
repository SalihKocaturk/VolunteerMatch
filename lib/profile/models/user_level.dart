class UserLevel {
  final int xp;
  const UserLevel({required this.xp});

  int get level => xp ~/ 100; // her 100 XP = 1 seviye
  double get progress => (xp % 100) / 100; // 0.0–1.0
}
