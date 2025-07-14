import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/base/presentation/base_page.dart';
// import '../../features/home/presentation/home_page.dart';

enum AppRoute { base, home }

final GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.base.name,
      pageBuilder: (context, state) {
        return MaterialPage(child: BasePage());
      },
    ),
  ],
);
