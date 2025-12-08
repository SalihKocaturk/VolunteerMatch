import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';
import '../../signup/pages/sign_up_page.dart';
import '../widgets/login_form.dart';
import '../widgets/login_header.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                const SizedBox(height: 24),
                const LoginHeader(),
                const SizedBox(height: 28),
                LoginForm(
                  onLogin: (email, password) {
                    // TODO: backend login
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Giriş işlemi henüz bağlı değil.'),
                        backgroundColor: AppColors.seed,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  onTapSignUp: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignUpPage()),
                    );
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
