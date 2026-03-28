import 'package:flutter/widgets.dart';
import 'package:shared/shared.dart';

import 'app_router.dart';

@LazySingleton()
class RouteService {
  static AppRouter? _router;

  /// Inisialisasi router dengan daftar routes dari semua module
  void initRouter(
    List<AutoRoute> routes, {
    GlobalKey<NavigatorState>? navigatorKey,
    List<AutoRouteGuard>? guards,
  }) {
    if (_router != null) return;
    _router = AppRouter(
      routes: routes,
      navigatorKey: navigatorKey,
      guards: guards,
    );
  }

  /// Mengambil instance router yang sudah diinisialisasi
  RootStackRouter get router {
    if (_router == null) {
      throw Exception(
        'Router belum diinisialisasi. Panggil RouteService.initRouter terlebih dahulu.',
      );
    }
    return _router!;
  }

  /// Reset router untuk testing
  static void resetRouter() {
    _router = null;
  }
}
