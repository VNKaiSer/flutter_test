import 'package:flutter/material.dart';

class ReservedWidget extends StatelessWidget {
  const ReservedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 5,
        ),
        decoration: BoxDecoration(
            color: const Color(0xFF797980),
            borderRadius: BorderRadius.circular(50)),
        child: const Text(
          'Reserved',
          style: TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
        ));
  }
}
