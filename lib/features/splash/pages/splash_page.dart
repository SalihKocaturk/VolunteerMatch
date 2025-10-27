import 'package:flutter/material.dart';
import 'package:prologue/features/base/pages/base_page.dart';
import 'package:prologue/features/home/pages/home_page.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/primary_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.beige,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/illustrations/get_started_illustration.png',
                height: 300,
              ),
              Text(
                "Hoş Geldiniz!",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text,
                ),
              ),
              const SizedBox(height: 40),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                        label: 'Gönüllü',
                        icon: Icons.handshake_rounded,
                        textColor: Colors.white,
                        backgroundColor: AppColors.blue,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const BasePage()),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                        label: 'Kurum',
                        textColor: Colors.white,
                        backgroundColor: AppColors.blue,
                        icon: Icons.apartment_rounded,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const HomePage()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
