import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/styles/app_colors.dart';

class AppNavigationItem extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final VoidCallback onTap;
  final String icon;
  final String selectedIcon;

  const AppNavigationItem({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
    required this.icon,
    required this.selectedIcon,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = index == selectedIndex;

    return InkWell(
      onTap: onTap,
      child: isSelected
          ? CircleAvatar(
              backgroundColor: AppColors.colorPrimary,
              minRadius: 32.r,
              child: SvgPicture.asset(selectedIcon),
            )
          : SvgPicture.asset(icon),
    );
  }
}
