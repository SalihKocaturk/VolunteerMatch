import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prologue/features/splash/pages/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: const VolunteerMatchApp()));
}

class VolunteerMatchApp extends StatelessWidget {
  const VolunteerMatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Volunteer Match',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: SplashPage(),
    );
  }
}
