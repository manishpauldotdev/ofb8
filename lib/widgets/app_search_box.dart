import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/assets.dart';
import '../core/styles/app_colors.dart';
import '../core/styles/app_text_styles.dart';

class AppSearchBox extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool firstLetterCapital;
  final bool isNumbers;
  final TextInputType? textInputType;
  final VoidCallback? onIconPressed;
  final VoidCallback? onPrefixIconPressed;
  final Function(String)? onChange;
  final bool showPrefixIcon;

  const AppSearchBox({
    super.key,
    required this.controller,
    required this.hintText,
    this.firstLetterCapital = true,
    this.isNumbers = false,
    this.textInputType,
    this.onIconPressed,
    this.onPrefixIconPressed,
    required this.onChange,
    this.showPrefixIcon = false,
  });

  @override
  State<AppSearchBox> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppSearchBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          minLines: 1,
          maxLines: null,
          textCapitalization: widget.firstLetterCapital
              ? TextCapitalization.sentences
              : TextCapitalization.none,
          keyboardType: widget.textInputType,
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          cursorColor: AppColors.colorSecondary,
          onChanged: widget.onChange,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.colorPrimary,
            prefixIcon: widget.showPrefixIcon
                ? Padding(
                    padding: const EdgeInsets.only(left: 10.0).r,
                    child: CircleAvatar(
                      backgroundColor: AppColors.colorAccent2,
                      child: IconButton(
                        onPressed: () {
                          widget.onPrefixIconPressed?.call();
                        },
                        icon: Transform.translate(
                          offset: const Offset(-2, 0),
                          child: Image.asset(Assets.arrowLeft),
                        ),
                      ),
                    ),
                  )
                : null,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 10.0).r,
              child: CircleAvatar(
                backgroundColor: AppColors.colorAccent2,
                child: IconButton(
                  onPressed: () {
                    widget.onIconPressed?.call();
                  },
                  icon: Icon(Icons.filter_list_outlined),
                ),
              ),
            ),
            hintText: widget.hintText,
            hintStyle: AppTextStyles.textStylePoppinsRegular.copyWith(
              color: AppColors.colorSecondary,
              fontSize: 16.sp,
            ),
            prefix: SizedBox(width: 10),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColors.colorBorder),
              borderRadius: BorderRadius.circular(100).r,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColors.colorBorder),
              borderRadius: BorderRadius.circular(100).r,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColors.colorBorder),
              borderRadius: BorderRadius.circular(100).r,
            ),
          ),
        ),
        20.verticalSpace,
      ],
    );
  }
}
