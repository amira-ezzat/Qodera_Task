// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../../core/styles/app_texts.dart';
// import '../../core/utils/app_colors.dart';
// import '../../core/utils/app_icons.dart';
// import 'home/home_screen.dart';
//
// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});
//
//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 0;
//
//   static final List<Widget> _widgetOptions = <Widget>[
//     const HomeScreen(),
//     const Test(title: 'Search'),
//     const Test(title: 'Favorites'),
//     const Test(title: 'Profile'),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   Widget _buildNavItem({
//     required String iconPath,
//     required int index,
//   }) {
//     final bool isSelected = _selectedIndex == index;
//
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 250),
//       padding: EdgeInsets.symmetric(
//         horizontal: isSelected ? 10 : 0,
//         vertical: 6,
//       ),
//       decoration: BoxDecoration(
//         color: isSelected ? AppColors.blue : Colors.transparent,
//         borderRadius: BorderRadius.circular(24),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SvgPicture.asset(
//             iconPath,
//             height: 22,
//             width: 22,
//             color: isSelected ? AppColors.white : AppColors.grey7,
//           ),
//           if (isSelected) ...[
//             const SizedBox(width: 6),
//
//           ],
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _widgetOptions[_selectedIndex],
//       bottomNavigationBar: Container(
//         padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 6,
//               offset: const Offset(0, -2),
//             ),
//           ],
//         ),
//         child: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           currentIndex: _selectedIndex,
//           onTap: _onItemTapped,
//           showSelectedLabels: false,
//           showUnselectedLabels: false,
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//           items: [
//             BottomNavigationBarItem(
//               icon: _buildNavItem(
//                 iconPath: AppIconPaths.vector,
//                 index: 0,
//               ),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: _buildNavItem(
//                 iconPath: AppIconPaths.compass,
//                 index: 1,
//               ),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: _buildNavItem(
//                 iconPath: AppIconPaths.heart,
//                 index: 2,
//               ),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: _buildNavItem(
//                 iconPath: AppIconPaths.user,
//
//                 index: 3,
//               ),
//               label: '',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Test extends StatelessWidget {
//   final String title;
//   const Test({super.key, required this.title});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(
//           title,
//           style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
