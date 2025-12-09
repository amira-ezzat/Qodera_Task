import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/presentation/page/widgets/cart_item_widget.dart';

import 'package:flutter_task/core/styles/app_texts.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// بيانات ثابتة مؤقتًا
    List<FavoriteItem> items = [
      FavoriteItem(
        title: "روز وردي",
        price: 450.0,
        image: "assets/image/img_2.png",
        quantity: 1,
      ),
      FavoriteItem(
        title: "باقة ورد كبيرة",
        price: 650.0,
        image: "assets/image/3.png",
        quantity: 2,
      ),
      FavoriteItem(
        title: "باقة ورد كبيرة",
        price: 650.0,
        image: "assets/image/2.png",
        quantity: 2,
      ),
      FavoriteItem(
        title: "باقة ورد كبيرة",
        price: 650.0,
        image: "assets/image/img_2.png",
        quantity: 2,
      ),
      FavoriteItem(
        title: "باقة ورد كبيرة",
        price: 650.0,
        image: "assets/image/3.png",
        quantity: 2,
      ),
      FavoriteItem(
        title: "باقة ورد كبيرة",
        price: 650.0,
        image: "assets/image/3.png",
        quantity: 2,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text('المفضلة')),
        automaticallyImplyLeading: false,
         elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Icon(Icons.arrow_forward_ios_outlined),
          )
        ],
         backgroundColor: Colors.white,
      ),
      body: items.isEmpty
          ? Center(
        child: AppTexts(
          data: 'No favorites yet ',
          textColor: AppColors.black
        ).bodyMM(),
      )
          : ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return FavoriteItemWidget(item: items[index]);
        },
        separatorBuilder: (context, index) =>
        const SizedBox(height: 10),
      ),
    );
  }
}
