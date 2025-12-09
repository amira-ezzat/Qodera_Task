// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../styles/app_texts.dart';
// import '../utils/app_colors.dart';
// import '../utils/app_icons.dart';
//
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String? title;
//   final bool showSearch;
//   final bool centerTitle;
//   final TextEditingController? searchController;
//   final bool isSearching;
//   final VoidCallback? onSearchToggle;
//
//   const CustomAppBar({
//     super.key,
//     this.title,
//     this.showSearch = false,
//     this.centerTitle = true,
//     this.searchController,
//     this.isSearching = false,
//     this.onSearchToggle,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
//       elevation: 0,
//       centerTitle: centerTitle,
//       title: AppTexts(data: title ?? '').Bold20(context),
//       actions: [
//         if (showSearch)
//           Padding(
//             padding: const EdgeInsets.only(right: 12),
//             child: _buildSearchBar(context),
//           ),
//       ],
//     );
//   }
//
//   @override
//   Size get preferredSize => const Size.fromHeight(72);
//
//   Widget _buildSearchBar(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       width: isSearching
//           ? MediaQuery.of(context).size.width * 0.8 // زودنا المساحة شوية
//           : 48,
//       height: 48,
//       decoration: BoxDecoration(
//         color: Colors.transparent,
//         border: Border.all(
//           color: AppColors.grey5,
//           width: 1,
//         ),
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween, // 👈 أضف دي
//         children: [
//           if (isSearching)
//             Expanded(
//               child: TextField(
//                 controller: searchController,
//                 autofocus: true,
//                 decoration: const InputDecoration(
//                   hintText: 'Search...',
//                   border: InputBorder.none,
//                   contentPadding: EdgeInsets.symmetric(horizontal: 12),
//                 ),
//                 onSubmitted: (value) {
//                   debugPrint('Search for: $value');
//                 },
//               ),
//             ),
//           Flexible( // 👈 أضفنا Flexible علشان الأيقونة ما تكبرش أكتر من اللازم
//             child: IconButton(
//               icon: SvgPicture.asset(
//                 AppIconPaths.search,
//                 color: Theme.of(context).iconTheme.color,
//               ),
//               onPressed: onSearchToggle,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
