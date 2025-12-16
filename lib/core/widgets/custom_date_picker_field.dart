import 'package:flutter/material.dart';

import '../theme/custom_input_decoration.dart';

class CustomDatePickerField extends StatefulWidget {
  final String label;
  final String? hint;
  final DateTime? initialDate;
  final ValueChanged<DateTime?> onSelected;
  final bool enabled;

  const CustomDatePickerField({
    super.key,
    required this.label,
    this.hint,
    this.initialDate,
    required this.onSelected,
    this.enabled = true,
  });

  @override
  State<CustomDatePickerField> createState() => _CustomDatePickerFieldState();
}

class _CustomDatePickerFieldState extends State<CustomDatePickerField> {
  DateTime? selected;

  @override
  void initState() {
    super.initState();
    selected = widget.initialDate;
  }

  Future<void> _pickDate() async {
    if (!widget.enabled) return;

    final now = DateTime.now();

    final result = await showDatePicker(
      context: context,
      initialDate: selected ?? now,
      firstDate: DateTime(1950),
      lastDate: DateTime(now.year + 20),
    );

    if (result != null) {
      setState(() => selected = result);
      widget.onSelected(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = selected != null
        ? "${selected!.day.toString().padLeft(2, '0')}/"
              "${selected!.month.toString().padLeft(2, '0')}/"
              "${selected!.year}"
        : "";

    return GestureDetector(
      onTap: _pickDate,
      child: AbsorbPointer(
        child: TextField(
          controller: TextEditingController(text: text),
          enabled: widget.enabled,
          decoration: buildCustomInputDecoration(
            label: widget.label,
            hint: widget.hint,
            suffixIcon: const Icon(Icons.calendar_today, size: 20),
          ),
        ),
      ),
    );
  }
}
