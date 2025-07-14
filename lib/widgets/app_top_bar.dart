import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../core/styles/app_colors.dart';
import '../core/styles/app_text_styles.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showLeadingWidget;

  const AppTopBar({super.key, required this.title, this.showLeadingWidget = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.colorPrimary,
      automaticallyImplyLeading: showLeadingWidget,
      leading: showLeadingWidget
          ? GestureDetector(
              onTap: () => context.pop(),
              child: Padding(
                padding: const EdgeInsets.all(8.0).r,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.colorAccent,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(Icons.chevron_left),
                ),
              ),
            )
          : null,
      title: Text(
        title,
        style: AppTextStyles.textStyleOutfitSemiBold.copyWith(
          fontSize: 24.sp,
          color: AppColors.colorSecondary,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
