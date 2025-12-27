import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';
import 'package:prologue/features/orgLogin/Widgets/login_social_divider.dart';

import '../../login/widgets/google_sign_in_icon.dart';

import 'auth_field.dart';

class OrgLoginForm extends StatefulWidget {
  final void Function(String email, String password)? onLogin;
  final VoidCallback? onTapSignUp;
  final VoidCallback? onTapForgot;
  final VoidCallback? onTapGoogle;

  const OrgLoginForm({
    super.key,
    this.onLogin,
    this.onTapSignUp,
    this.onTapForgot,
    this.onTapGoogle,
  });

  @override
  State<OrgLoginForm> createState() => _OrgLoginFormState();
}

class _OrgLoginFormState extends State<OrgLoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _remember = false;
  bool _obscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    widget.onLogin?.call(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AuthLabel('Kurumsal e-posta'),
        const SizedBox(height: 6),
        AuthField(
          controller: _emailController,
          hintText: 'ornek@kurum.org',
          keyboardType: TextInputType.emailAddress,
        ),

        const SizedBox(height: 12),

        AuthLabel('Şifre'),
        const SizedBox(height: 6),
        AuthField(
          controller: _passwordController,
          hintText: 'Şifreniz',
          obscureText: _obscure,
          suffix: IconButton(
            icon: Icon(
              _obscure
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded,
              color: AppColors.forest.withOpacity(.8),
              size: 20,
            ),
            onPressed: () => setState(() => _obscure = !_obscure),
          ),
        ),

        const SizedBox(height: 10),

        Row(
          children: [
            Checkbox(
              value: _remember,
              activeColor: AppColors.seed,
              onChanged: (v) => setState(() => _remember = v ?? false),
            ),
            Text(
              'Beni hatırla',
              style: TextStyle(
                color: AppColors.text,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: widget.onTapForgot,
              child: Text(
                'Şifremi unuttum',
                style: TextStyle(
                  color: AppColors.forest,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: _submit,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.seed,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Text(
              'Giriş Yap',
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
            ),
          ),
        ),

        const SizedBox(height: 14),

        const LoginSocialDivider(text: 'veya'),

        const SizedBox(height: 12),

        GoogleSignInIcon(onTap: widget.onTapGoogle),

        const SizedBox(height: 18),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Kurum hesabınız yok mu? ',
              style: TextStyle(
                color: AppColors.text,
                fontWeight: FontWeight.w500,
              ),
            ),
            GestureDetector(
              onTap: widget.onTapSignUp,
              child: Text(
                'Kayıt olun',
                style: TextStyle(
                  color: AppColors.forest,
                  fontWeight: FontWeight.w800,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.forest,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
