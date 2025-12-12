import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';
import '../../splash/pages/splash_page.dart';
import '../widgets/pending_status_icon.dart';
import '../widgets/pending_status_message.dart';
import '../widgets/primary_outline_button.dart';

class OrgPendingPage extends StatelessWidget {
  const OrgPendingPage({super.key});

  void _goToSplash(BuildContext context) {
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
            // Üst taraf (ikon + mesaj)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),

                  // İKON — BÜYÜTÜLMÜŞ
                  const PendingStatusIcon(size: 300),

                  const SizedBox(height: 32),

                  // MESAJ — ORTALANMIŞ
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: PendingStatusMessage(titleSize: 20, textSize: 14),
                  ),
                ],
              ),
            ),

            // ALTTAKİ BUTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
              child: PrimaryOutlineButton(
                text: 'Girişe geri dön',
                onPressed: () => _goToSplash(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
