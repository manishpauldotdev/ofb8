// import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../infrastructure/hive_database.dart';

final dioProvider = Provider((ref) => Dio());
final hiveProvider = Provider((ref) => HiveDatabase.instance);
