import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/core/styles/app_texts.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_icons.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final bool showTitle;
  final bool showBorder;
  final int maxLines;
  final TextInputType keyboardType;
  final bool isObscure;
  final VoidCallback? onToggleVisibility;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    this.title = '',
    this.hintText = '',
    this.borderColor,
    this.focusedBorderColor,
    this.showTitle = true,
    this.showBorder = true,
    this.maxLines = 1,
    required this.keyboardType,
    this.isObscure = false,
    this.onToggleVisibility,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle)
          Align(
            alignment: Alignment.centerRight,
            child:
            AppTexts(data: title, textColor: AppColors.black00).bodySBL(),
          ),
        if (showTitle) const SizedBox(height: 8),
        TextFormField(
          obscureText: isObscure,
          cursorColor: AppColors.black200,
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: validator,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.smokey800,
              fontSize: 14,
            ),
            filled: true,
            fillColor: Colors.white,
            hoverColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: borderColor ?? AppColors.grey7,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: focusedBorderColor ?? AppColors.green600,
                width: 1.5
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: AppColors.red600,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: AppColors.red600,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 0,
            ),
          ),
          style: const TextStyle(backgroundColor: Colors.white),
        ),
      ],
    );
  }
}