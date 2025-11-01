import 'package:flutter/material.dart';
import 'package:flutter_task/presentation/screens/home/widgets/product_grid.dart';

class ProductList extends StatelessWidget {
  final List<dynamic> products;

  const ProductList({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      key: const Key('product_list'),
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8.0),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: ProductCard(product: products[index]),
        );
      },
    );
  }
}
