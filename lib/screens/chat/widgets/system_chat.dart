import 'package:flutter/material.dart';

class SystemMessage extends StatelessWidget {
  const SystemMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFF797980), width: 1),
        ),
        child: const Column(children: <Widget>[
          Text('This property has been marked as reserved.',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12)),
          Text('You may still chat for a better deal!',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12))
        ]),
      ),
    );
  }
}
