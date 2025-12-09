import 'package:flutter/material.dart';
import 'package:flutter_task/core/components/custom_button.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/presentation/screens/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class FingerScreen extends StatelessWidget {
  const FingerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.greenPrimary, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // الجزء العلوي: نصوص
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 22,),
                    Text(
                      "تسجيل الدخول بالبصمة",
                      style: GoogleFonts.cairo(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    // const SizedBox(height: 4),
                    // Text(
                    //   "يمكنك الدخول الي حسابك بسرعة وامان باستخدام بصمة الاصبع او التعرف على الوجه",
                    //   style: GoogleFonts.cairo(
                    //     fontSize: 16,
                    //     color: Colors.white70,
                    //   ),
                    // ),
                  ],
                ),
              ),

              const SizedBox(height: 77),

              // الجزء السفلي: الكونتينر الأبيض
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/image/f.png',
                        height: 200,
                        width: 200,
                      ),
                      const SizedBox(height: 24),
                      // Text(
                      //   "تسجيل الدخول بالبصمة او بالوجة",
                      //   style: GoogleFonts.cairo(
                      //     fontSize: 20,
                      //     fontWeight: FontWeight.bold,
                      //     color: Colors.black,
                      //   ),
                      //   textAlign: TextAlign.center,
                      // ),
                      // const SizedBox(height: 8),
                      Text(
                        "يمكنك الدخول الي حسابك بسرعة وامان باستخدام بصمة الاصبع او التعرف على الوجه",
                        style: GoogleFonts.cairo(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 33),
                      CustomButton(
                        text: "تفعيل",
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
