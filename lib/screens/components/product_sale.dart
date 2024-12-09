import 'package:flutter/material.dart';

import '../chat/components/index.dart';

class ProductSale extends StatelessWidget {
  const ProductSale({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
  });
  final String name;
  final String price;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Image.asset(imageUrl),
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                    decorationThickness: 0.5),
              ),
              Text(
                "\$$price",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              const Row(
                children: <Widget>[
                  ButtonChatSale(
                    text: 'Unreserve',
                    color: Colors.white,
                    showBorder: true,
                    textColor: Colors.black,
                  ),
                  ButtonChatSale(
                    text: 'Mark as Sold',
                    color: Color(0xFF1155CC),
                    showBorder: true,
                    textColor: Colors.white,
                  )
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
