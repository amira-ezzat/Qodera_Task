import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/core/components/custom_button.dart';
import 'package:flutter_task/core/styles/app_texts.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_images.dart';
import 'package:flutter_task/presentation/page/home_screen.dart';
import 'package:flutter_task/presentation/screens/home/finger_screen.dart';
import 'package:flutter_task/presentation/screens/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;

  const OtpScreen({super.key, required this.verificationId});
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  bool _isLoading = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    for (var c in otpControllers) c.dispose();

    super.dispose();
  }

  void showCustomSnackBar(String message, Color bgColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, textAlign: TextAlign.center),
        backgroundColor: bgColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      ),
    );
  }

  Future<void> _onVerifyPressed() async {
    final smsCode = otpControllers.map((c) => c.text).join();
    if (smsCode.length < 6) {
      showCustomSnackBar('من فضلك أدخل الكود بالكامل', Colors.red);
      return;
    }
    setState(() => _isLoading = true);
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: smsCode,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      if (mounted) {
        showCustomSnackBar('تم تفعيل الحساب بنجاح', Colors.green);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const FingerScreen()),
        );
      }
    } catch (e) {
      showCustomSnackBar('الكود غير صحيح أو منتهي الصلاحية', Colors.red);
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenPrimary,
      body: Container(
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'تأكيد الحساب',
                      style: GoogleFonts.cairo(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'الرجاء إدخال رمز OTP لتأكيد حسابك',
                      style: GoogleFonts.cairo(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 44),

              // الكونتينر الأبيض يأخذ باقي الصفحة
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
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 22),

                          // الصورة
                          Image.asset(
                            AppImagesPaths.otp,
                            height: 222,
                            width: 444,
                          ),

                          const SizedBox(height: 44),

                          // مربعات OTP
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(6, (index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 3,
                                  ),
                                  child: SizedBox(
                                    width: 45,
                                    height: 45,
                                    child: TextField(
                                      controller: otpControllers[index],
                                      keyboardType: TextInputType.number,
                                      cursorColor: AppColors.grey7,
                                      textAlign: TextAlign.center,
                                      maxLength: 1,
                                      decoration: InputDecoration(
                                        counterText: '',
                                        filled: true,
                                        fillColor: AppColors.primaryColor2,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          borderSide: BorderSide.none,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          borderSide: BorderSide(
                                            color: AppColors.green600,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          if (index < 5)
                                            FocusScope.of(context).nextFocus();
                                        } else {
                                          if (index > 0)
                                            FocusScope.of(
                                              context,
                                            ).previousFocus();
                                        }
                                      },
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                          const SizedBox(height: 22),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppTexts(
                                data: 'لم استقبل الرمز ',
                                textColor: AppColors.grey600,
                              ).bodyBS(),
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets
                                      .zero, // إزالة أي مسافة افتراضية
                                  minimumSize: Size(0, 0),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {
                                  // مسح كل خانات OTP
                                  for (var c in otpControllers) {
                                    c.clear();
                                  }

                                  // إعادة الفوكس لأول خانة
                                  FocusScope.of(
                                    context,
                                  ).requestFocus(FocusNode());
                                  Future.delayed(
                                    const Duration(milliseconds: 100),
                                    () {
                                      FocusScope.of(context).nextFocus();
                                    },
                                  );
                                },
                                child: AppTexts(
                                  data: 'إعادة الإرسال',
                                  textColor: AppColors.green600,
                                ).bodyBS(),
                              ),
                            ],
                          ),
                          const SizedBox(height: 44),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              CustomButton(
                                text: _isLoading ? '' : "تأكيد",
                                onPressed: () {
                                  if (!_isLoading) _onVerifyPressed();
                                },
                                isLoading: false,
                              ),
                              if (_isLoading)
                                const SizedBox(
                                  width: 26,
                                  height: 26,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.5,
                                    color: Colors.white,
                                  ),
                                ),
                            ],
                          )

                        ],
                      ),
                    ),
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
