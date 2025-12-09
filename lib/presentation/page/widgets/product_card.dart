import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isLoved = false; // حالة القلب فقط

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.pinkLight, // ← ثابت لا يتغير
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Colors.grey.shade300,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // القلب في الأعلى اليسار
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isLoved = !isLoved;
                });
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: Icon(
                  isLoved ? Icons.favorite : Icons.favorite_border,
                  color: isLoved ? AppColors.pink : AppColors.pink, // نفس اللون
                  size: 24,
                ),
              ),
            ),
          ),

          // صورة المنتج
          Container(
            height: 90,
            color: AppColors.pinkLight,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image.asset(
                  widget.product.image,
                  fit: BoxFit.contain,
                  width: 222,
                  height: 222,
                ),
              ),
            ),
          ),

          const SizedBox(height: 5),

          // التفاصيل
          Container(
            width: double.infinity,
            color: AppColors.white,
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.product.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),

                      Icon(
                        Icons.shopping_cart_checkout,
                        color: Colors.black87,
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  Text(
                    "\$${widget.product.price}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductModel {
  final String title;
  final double price;
  final String image;
  final String category;

  ProductModel({
    required this.title,
    required this.price,
    required this.image,
    required this.category,
  });
}
