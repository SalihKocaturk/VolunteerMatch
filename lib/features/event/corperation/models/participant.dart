class Participant {
  final String name;
  final String photo;
  final bool checked;

  Participant({required this.name, required this.photo, required this.checked});

  Participant copyWith({bool? checked}) {
    return Participant(
      name: name,
      photo: photo,
      checked: checked ?? this.checked,
    );
  }
}
