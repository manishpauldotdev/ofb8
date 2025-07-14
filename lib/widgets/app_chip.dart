import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/styles/app_text_styles.dart';

class AppChip extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;

  const AppChip({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.r,
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0).r,
      decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(100).r),
      child: Center(
        child: Text(
          text,
          style: AppTextStyles.textStyleOutfitMedium.copyWith(fontSize: 14.sp, color: textColor),
        ),
      ),
    );
  }
}
