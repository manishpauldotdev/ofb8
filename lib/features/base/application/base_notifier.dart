import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/base/application/base_state.dart';
import '../../../core/infrastructure/hive_database.dart';

class BaseNotifier extends StateNotifier<BaseState> {
  BaseNotifier(this._hiveDataBase, this._dio) : super(BaseState());

  final HiveDatabase _hiveDataBase;
  // ignore: unused_field
  final Dio _dio;

  void navigate(int index) {
    state = state.copyWith(pageIndex: index);
  }

  Future<void> initializeApp() async {
    await _hiveDataBase.init();
  }
}
