import 'package:MoveGreen/constant/custom_theme.dart';
import 'package:MoveGreen/constant/text/codegen_loader.g.dart';
import 'package:MoveGreen/custom_animation.dart';
import 'package:MoveGreen/shared/app_route.dart';
import 'package:MoveGreen/shared/extension.dart';
import 'package:MoveGreen/shared/localization_constraints.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configLoading();
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

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = Colors.transparent
    ..indicatorColor = Colors.white
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
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
      title: 'Move Green',
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
      builder: (context, child) {
        return EasyLoading.init()(context, child);
      },
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
