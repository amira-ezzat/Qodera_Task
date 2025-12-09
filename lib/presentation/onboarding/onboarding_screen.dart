// import 'package:flutter/material.dart';
// import 'package:flutter_task/core/styles/app_texts.dart';
// import 'package:flutter_task/core/utils/app_colors.dart';
//
// import '../../../../core/styles/app_texts.dart';
// import '../../../../core/utils/app_colors.dart';
// import '../../data/models/onboarding_model.dart';
//
// class OnboardingScreen extends StatelessWidget {
//   final OnboardingContent content;
//
//   const OnboardingScreen({super.key, required this.content});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(24.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Image.asset(content.imagePath), // Ensure image path is valid
//           ),
//           const SizedBox(height: 24),
//           AppTexts(
//             textAlign: TextAlign.center,
//             data: content.title,
//             textColor: AppColors.grey800,
//           ).headingBS(),
//           const SizedBox(height: 20),
//           AppTexts(
//             lineHeight: 2,
//             textAlign: TextAlign.center,
//             data: content.description,
//             textColor: AppColors.grey900,
//           ).bodyRL(),
//         ],
//       ),
//     );
//   }
// }
//
//
// /* class OnboardingScreen extends StatelessWidget {
//   final OnboardingContent content;
//
//   const OnboardingScreen({super.key, required this.content});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//
//       children: [
//         Image.asset(content.imagePath),
//
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               AppTexts(
//                 textAlign: TextAlign.center,
//                 data: content.title,
//                 textColor: AppColors.grey800,
//               ).headingBS(),
//               const SizedBox(height: 20),
//               AppTexts(
//                 lineHeight: 2,
//                 textAlign: TextAlign.center,
//                 data: content.description,
//                 textColor: AppColors.grey900,
//               ).bodyRL(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
//  */