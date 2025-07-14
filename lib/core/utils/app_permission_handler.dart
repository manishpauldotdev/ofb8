import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AppPermissionHandler {
  AppPermissionHandler._();

  static final AppPermissionHandler instance = AppPermissionHandler._();

  Future<void> requestLocationPermission({
    VoidCallback? onDenied,
    VoidCallback? onGranted,
    VoidCallback? onPermanentlyDenied,
  }) async {
    await Permission.location
        .onDeniedCallback(() {
          onDenied?.call();
        })
        .onGrantedCallback(() {
          onGranted?.call();
        })
        .onPermanentlyDeniedCallback(() {
          onPermanentlyDenied?.call();
        })
        .request();
  }
}
