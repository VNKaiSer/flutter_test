import 'package:flutter/material.dart';

class TimePostedWidget extends StatelessWidget {
  const TimePostedWidget({
    super.key,
    required this.timePosted,
  });

  final String timePosted;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 18,
      left: 17.5,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          timePosted,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
