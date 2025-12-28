import 'package:flutter/widgets.dart';
import 'package:shared/shared.dart';

@LazySingleton()
class RouteService {
  static GoRouter? _router;
  static String? _initialLocation;

  /// Inisialisasi router dengan daftar routes dinamis
  void initRouter(
    List<GoRoute> routes, {
    String? initialLocation,
    GoRouter? customRouter,
    GlobalKey<NavigatorState>? navigatorKey,
    String? Function(BuildContext context, GoRouterState state)? redirect,
    List<NavigatorObserver>? observers,
  }) {
    if (_router != null) return; // Hanya bisa diinisialisasi sekali

    // Simpan initial location
    _initialLocation = initialLocation;

    _router =
        customRouter ??
        GoRouter(
          initialLocation: initialLocation,
          routes: routes,
          debugLogDiagnostics: true,
          navigatorKey: navigatorKey,
          redirect: redirect,
          observers: observers,
        );
  }

  /// Mengambil instance router yang sudah diinisialisasi
  GoRouter get router {
    if (_router == null) {
      throw Exception(
        'Router belum diinisialisasi. Panggil RouteService.initRouter terlebih dahulu.',
      );
    }
    return _router!;
  }

  /// Mengambil initial location yang diset saat inisialisasi router
  String? get initialLocation => _initialLocation;

  /// (Opsional) Reset router jika ingin re-inisialisasi (misal untuk testing)
  static void resetRouter() {
    _router = null;
    _initialLocation = null;
  }
}
