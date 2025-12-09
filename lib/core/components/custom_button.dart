import 'package:flutter/material.dart';
import 'package:flutter_task/core/styles/app_texts.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double height;
  final double? width;
  final bool isLoading;   // ← أضفنا باراميتر جديد

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.green900,
    this.textColor = Colors.white,
    this.borderRadius = 8.0,
    this.height = 47.0,
    this.width,
    this.isLoading = false,  // ← القيمة الافتراضية
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,   // تعطيل الزر أثناء اللودينج
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? const SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2.4,
          ),
        )
            : AppTexts(
         data:  text,
          textColor:textColor,
        ).bodyML(),
      ),
    );
  }
}
