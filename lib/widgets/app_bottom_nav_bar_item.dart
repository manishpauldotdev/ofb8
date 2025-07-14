import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/styles/app_text_styles.dart';

class AppBottomNavBarItem extends StatelessWidget {
  final String label;
  final String iconPath;
  final Color textColor;
  final VoidCallback onClick;

  const AppBottomNavBarItem({
    super.key,
    required this.label,
    required this.iconPath,
    required this.textColor,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Column(
        children: [
          Image.asset(iconPath),
          6.verticalSpace,
          Text(
            label,
            style: AppTextStyles.textStyleOutfitMedium.copyWith(color: textColor, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
