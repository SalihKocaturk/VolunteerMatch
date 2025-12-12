import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';
import '../../splash/pages/splash_page.dart';
import '../widgets/error_status_icon.dart';
import '../widgets/error_status_message.dart';
import '../widgets/primary_outline_button.dart'; // 🔹 Kendi klasör yapına göre yolu düzenle

class OrgErrorPage extends StatelessWidget {
  const OrgErrorPage({super.key});

  void _goBackToUpload(BuildContext context) {
    // Yüklemeye geri dön → SplashPage'e dön ve tüm stack'i temizle
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const SplashPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.beige,
      body: SafeArea(
        child: Column(
          children: [
            // ÜST: ikon + mesaj
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  const ErrorStatusIcon(size: 400),
                  const SizedBox(height: 32),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: ErrorStatusMessage(titleSize: 20, textSize: 14),
                  ),
                ],
              ),
            ),

            // ALT: buton
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
              child: PrimaryOutlineButton(
                text: 'Yüklemeye geri dön',
                onPressed: () => _goBackToUpload(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
