import 'package:flutter/material.dart';

class TutorialStepData {
  final Color color;
  final String title;
  final String text;
  const TutorialStepData({
    required this.color,
    required this.title,
    required this.text,
  });
}

const tutorialSteps = <TutorialStepData>[
  TutorialStepData(
    color: Colors.orangeAccent,
    title: '1. BLOK',
    text: 'Bu, ilk adım. Hoş geldin!',
  ),
  TutorialStepData(
    color: Colors.teal,
    title: '2. BLOK',
    text: 'Uygulamanın amacı burada.',
  ),
  TutorialStepData(
    color: Colors.blueAccent,
    title: '3. BLOK',
    text: 'Gönüllülük detayları.',
  ),
  TutorialStepData(
    color: Colors.deepPurpleAccent,
    title: '4. BLOK',
    text: 'Hazırsan başlayalım!',
  ),
];
