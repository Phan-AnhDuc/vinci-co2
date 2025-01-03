// ignore_for_file: constant_identifier_names

import 'package:basegetxbloc/shared/page_material_route.dart';
import 'package:basegetxbloc/ui/login/login_screen.dart';
import 'package:basegetxbloc/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AppRoute {
  SPALSH_SCREEN,
  LOGIN_SCREEN,
}

extension AppRouteExt on AppRoute {
  String get name {
    switch (this) {
      case AppRoute.SPALSH_SCREEN:
        return '/splash';
      case AppRoute.LOGIN_SCREEN:
        return '/login_screen';
    }
  }

  static AppRoute? from(String? name) {
    for (final item in AppRoute.values) {
      if (item.name == name) {
        return item;
      }
    }
    return null;
  }

  static Route generateRoute(RouteSettings settings) {
    switch (AppRouteExt.from(settings.name)) {
      case AppRoute.SPALSH_SCREEN:
        return PageMaterialRoute(
          settings: settings,
          page: () => const SplashScreen(),
          bindings: [],
          transition: Transition.fade,
        );
      case AppRoute.LOGIN_SCREEN:
        return PageMaterialRoute(
          settings: settings,
          page: () => const LoginScreen(),
          bindings: [],
          transition: Transition.fade,
        );

      default:
        return GetPageRoute(settings: settings, curve: Curves.ease, transition: Transition.rightToLeft
            // page: () => EmptyScreen(desc: 'No route defined for ${settings.name}'),
            );
    }
  }

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static Route<dynamic> bindingRoute(RouteSettings settings) {
    return AppRouteExt.generateRoute(settings);
  }
}
