import 'package:flutter/material.dart';

class ExceptionWidget extends StatelessWidget {
  const ExceptionWidget({super.key, this.errorMessage});

  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    if (errorMessage != null) {
      return ListTile(title: Text(errorMessage!));
    }
    return const Icon(Icons.warning_rounded);
  }
}
