import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/styles/app_colors.dart';
import '../core/styles/app_text_styles.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String label;
  final String hintText;
  final bool firstLetterCapital;
  final bool isNumbers;
  final TextInputType? textInputType;
  final bool isEdittable;
  final String prefixIcon;
  final int minLine;
  final bool isMandatory;
  final Function(String?)? validator;

  const AppTextField({
    super.key,
    this.controller,
    this.label = '',
    required this.hintText,
    this.firstLetterCapital = true,
    this.isNumbers = false,
    this.textInputType,
    this.isEdittable = false,
    this.prefixIcon = '',
    this.minLine = 1,
    this.isMandatory = false,
    this.validator,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label.isNotEmpty) ...[
          Row(
            children: [
              Text(
                widget.label,
                style: AppTextStyles.textStyleOutfitMedium.copyWith(fontSize: 18.sp),
              ),
              if (widget.isMandatory) ...[
                Text(
                  '*',
                  style: AppTextStyles.textStyleOutfitMedium.copyWith(
                    fontSize: 18.sp,
                    color: AppColors.colorRed,
                  ),
                ),
              ],
            ],
          ),
          6.verticalSpace,
        ],
        TextFormField(
          controller: widget.controller,
          minLines: widget.minLine,
          maxLines: null,
          textCapitalization: widget.firstLetterCapital
              ? TextCapitalization.sentences
              : TextCapitalization.none,
          keyboardType: widget.textInputType,
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          cursorColor: AppColors.colorSecondary,
          enabled: widget.isEdittable,
          validator: (value) => widget.validator?.call(value),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            filled: !widget.isEdittable,
            fillColor: widget.isEdittable ? AppColors.colorPrimary : AppColors.colorAccent,
            prefixIcon: widget.prefixIcon.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 8.r,
                      height: 8.r,
                      child: CircleAvatar(
                        backgroundColor: AppColors.colorPrimary,
                        child: Image.asset(widget.prefixIcon),
                      ),
                    ),
                  )
                : null,
            hintText: widget.hintText,
            hintStyle: AppTextStyles.textStylePoppinsRegular.copyWith(
              color: AppColors.colorNeutral1,
              fontSize: 16.sp,
            ),
            border: OutlineInputBorder(
              borderSide: widget.isEdittable
                  ? BorderSide(width: 1, color: AppColors.colorBorder)
                  : BorderSide(width: 0, color: AppColors.colorTransparent),
              borderRadius: BorderRadius.circular(12).r,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: widget.isEdittable
                  ? BorderSide(width: 1, color: AppColors.colorSecondary)
                  : BorderSide(width: 0, color: AppColors.colorTransparent),
              borderRadius: BorderRadius.circular(12).r,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: widget.isEdittable
                  ? BorderSide(width: 1, color: AppColors.colorSecondary)
                  : BorderSide(width: 0, color: AppColors.colorTransparent),
              borderRadius: BorderRadius.circular(12).r,
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: widget.isEdittable
                  ? BorderSide(width: 1, color: AppColors.colorBorder)
                  : BorderSide(width: 0, color: AppColors.colorTransparent),
              borderRadius: BorderRadius.circular(12).r,
            ),
          ),
        ),
        20.verticalSpace,
      ],
    );
  }
}
