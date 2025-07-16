import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ofb8/core/styles/app_colors.dart';
import 'package:ofb8/core/styles/app_text_styles.dart';
import 'package:ofb8/widgets/app_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.verticalSpace,
                Row(
                  children: [
                    Container(
                      height: 52.r,
                      width: 52.r,
                      decoration: BoxDecoration(
                        color: AppColors.colorPrimary,
                        border: Border.all(width: 1, color: AppColors.colorNeutral1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.person),
                    ),
                    12.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hey, Manish 👋',
                          style: AppTextStyles.textStyleOutfitSemiBold.copyWith(fontSize: 22.r),
                        ),
                        // 2.verticalSpace,
                        Text(
                          'Welcome to Ofb8',
                          style: AppTextStyles.textStyleOutfitSemiBold.copyWith(fontSize: 16.r),
                        ),
                      ],
                    ),
                    const Spacer(),
                    CircleAvatar(maxRadius: 24.r, child: Icon(Icons.notifications_active)),
                  ],
                ),
                20.verticalSpace,

                /// Showcase properties
                /// If any particular location is not chosen or location permission not granted
                /// show all properties
                /// Otherwise, show the options from chosen city
                Text(
                  'Discover',
                  style: AppTextStyles.textStylePoppinsSemiBold.copyWith(fontSize: 22.r),
                ),
                20.verticalSpace,
                SizedBox(
                  height: 220.r,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          Container(
                            height: 160,
                            width: 110,
                            margin: const EdgeInsets.only(right: 10).r,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: AppColors.colorBlack),
                              borderRadius: BorderRadius.circular(12).r,
                            ),
                            child: FlutterLogo(),
                          ),
                          8.verticalSpace,
                          Text(
                            'Homestays',
                            style: AppTextStyles.textStylePoppinsSemiBold.copyWith(fontSize: 16.r),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                10.verticalSpace,
                AppButton(
                  text: 'Allow Location Permission',
                  backgroundColor: AppColors.colorBlack.withAlpha(200),
                  onPressed: () {},
                ),
                20.verticalSpace,
                Row(
                  children: [
                    Text(
                      'Top Picks for August',
                      style: AppTextStyles.textStylePoppinsSemiBold.copyWith(fontSize: 22.r),
                    ),
                    const Spacer(),
                    Text(
                      'see all',
                      style: AppTextStyles.textStylePoppinsSemiBold.copyWith(
                        fontSize: 14.r,
                        color: AppColors.colorOrange,
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                Center(
                  child: Wrap(
                    children: List.generate(8, (index) {
                      return Container(
                        height: 90.r,
                        width: 90.r,
                        margin: EdgeInsets.only(
                          right: ((index + 1) % 4 == 0) ? 0 : 10,
                          bottom: 10,
                        ).r,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: AppColors.colorBlack),
                          borderRadius: BorderRadius.circular(12).r,
                        ),
                        child: FlutterLogo(),
                      );
                    }),
                  ),
                ),
                10.verticalSpace,
                Row(
                  children: [
                    Text(
                      'Activities',
                      style: AppTextStyles.textStylePoppinsSemiBold.copyWith(fontSize: 22.r),
                    ),
                    const Spacer(),
                    Text(
                      'see all',
                      style: AppTextStyles.textStylePoppinsSemiBold.copyWith(
                        fontSize: 14.r,
                        color: AppColors.colorOrange,
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                Center(
                  child: Wrap(
                    children: List.generate(4, (index) {
                      return Container(
                        height: 200.r,
                        width: (MediaQuery.sizeOf(context).width - 42) * 0.5,
                        margin: EdgeInsets.only(
                          right: ((index + 1) % 2 == 0) ? 0 : 10,
                          bottom: 10,
                        ).r,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: AppColors.colorBlack),
                          borderRadius: BorderRadius.circular(12).r,
                        ),
                        child: FlutterLogo(),
                      );
                    }),
                  ),
                ),
                20.verticalSpace,
                Row(
                  children: [
                    Text(
                      'Festivals',
                      style: AppTextStyles.textStylePoppinsSemiBold.copyWith(fontSize: 22.r),
                    ),
                    const Spacer(),
                    Text(
                      'see all',
                      style: AppTextStyles.textStylePoppinsSemiBold.copyWith(
                        fontSize: 14.r,
                        color: AppColors.colorOrange,
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                Center(
                  child: Wrap(
                    children: List.generate(4, (index) {
                      return Container(
                        height: 90.r,
                        width: 90.r,
                        margin: EdgeInsets.only(
                          right: ((index + 1) % 4 == 0) ? 0 : 10,
                          bottom: 10,
                        ).r,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: AppColors.colorBlack),
                          borderRadius: BorderRadius.circular(12).r,
                        ),
                        child: FlutterLogo(),
                      );
                    }),
                  ),
                ),
                20.verticalSpace,
                Text(
                  'Plan by Month',
                  style: AppTextStyles.textStylePoppinsSemiBold.copyWith(fontSize: 22.r),
                ),
                20.verticalSpace,
                Center(
                  child: Wrap(
                    children: List.generate(12, (index) {
                      return Container(
                        height: 90.r,
                        width: 90.r,
                        margin: EdgeInsets.only(
                          right: ((index + 1) % 4 == 0) ? 0 : 10,
                          bottom: 10,
                        ).r,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: AppColors.colorBlack),
                          borderRadius: BorderRadius.circular(12).r,
                        ),
                        child: FlutterLogo(),
                      );
                    }),
                  ),
                ),
                20.verticalSpace,
                Row(
                  children: [
                    Text(
                      'Explore by State',
                      style: AppTextStyles.textStylePoppinsSemiBold.copyWith(fontSize: 22.r),
                    ),
                    const Spacer(),
                    Text(
                      'see all',
                      style: AppTextStyles.textStylePoppinsSemiBold.copyWith(
                        fontSize: 14.r,
                        color: AppColors.colorOrange,
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                Center(
                  child: Wrap(
                    children: List.generate(4, (index) {
                      return Container(
                        height: 90.r,
                        width: 190.r,
                        margin: EdgeInsets.only(
                          right: ((index + 1) % 2 == 0) ? 0 : 10,
                          bottom: 10,
                        ).r,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: AppColors.colorBlack),
                          borderRadius: BorderRadius.circular(12).r,
                        ),
                        child: FlutterLogo(),
                      );
                    }),
                  ),
                ),
                200.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
