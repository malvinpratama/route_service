import 'package:flutter/widgets.dart';
import 'package:shared/shared.dart';

class AppRouter extends RootStackRouter {
  final List<AutoRoute> _routes;
  final GlobalKey<NavigatorState> _navigatorKey;
  final List<AutoRouteGuard>? _guards;

  AppRouter({
    required List<AutoRoute> routes,
    GlobalKey<NavigatorState>? navigatorKey,
    List<AutoRouteGuard>? guards,
  })  : _routes = routes,
        _navigatorKey = navigatorKey ?? GlobalKey<NavigatorState>(),
        _guards = guards;

  @override
  List<AutoRoute> get routes => _routes;

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  List<AutoRouteGuard> get guards => _guards ?? super.guards;
}
