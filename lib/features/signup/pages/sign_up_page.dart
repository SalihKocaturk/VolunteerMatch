import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';
import 'package:prologue/features/signup/widgets/next_page_button.dart';

import '../../quiz/pages/quiz_page.dart';
import '../widgets/auth/sign_up_step_account.dart';
import '../widgets/auth/sign_up_step_preferences.dart';
import '../widgets/auth/sign_up_step_profile.dart';
import '../widgets/sign_up_header.dart';
import '../widgets/signupstepin.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int _step = 0; // 0: hesap, 1: profil, 2: tercihler
  bool _stepValid = false;

  void _setStepValid(bool v) {
    if (_stepValid == v) return;
    setState(() => _stepValid = v);
  }

  void _goBack() {
    if (_step > 0) {
      setState(() {
        _step--;
        _stepValid = false; // yeni adım için tekrar doğrulanacak
      });
    } else {
      Navigator.pop(context);
    }
  }

  void _goNext() {
    if (!_stepValid) return;

    if (_step < 2) {
      setState(() {
        _step++;
        _stepValid = false;
      });
    } else {
      // Son adım: şimdilik backend yok, direkt QuizPage'e geçiyoruz
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const QuizPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget stepWidget;
    switch (_step) {
      case 0:
        stepWidget = SignUpStepAccount(onValidChange: _setStepValid);
        break;
      case 1:
        stepWidget = SignUpStepProfile(onValidChange: _setStepValid);
        break;
      default:
        stepWidget = SignUpStepPreferences(onValidChange: _setStepValid);
    }

    return Scaffold(
      backgroundColor: AppColors.beige,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Üst bar
              Row(
                children: [
                  IconButton(
                    onPressed: _goBack,
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.text,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Kayıt Ol',
                    style: TextStyle(
                      color: AppColors.text,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              const SignUpHeader(),
              const SizedBox(height: 18),

              SignUpStepIndicator(currentStep: _step),
              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Colors.grey.withOpacity(.28),
                    width: 1,
                  ),
                ),
                child: stepWidget,
              ),

              const SizedBox(height: 18),
              NextButton(
                enabled: _stepValid,
                isLast: _step < 2,
                onPressed: () {
                  _stepValid ? _goNext : null;
                },
              ),

              const SizedBox(height: 8),

              Center(
                child: Text(
                  _step == 0
                      ? 'Adım 1/3 – Hesap bilgileri'
                      : _step == 1
                      ? 'Adım 2/3 – Profil bilgileri'
                      : 'Adım 3/3 – Gönüllülük tercihleri',
                  style: TextStyle(
                    color: AppColors.forest.withOpacity(.85),
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
