import 'package:flutter/material.dart';
import 'package:house_test/model/product_model.dart';
import 'package:house_test/screens/product/widgets/property_detail_widget.dart';
import 'package:house_test/screens/product/widgets/reserved_wigdet.dart';

class ProductInformationWidget extends StatelessWidget {
  const ProductInformationWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '\$${product.price}',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              product.address,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 2),
            PropertyDetailWigdet(
              numberOfBeds: product.numberOfBeds,
              numberOfBaths: product.numberOfBaths,
              sqf: product.sqf,
              type: product.type,
            ),
          ],
        ),
        product.isReserved ? const ReservedWidget() : Container(),
      ],
    );
  }
}
