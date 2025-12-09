// // ignore_for_file: sized_box_for_whitespace
//
// import 'package:flutter/material.dart';
// import 'package:flutter_task/core/styles/app_texts.dart';
// import 'package:flutter_task/core/utils/app_colors.dart';
// import 'package:flutter_task/presentation/screens/login/login_screen.dart';
// import 'package:hoshi_app/core/styles/app_texts.dart';
// import 'package:hoshi_app/core/utils/app_colors.dart';
// import 'package:hoshi_app/features/auth/presentation/pages/Login/login_screen.dart';
// import 'package:hoshi_app/features/onboarding_screens/presentaion/onboarding/onboarding_screen.dart'
//     show OnboardingScreen;
//
// import 'package:hoshi_app/core/widgets/onboarding_widgets/dots_indicator.dart';
//
// import '../../../../core/widgets/onboarding_widgets/custom_buttons.dart';
// import '../../../../flavors/app_config.dart';
// import '../../data/models/onboarding_model.dart';
//
// class OnBoardingPageView extends StatefulWidget {
//   const OnBoardingPageView({super.key});
//
//   @override
//   State<OnBoardingPageView> createState() => _OnBoardingPageViewState();
// }
//
// class _OnBoardingPageViewState extends State<OnBoardingPageView> {
//   final PageController _pageController = PageController(initialPage: 0);
//   late final List<OnboardingContent> contentList;
//   int activePage = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     contentList = AppConfig.instance.onboardingContent;
//   }
//
//   void goToNextPage() {
//     if (activePage < contentList.length - 1) {
//       _pageController.nextPage(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     } else {
//       Navigator.pushReplacementNamed(context, '/accountTypeScreen');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.smokey50,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: PageView.builder(
//                 controller: _pageController,
//                 onPageChanged: (int page) {
//                   setState(() => activePage = page);
//                 },
//                 itemCount: contentList.length,
//                 itemBuilder: (context, index) {
//                   return OnboardingScreen(content: contentList[index]);
//                 },
//               ),
//             ),
//             const SizedBox(height: 16),
//             DotsIndicator(activeIndex: activePage),
//             const SizedBox(height: 24),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//               child: SizedBox(
//                 width: 280,
//                 height: 35,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => LoginScreen(),
//                           ),
//                         );
//                       },
//                       child:
//                           AppTexts(
//                             data: 'تخطي',
//                             textColor: AppColors.green600,
//                           ).buttonBS(),
//                     ),
//                     nextButton(
//                       title:
//                           activePage == contentList.length - 1
//                               ? 'ابدأ'
//                               : 'التالي',
//                       onTap: () {
//                         if (activePage == contentList.length - 1) {
//                           Navigator.pushReplacement(
//                             context,
//
//                             ///// make condition if logged in go to home , it not logged go to LoginScreen()
//                             /*  MaterialPageRoute(
//                               builder: (context) => LoginScreen(),
//                             ), */
//                             MaterialPageRoute(
//                               builder: (context) => LoginScreen(),
//                             ),
//                           );
//                         } else {
//                           goToNextPage();
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
