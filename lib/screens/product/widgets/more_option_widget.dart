import 'package:flutter/material.dart';

class MoreOptionsButton extends StatefulWidget {
  const MoreOptionsButton({super.key});

  @override
  _MoreOptionsButtonState createState() => _MoreOptionsButtonState();
}

class _MoreOptionsButtonState extends State<MoreOptionsButton> {
  bool _showOptions = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _showOptions = !_showOptions;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(
              size: 34,
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ),
        if (_showOptions)
          Positioned(
            top: 34,
            right: 0,
            child: Container(
              margin: const EdgeInsets.only(top: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildOptionButton('Edit Property', () {
                    // Handle edit
                  }),
                  const Divider(height: 1),
                  _buildOptionButton('Delete Property', () {
                    // Handle delete
                  }),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildOptionButton(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Text(
          text,
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
