import 'package:flutter/material.dart';
import 'package:flutter_task/core/styles/app_texts.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/presentation/page/favorite.dart';
import 'package:flutter_task/presentation/page/widgets/banner_slider.dart';
import 'package:flutter_task/presentation/page/widgets/location_section.dart';
import 'package:flutter_task/presentation/page/widgets/product_card.dart';
import 'package:flutter_task/presentation/screens/home/home_screen.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> pages = [
    const HomeContent(),
    const CartScreen(),
    const FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // الصفحة الحالية
          pages[_selectedIndex],

          // NavBar معلق من تحت
          Positioned(
            left: 16,
            right: 16,
            bottom: 22,
            child: CustomNavBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final List<String> categories = ['ورود', 'فازات', 'اغصان'];
  final List<ProductModel> products = [
    ProductModel(title: "روز وردي", price: 450.0, image: "assets/image/img_2.png", category: "Electronics"),
    ProductModel(title: "روز وردي", price: 799.0, image: "assets/image/3.png", category: "Shoes"),
    ProductModel(title: "روز وردي", price: 799.0, image: "assets/image/2.png", category: "Shoes"),
    ProductModel(title: "روز وردي", price: 799.0, image: "assets/image/3.png", category: "Shoes"),
    ProductModel(title: "روز وردي", price: 799.0, image: "assets/image/img_2.png", category: "Shoes"),
    ProductModel(title: "روز وردي", price: 799.0, image: "assets/image/2.png", category: "Shoes"),
  ];
  String selectedCategory = 'ورود';

  @override
  Widget build(BuildContext context) {
    final filteredProducts = selectedCategory == 'ورود'
        ? products
        : products.where((p) => p.category == selectedCategory).toList();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBarRow(),
            const SizedBox(height: 14),
            const BannerSlider(),
            const SizedBox(height: 10),
            AppTexts(data: "الفئات", textColor: AppColors.black).headingMS(),
            buildCategoriesTabs(),
            const SizedBox(height: 4),
            AppTexts(data: "جديد", textColor: AppColors.black).headingMS(),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return ProductCard(product: filteredProducts[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoriesTabs() {
    return Row(
      children: List.generate(categories.length, (index) {
        final cat = categories[index];
        final isSelected = selectedCategory == cat;
        return Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = cat;
              });
            },
            child: Container(
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.pink : Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.pink, width: 1.2),
              ),
              alignment: Alignment.center,
              child: Text(
                cat,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : AppColors.pink,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppTexts(data: 'Cart Screen', textColor: AppColors.black).headingML(),
    );
  }
}

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavBarItem(icon: Icons.shopping_cart_checkout, label: "السلة", isSelected: currentIndex == 1, onTap: () => onTap(1)),
          NavBarItem(icon: Icons.favorite_border, label: "المفضلة", isSelected: currentIndex == 2, onTap: () => onTap(2)),
          NavBarItem(icon: Icons.home_outlined, label: "الرئيسية", isSelected: currentIndex == 0, onTap: () => onTap(0)),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavBarItem({super.key, required this.icon, required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? AppColors.pink : Colors.grey, size: 28),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(color: isSelected ? AppColors.pink : Colors.grey, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
