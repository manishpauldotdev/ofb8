import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../core/shared/providers.dart';
import '../core/constants/app_urls.dart';
import '../core/routes/app_router.dart';

void main() async {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    runApp(ProviderScope(child: MainApp()));
  });
}

final initializationProvider = FutureProvider<void>((ref) async {
  await ref.read(hiveProvider).init();

  ref.read(dioProvider)
    ..options = BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      validateStatus: (status) {
        return true;
      },
      baseUrl: '${AppUrls.baseUrl}/',
    )
    ..interceptors;

  ref.read(dioProvider).interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true));
});

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initializationProvider, (_, _) {});
    return ScreenUtilInit(
      designSize: const Size(430, 940),
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return OKToast(child: MaterialApp.router(routerConfig: router));
      },
    );
  }
}
