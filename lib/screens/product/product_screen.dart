import 'package:flutter/material.dart';
import 'package:house_test/model/product_model.dart';
import 'components/index.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final List<ProductModel> productList = [
      ProductModel(
          id: 1,
          image: 'assets/images/product.png',
          address: '123 Redap Link',
          isReserved: true,
          numberOfBaths: 3,
          numberOfBeds: 4,
          sqf: '3.258',
          price: 122.387,
          type: 'Landed',
          timePosted: '1 day ago'),
      ProductModel(
          id: 1,
          image: 'assets/images/product.png',
          address: '123 Redap Link',
          isReserved: false,
          numberOfBaths: 3,
          numberOfBeds: 4,
          sqf: '3.258',
          price: 122.387,
          type: 'Landed',
          timePosted: '1 day ago')
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Property'),
        centerTitle: false,
      ),
      body: Center(
        child: SizedBox(
          width: size.width * 0.9,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      for (ProductModel product in productList)
                        ProductCard(
                          product: product,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
