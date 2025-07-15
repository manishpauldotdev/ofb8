import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/styles/app_colors.dart';
import '../core/styles/app_text_styles.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback? onPressed;
  final double width;
  final bool showBorder;
  final bool isSocialButton;
  final String iconPath;
  final bool isLoading;
  final double fontSize;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.colorSecondary,
    this.textColor = AppColors.colorPrimary,
    this.width = double.maxFinite,
    this.showBorder = false,
    this.isSocialButton = false,
    this.iconPath = '',
    this.isLoading = false,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        shape: showBorder
            ? RoundedRectangleBorder(side: BorderSide(width: 1, color: AppColors.colorSecondary))
            : RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8)),
        backgroundColor: backgroundColor,
        minimumSize: Size(width, 60.r),
      ),
      child: isLoading
          ? CircularProgressIndicator()
          : isSocialButton
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 28.r, child: Image.asset(iconPath)),
                8.horizontalSpace,
                Text(
                  text,
                  style: AppTextStyles.textStyleOutfitBold.copyWith(
                    color: textColor,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            )
          : Text(
              text,
              style: AppTextStyles.textStyleOutfitBold.copyWith(
                color: textColor,
                fontSize: fontSize.sp,
              ),
            ),
    );
  }
}
