import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/styles/app_colors.dart';

class AppActionButton extends StatelessWidget {
  final String icon;

  const AppActionButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.colorAccent, width: 4),
        // borderRadius: BorderRadius.circular(50).r,
      ),
      child: Padding(padding: const EdgeInsets.all(10.0).r, child: Image.asset(icon)),
    );
  }
}
