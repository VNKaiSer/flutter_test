import 'package:flutter/material.dart';

class SuggestMessage extends StatelessWidget {
  const SuggestMessage({
    super.key,
    required this.message,
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5, top: 5),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(51),
        border: Border.all(color: const Color(0xFF797980), width: 1),
      ),
      child: Text(
        message,
        style: const TextStyle(fontSize: 14, color: Color(0xFF797980)),
      ),
    );
  }
}
