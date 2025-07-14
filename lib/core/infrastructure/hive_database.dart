import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveDatabase {
  HiveDatabase._internal();

  static final HiveDatabase instance = HiveDatabase._internal();

  late Box _box;
  bool _initialized = false;

  Box get box {
    if (!_initialized) {
      throw Exception("HiveDatabase.init() must be called first");
    }
    return _box;
  }

  Future<void> init() async {
    if (_initialized) return;

    final dbDirectory = await getApplicationDocumentsDirectory();
    Hive.init(dbDirectory.path);
    _box = await Hive.openBox<String>('Database');
    _initialized = true;
  }
}

class AppPreferenceKeys {
  static const String token = 'token';
  static const String preferredLanguage = 'preferredLanguage';
}
