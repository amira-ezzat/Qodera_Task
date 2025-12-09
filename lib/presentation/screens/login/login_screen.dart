import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/core/components/custom_field.dart';
import 'package:flutter_task/core/components/custom_button.dart';
import 'package:flutter_task/core/styles/app_texts.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_images.dart';
import 'package:flutter_task/presentation/screens/home/finger_screen.dart';
import 'package:flutter_task/presentation/screens/login/otp_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool isLogin = true;

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  String? _validatePhone(String? phone) {
    if (phone == null || phone.isEmpty) {
      return "الرقم التعريفي لا يمكن أن يكون فارغاً";
    }
    final regex = RegExp(r'^[0-9]{6,15}$');
    if (!regex.hasMatch(phone)) {
      return "صيغة الرقم التعريفي غير صحيحة";
    }
    return null;
  }

  void _onLoginPressed() async {
    if (formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      String input = phoneController.text.trim();
      String phoneNumber = input.startsWith('+20') ? input : '+20$input';
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
          if (mounted) {
            setState(() => _isLoading = false);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const FingerScreen()),
            );
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          if (mounted) {
            setState(() => _isLoading = false);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('فشل التحقق: ${e.message}')));
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          if (mounted) {
            setState(() => _isLoading = false);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtpScreen(verificationId: verificationId),
              ),
            );
          }
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          if (mounted) setState(() => _isLoading = false);
        },
        timeout: const Duration(seconds: 60),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.greenPrimary),
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
              // النص "تسجيل الدخول"
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      'تسجيل الدخول',
                      style: GoogleFonts.cairo(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),

                    Text(
                      'رحلتك تبدا من هنا - سجل الدخول',
                      style: GoogleFonts.cairo(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 44),

              // الكونتينر الأبيض ياخد باقي الصفحة
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 22),

                        buildTabs(),
                        SizedBox(height: 55),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              CustomTextField(
                                title: 'الرقم التعريفي',
                                hintText: 'الرقم التعريفي',
                                controller: phoneController,
                                keyboardType: TextInputType.number,
                                validator: _validatePhone,   // ← هنا الفاليديشن هيشتغل
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 66),

                        Stack(
                          alignment: Alignment.center,
                          children: [
                            CustomButton(
                              text: _isLoading ? '' : 'تسجيل الدخول',
                              onPressed: _isLoading ? () {} : _onLoginPressed,
                            ),
                            if (_isLoading)
                              const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2.5,
                                ),
                              ),
                          ],
                        ),
                      ],
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

  Widget buildTabs() {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.grey.shade300, // لون الكونتينر الخارجي رمادي
        borderRadius: BorderRadius.circular(30), // ريديس للكونتينر
      ),
      child: Row(
        children: [
          Expanded(child: _tabButton("انشاء حساب", false)),

          Expanded(child: _tabButton("تسجيل الدخول", true)),
        ],
      ),
    );
  }

  Widget _tabButton(String text, bool loginTab) {
    bool active = (loginTab && isLogin) || (!loginTab && !isLogin);

    return InkWell(
      onTap: () => setState(() => isLogin = loginTab),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        height: 45,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(
          2,
        ), // مسافة بسيطة بين الزرار وحدود الكونتينر
        decoration: BoxDecoration(
          color: active
              ? Colors.white
              : Colors.transparent, // زرار أبيض عند التحديد
          borderRadius: BorderRadius.circular(25), // ريديس للزرار نفسه
        ),
        child: Text(
          text,
          style: GoogleFonts.cairo(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: active
                ? Colors.black
                : Colors.grey.shade600, // نص أزرق عند التحديد
          ),
        ),
      ),
    );
  }
}
