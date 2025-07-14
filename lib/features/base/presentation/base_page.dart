import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ofb8/core/constants/assets.dart';
import 'package:ofb8/core/styles/app_colors.dart';
import 'package:ofb8/features/base/presentation/widget/app_navigation_item.dart';
import 'package:ofb8/features/base/shared/provider.dart';
import 'package:ofb8/features/connect/presentation/connect_page.dart';
import 'package:ofb8/features/explore/presentation/explore_page.dart';
import 'package:ofb8/features/favorite/presentation/favorite_page.dart';
import 'package:ofb8/features/home/presentation/home_page.dart';
import 'package:ofb8/features/trip/presentation/trip_page.dart';

class BasePage extends ConsumerStatefulWidget {
  const BasePage({super.key});

  @override
  ConsumerState<BasePage> createState() => _BasePageState();
}

class _BasePageState extends ConsumerState<BasePage> {
  final baseNavigationPages = [
    HomePage(),
    ExplorePage(),
    TripPage(),
    FavoritePage(),
    ConnectPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(baseNotifierProvider);
    final stateNotifier = ref.read(baseNotifierProvider.notifier);

    return Scaffold(
      body: Stack(
        children: [
          baseNavigationPages[state.pageIndex],
          Positioned(
            bottom: 40.r,
            left: 12.r,
            right: 12.r,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12).r,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12).r,
              decoration: BoxDecoration(
                color: AppColors.colorBlack.withAlpha(200),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppNavigationItem(
                    index: 0,
                    selectedIndex: state.pageIndex,
                    onTap: () => stateNotifier.navigate(0),
                    icon: Assets.home,
                    selectedIcon: Assets.homeSelected,
                  ),
                  AppNavigationItem(
                    index: 1,
                    selectedIndex: state.pageIndex,
                    onTap: () => stateNotifier.navigate(1),
                    icon: Assets.map,
                    selectedIcon: Assets.mapSelected,
                  ),
                  AppNavigationItem(
                    index: 2,
                    selectedIndex: state.pageIndex,
                    onTap: () => stateNotifier.navigate(2),
                    icon: Assets.briefcase,
                    selectedIcon: Assets.briefcaseSelected,
                  ),
                  AppNavigationItem(
                    index: 3,
                    selectedIndex: state.pageIndex,
                    onTap: () => stateNotifier.navigate(3),
                    icon: Assets.heart,
                    selectedIcon: Assets.heartSelected,
                  ),
                  AppNavigationItem(
                    index: 4,
                    selectedIndex: state.pageIndex,
                    onTap: () => stateNotifier.navigate(4),
                    icon: Assets.message,
                    selectedIcon: Assets.messageSelected,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
