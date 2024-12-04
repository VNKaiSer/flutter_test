import 'package:flutter/material.dart';

class ButtonChatSale extends StatelessWidget {
  const ButtonChatSale({
    super.key,
    required this.color,
    required this.text,
    required this.showBorder,
    required this.textColor,
  });
  final Color color;
  final String text;
  final bool showBorder;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(right: 5, top: 5),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: showBorder
              ? Border.all(color: const Color(0xFF797980), width: 1)
              : null,
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w500, color: textColor),
        ),
      ),
      onTap: () {},
    );
  }
}
