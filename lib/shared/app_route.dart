// ignore_for_file: constant_identifier_names

import 'package:MoveGreen/shared/page_material_route.dart';
import 'package:MoveGreen/ui/background_location/location_screen.dart';
import 'package:MoveGreen/ui/home_page/home_page.dart';
import 'package:MoveGreen/ui/login/bindings/login_bindings.dart';
import 'package:MoveGreen/ui/login/views/login_screen.dart';
import 'package:MoveGreen/ui/profile/binddings/profile_binddings.dart';
import 'package:MoveGreen/ui/profile/view/profile_screen.dart';
import 'package:MoveGreen/ui/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AppRoute {
  SPALSH_SCREEN,
  LOGIN_SCREEN,
  HOME_PAGE,
  PROFILE_SCREEN,
  BACKGROUND_SCREEN,
}

extension AppRouteExt on AppRoute {
  String get name {
    switch (this) {
      case AppRoute.SPALSH_SCREEN:
        return '/splash';
      case AppRoute.LOGIN_SCREEN:
        return '/login_screen';
      case AppRoute.HOME_PAGE:
        return '/home_page';
      case AppRoute.PROFILE_SCREEN:
        return '/proflie_screen';
      case AppRoute.BACKGROUND_SCREEN:
        return '/background_screen';
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
          bindings: [LoginBinding()],
          transition: Transition.fade,
        );
      case AppRoute.HOME_PAGE:
        return PageMaterialRoute(
          settings: settings,
          page: () => const HomePage(),
          bindings: [
            LoginBinding(),
            ProfileBinding(),
          ],
          transition: Transition.fade,
        );

      case AppRoute.PROFILE_SCREEN:
        return PageMaterialRoute(
          settings: settings,
          page: () => const ProfileScreen(),
          bindings: [ProfileBinding()],
          transition: Transition.fade,
        );

      case AppRoute.BACKGROUND_SCREEN:
        return PageMaterialRoute(
          settings: settings,
          page: () => const BackgroundScreen(),
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
