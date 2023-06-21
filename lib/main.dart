import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garut_cctv/theme.dart';

import 'controllers/apps_routes.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: CustomTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      routerDelegate: AppRoutes.goRouter.routerDelegate,
      routeInformationParser: AppRoutes.goRouter.routeInformationParser,
      routeInformationProvider: AppRoutes.goRouter.routeInformationProvider,
    );
  }
}
