import 'package:flutter/material.dart';
import 'package:template/utils/validator.dart';

class CommonTextFormField extends StatelessWidget {
  const CommonTextFormField({
    super.key,
    this.controller,
    this.isRequired = false,
    this.enabled = true,
    required this.label,
    this.hintText,
    this.keyboardType,
    this.validator,
  });

  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final bool isRequired;
  final bool enabled;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
      ),
      validator: validator ??
          (isRequired
              ? (value) => Validator.validate(value, fieldName: label ?? '')
              : null),
      keyboardType: keyboardType,
    );
  }
}
