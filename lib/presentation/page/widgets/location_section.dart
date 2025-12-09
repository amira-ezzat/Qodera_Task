import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';

class SearchBarRow extends StatelessWidget {
  const SearchBarRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: Row(
        children: [
          // أيقونة الإشعارات داخل مربع
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: const Icon(Icons.notifications_none_sharp, color: AppColors.black),
          ),
          const SizedBox(width: 12),
          // حقل البحث
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300, width: 1),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "ابحث هنا...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  // زر البحث باللون الوردي يمتد لارتفاع الحقل
                  Container(
                    width: 48,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.pink,
                      borderRadius: BorderRadius.all(
                         Radius.circular(8),
                      ),
                    ),
                    child: const Icon(Icons.search, color: Colors.white),
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
