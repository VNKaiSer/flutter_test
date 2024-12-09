import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:house_test/constants/icon_const.dart';

class PropertyDetailWigdet extends StatelessWidget {
  const PropertyDetailWigdet({
    super.key,
    required this.numberOfBeds,
    required this.numberOfBaths,
    required this.sqf,
    required this.type,
  });

  final int numberOfBeds;
  final int numberOfBaths;
  final String sqf;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const SizedBox(height: 10),
      _buildPropertyDetail(bedIcon, numberOfBeds.toString()),
      const SizedBox(width: 10),
      _buildPropertyDetail(bathIcon, numberOfBaths.toString()),
      const SizedBox(width: 10),
      _buildPropertyDetail(sqfIcon, "$sqf Sqf"),
      const SizedBox(width: 10),
      _buildPropertyDetail(typeIcon, type),
    ]);
  }
}

Widget _buildPropertyDetail(SvgPicture icon, String text) {
  return Row(
    children: [
      icon,
      const SizedBox(width: 4),
      Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}
