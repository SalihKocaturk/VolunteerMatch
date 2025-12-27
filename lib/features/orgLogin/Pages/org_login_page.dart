import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

import '../../auth/corperation/pages/org_sign_up_page.dart';

import '../Widgets/org_login_form.dart';
import '../Widgets/org_login_header.dart';

class OrgLoginPage extends StatelessWidget {
  const OrgLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.beige,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 18),
                const OrgLoginHeader(),
                const SizedBox(height: 22),
                OrgLoginForm(
                  onLogin: (email, password) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Kurum girişi henüz bağlı değil.'),
                        backgroundColor: AppColors.seed,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  onTapSignUp: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const OrgSignUpPage()),
                    );
                  },
                  onTapForgot: () {
                    // TODO: Forgot password
                  },
                  onTapGoogle: () {
                    // TODO: Google sign-in (org)
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
