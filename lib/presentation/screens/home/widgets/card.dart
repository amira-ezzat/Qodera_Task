// import 'package:flutter/material.dart';
// import 'package:flutter_task/core/styles/app_texts.dart';
// import 'package:flutter_task/core/utils/app_colors.dart';
//
// class ProductCard extends StatelessWidget {
//   const ProductCard({super.key,});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//         side: const BorderSide(color: AppColors.black50, width: 1),
//       ),
//       color: Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             const Align(
//               alignment: Alignment.topLeft,
//               child: Icon(Icons.favorite_border, color: AppColors.grey300),
//             ),
//             Expanded(
//               child: Center(
//                 child: Image.network(
//                   product.image,
//                   fit: BoxFit.contain,
//                   loadingBuilder: (context, child, progress) {
//                     return progress == null
//                         ? child
//                         : const Center(child: CircularProgressIndicator());
//                   },
//                   errorBuilder: (context, error, stackTrace) {
//                     return const Icon(Icons.image_not_supported,
//                         color: AppColors.grey200);
//                   },
//                 ),
//               ),
//             ),
//             const SizedBox(height: 8),
//             AppTexts(
//               data: product.title,
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.right,
//             ).bodySBL(),
//             const Spacer(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   decoration: const BoxDecoration(
//                     color: AppColors.green500,
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Icon(Icons.add, color: Colors.white, size: 20),
//                 ),
//                 AppTexts(data: '\$${product.price}', textColor: AppColors.green500)
//                     .headingSBL(),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }