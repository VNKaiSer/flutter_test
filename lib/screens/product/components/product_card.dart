import 'package:flutter/material.dart';
import 'package:house_test/model/product_model.dart';
import '../widgets/index.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              height: 300,
              product.image,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const Positioned(
            top: 14,
            right: 12,
            child: MoreOptionsButton(),
          ),
          TimePostedWidget(timePosted: product.timePosted),
        ],
      ),
      const SizedBox(height: 16),
      ProductInformationWidget(product: product),
      const SizedBox(height: 20),
    ]);
  }
}
