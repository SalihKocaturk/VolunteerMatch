import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../theme/custom_input_decoration.dart';
import 'map_location_picker.dart';

class CustomLocationPickerField extends StatefulWidget {
  final String label;
  final String? hint;
  final LatLng? initialValue;
  final ValueChanged<LatLng> onSelected;
  final bool enabled;

  const CustomLocationPickerField({
    super.key,
    required this.label,
    this.hint,
    this.initialValue,
    required this.onSelected,
    this.enabled = true,
  });

  @override
  State<CustomLocationPickerField> createState() =>
      _CustomLocationPickerFieldState();
}

class _CustomLocationPickerFieldState extends State<CustomLocationPickerField> {
  LatLng? selected;

  @override
  void initState() {
    super.initState();
    selected = widget.initialValue;
  }

  Future<void> _openMapPicker() async {
    if (!widget.enabled) return;

    final LatLng? result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const MapLocationPickerPage()),
    );

    if (result != null) {
      setState(() => selected = result);
      widget.onSelected(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = selected == null
        ? ""
        : "${selected!.latitude.toStringAsFixed(5)}, ${selected!.longitude.toStringAsFixed(5)}";

    return GestureDetector(
      onTap: _openMapPicker,
      child: AbsorbPointer(
        child: TextField(
          controller: TextEditingController(text: text),
          enabled: widget.enabled,
          decoration: buildCustomInputDecoration(
            label: widget.label,
            hint: widget.hint,
            suffixIcon: const Icon(Icons.map_outlined, size: 20),
          ),
        ),
      ),
    );
  }
}
