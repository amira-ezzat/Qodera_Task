import 'package:flutter/material.dart';
import 'package:flutter_task/core/styles/app_texts.dart';
import 'package:flutter_task/core/utils/app_colors.dart';

class FavoriteItemWidget extends StatelessWidget {
  final FavoriteItem item;

  const FavoriteItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 6,bottom:6,right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),

        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTexts(
                      data: item.title,
                      maxLines: 2,
                      textColor: AppColors.black,
                      overflow: TextOverflow.ellipsis,
                    ).bodyMM(),
                    AppTexts(
                      data: '\$${item.price}',
                      textColor: AppColors.black,
                    ).bodyMM(),
                  ],
                ),

                const SizedBox(height: 8),

                /// الكمية

                const SizedBox(height: 33),

                /// القلب + السعر
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.favorite,
                      color: AppColors.pink,
                    ),

                    Row(
                      children: [
                        _QtyButton(
                          icon: Icons.remove,
                          onPressed: () {},

                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: AppTexts(
                            data: '${item.quantity}',
                            textColor: AppColors.black,
                          ).bodyML(),
                        ),

                        _QtyButton(
                          icon: Icons.add,
                          onPressed: () {},
                        ),
                      ],
                    ),

                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),

          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              color: AppColors.pinkLight,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(44),
                bottomRight: Radius.circular(44),
              ),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1.5,
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(33),
                bottomRight: Radius.circular(33),
              ),
              child: Image.asset(
                item.image,
                fit: BoxFit.contain,
              ),
            ),
          ),


        ],
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _QtyButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(
        icon,
        size: 18,
        color:  AppColors.black,
      ),
    );
  }
}

class FavoriteItem {
  final String title;
  final String image;
  final double price;
  final int quantity;

  FavoriteItem({
    required this.title,
    required this.image,
    required this.price,
    required this.quantity,
  });
}
