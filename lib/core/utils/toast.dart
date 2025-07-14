import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

import '../styles/app_colors.dart';
import '../styles/app_text_styles.dart';

Future<void> showToastMessage(String message, {String errorMessage = ''}) async {
  showToast(
    message,
    position: ToastPosition.bottom,
    margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
    duration: const Duration(seconds: 4),
    textPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30).r,
    backgroundColor: AppColors.colorSecondary,
    textStyle: AppTextStyles.textStylePoppinsMedium.copyWith(
      fontSize: 14.sp,
      color: AppColors.colorPrimary,
    ),
  );
}

Future<void> showDioError(DioException e) async {
  if (e.response != null) {
    await showToastMessage(e.response?.data as String);
  }
}

Future<void> showconnectionWasInterruptedToastMesage() async {
  await showToastMessage('Connection Was Interrupted');
}
