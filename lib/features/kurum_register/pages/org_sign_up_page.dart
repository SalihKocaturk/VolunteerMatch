import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';
import '../../signup/widgets/next_page_button.dart';
import '../widgets/org_sign_up_header.dart';
import '../widgets/org_sign_up_step_contact.dart';
import '../widgets/org_sign_up_step_organization.dart';
import '../widgets/org_step_indicator.dart'; // daha önce yaptığın NextButton

class OrgSignUpPage extends StatefulWidget {
  const OrgSignUpPage({super.key});

  @override
  State<OrgSignUpPage> createState() => _OrgSignUpPageState();
}

class _OrgSignUpPageState extends State<OrgSignUpPage> {
  int _step = 0; // 0: kurum, 1: yetkili
  bool _stepValid = false;

  void _setStepValid(bool value) {
    if (_stepValid == value) return;
    setState(() => _stepValid = value);
  }

  void _goBack() {
    if (_step > 0) {
      setState(() {
        _step--;
        _stepValid = false;
      });
    } else {
      Navigator.pop(context);
    }
  }

  void _goNext() {
    if (!_stepValid) return;

    if (_step < 1) {
      setState(() {
        _step++;
        _stepValid = false;
      });
    } else {
      // TODO: backend'e kurum kaydını gönder
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Kurum kaydı (mock) oluşturuldu.'),
          backgroundColor: AppColors.seed,
          behavior: SnackBarBehavior.floating,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    late Widget stepWidget;

    if (_step == 0) {
      stepWidget = OrgSignUpStepOrganization(onValidChange: _setStepValid);
    } else {
      stepWidget = OrgSignUpStepContact(onValidChange: _setStepValid);
    }

    return Scaffold(
      backgroundColor: AppColors.beige,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ÜST BAR
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
                    'Kurum Kaydı',
                    style: TextStyle(
                      color: AppColors.text,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              const OrgSignUpHeader(),
              const SizedBox(height: 18),

              OrgStepIndicator(currentStep: _step),
              const SizedBox(height: 16),

              // BEYAZ KART İÇİNDE ADIM
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

              // NEXT BUTTON (ayrı widget’ta)
              NextButton(
                enabled: _stepValid,
                isLast: _step == 1,
                onPressed: _goNext,
              ),

              const SizedBox(height: 8),

              Center(
                child: Text(
                  _step == 0
                      ? 'Adım 1/2 – Kurum bilgileri'
                      : 'Adım 2/2 – Yetkili kişi bilgileri',
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
