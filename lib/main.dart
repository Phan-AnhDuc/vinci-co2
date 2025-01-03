import 'package:basegetxbloc/constant/custom_theme.dart';
import 'package:basegetxbloc/constant/text/codegen_loader.g.dart';
import 'package:basegetxbloc/shared/app_route.dart';
import 'package:basegetxbloc/shared/extension.dart';
import 'package:basegetxbloc/shared/localization_constraints.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: LocalizationConstraints.supportedLocales,
    startLocale: LocalizationConstraints.viLocale,
    fallbackLocale: LocalizationConstraints.viLocale,
    assetLoader: const CodegenLoader(),
    path: LocalizationConstraints.translationPath, // Path này không quan trọng. Không rỗng là được.
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    if (isTablet(context) == false) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
      ),
    );

    return GetMaterialApp(
      title: 'ONE Link',
      navigatorKey: AppRouteExt.navigatorKey,
      key: key,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: CustomTheme.fromContext(context).appTheme,
      initialRoute: AppRoute.SPALSH_SCREEN.name,
      onGenerateRoute: AppRouteExt.bindingRoute,
      initialBinding: AppBinding(),
      navigatorObservers: <NavigatorObserver>[routeObserver],
    );
  }
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    injectService();
  }

  void injectService() {}
}
