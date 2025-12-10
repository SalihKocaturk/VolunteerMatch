class PersonalityScores {
  final int openness;
  final int conscientiousness;
  final int extraversion;
  final int agreeableness;
  final int neuroticism;

  const PersonalityScores({
    this.openness = 0,
    this.conscientiousness = 0,
    this.extraversion = 0,
    this.agreeableness = 0,
    this.neuroticism = 0,
  });

  PersonalityScores copyWith({
    int? openness,
    int? conscientiousness,
    int? extraversion,
    int? agreeableness,
    int? neuroticism,
  }) {
    return PersonalityScores(
      openness: openness ?? this.openness,
      conscientiousness: conscientiousness ?? this.conscientiousness,
      extraversion: extraversion ?? this.extraversion,
      agreeableness: agreeableness ?? this.agreeableness,
      neuroticism: neuroticism ?? this.neuroticism,
    );
  }
}
