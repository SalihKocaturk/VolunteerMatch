import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';
import 'package:prologue/features/splash/pages/splash_page.dart';
import '../../login/pages/login_page.dart';
import '../widgets/approved_status_icon.dart';
import '../widgets/approved_status_message.dart';
import '../widgets/primary_outline_button.dart';

class OrgApprovedPage extends StatelessWidget {
  const OrgApprovedPage({super.key});

  void _goToLogin(BuildContext context) {
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

                  const ApprovedStatusIcon(size: 400),

                  const SizedBox(height: 32),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: ApprovedStatusMessage(titleSize: 20, textSize: 14),
                  ),
                ],
              ),
            ),

            // ALT: buton
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
              child: PrimaryOutlineButton(
                text: 'Uygulamaya giriş yap',
                onPressed: () => _goToLogin(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
