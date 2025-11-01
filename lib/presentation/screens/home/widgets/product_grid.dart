import 'package:flutter/material.dart';
import 'package:flutter_task/core/styles/app_texts.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/data/models/product_model.dart';
import 'package:flutter_task/presentation/screens/product_detail_screen.dart';


class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final Color cardColor = AppColors.white;
    final Color textColor = Colors.black87;
    final Color priceColor = AppColors.black;
    final Color oldPriceColor = AppColors.grey2;
    final Color iconColor = AppColors.yellow;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDetailScreen(product: product),
        ));
      },
      borderRadius: BorderRadius.circular(10),
      child: Card(
        elevation: 2,
        color: cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                product.image,
                height: 100,
                width: 100,
                fit: BoxFit.contain,
                loadingBuilder: (context, child, progress) {
                  return progress == null
                      ? child
                      : const Center(child: CircularProgressIndicator(strokeWidth: 2));
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, color: Colors.redAccent);
                },
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTexts(
                      data: product.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ).SemiBold14(context, color: textColor),

                    const SizedBox(height: 6),

                    Row(
                      children: [
                        Icon(Icons.star, color: iconColor, size: 14),
                        const SizedBox(width: 4),
                        AppTexts(
                          data: product.rating.rate.toStringAsFixed(1),
                        ).SemiBold14(context, color: textColor),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppTexts(
                          data: '\$${product.price.toStringAsFixed(2)}',
                        ).SemiBold14(context, color: priceColor),
                        AppTexts(
                          data: '\$1299',
                        ).SemiBold14(context, color: oldPriceColor),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
