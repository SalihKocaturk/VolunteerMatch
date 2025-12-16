import 'package:flutter/material.dart';

import '../../../core/widgets/visibility_button_builder.dart';
import '../theme/custom_input_decoration.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String? hint;
  final String? initialValue;
  final bool isPassword;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final bool initialObscure;
  final ValueChanged<bool>? onObscureChanged;

  /// 🔥 YENİ: Search bar gibi davranmasını sağlar
  final bool isSearch;

  const CustomTextField({
    super.key,
    required this.label,
    this.hint,
    this.initialValue,
    this.isPassword = false,
    this.enabled = true,
    this.onChanged,
    this.initialObscure = true,
    this.onObscureChanged,
    this.isSearch = false, // yeni parametre
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final TextEditingController controller;
  late final bool isNaDisabled;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.initialValue ?? "");

    final v = (widget.initialValue ?? "").trim().toUpperCase();

    // **Sadece "N/A" ise disabled**
    isNaDisabled = (v == "N/A");
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled = widget.enabled && !isNaDisabled;

    if (!isEnabled && widget.initialValue == "N/A") {
      // N/A alanı gösterilir ama disable’dır → shrink istemiyoruz
      return _buildTextField(isEnabled);
    }

    return _buildTextField(isEnabled);
  }

  Widget _buildTextField(bool isEnabled) {
    if (!widget.isPassword) {
      return TextField(
        controller: controller,
        enabled: isEnabled,
        obscureText: false,
        onChanged: widget.onChanged,
        decoration: buildCustomInputDecoration(
          label: widget.label,
          hint: widget.hint,
          isSearch: widget.isSearch,
        ),
      );
    }

    return VisibilityButtonBuilder(
      initialObscure: widget.initialObscure,
      onChanged: widget.onObscureChanged,
      builder: (context, obscure, iconButton) {
        return TextField(
          controller: controller,
          enabled: isEnabled,
          obscureText: obscure,
          onChanged: widget.onChanged,
          decoration: buildCustomInputDecoration(
            label: widget.label,
            hint: widget.hint,
            suffixIcon: iconButton,
            isSearch: widget.isSearch,
          ),
        );
      },
    );
  }
}
