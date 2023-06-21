import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/cctv.dart';
import '../views/screen/splash_screen.dart';
import '../views/screen/home_screen.dart';
import '../views/screen/video_screen.dart';
import '../views/screen/about_screen.dart';

class AppRoutes {
  static Page _splashScreenBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: SplashScreen(),
    );
  }

  static Page _homeScreenBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: HomeScreen()
    );
  }

  static Page _videoScreenBuilder(BuildContext context, GoRouterState state) {
    late Cctv cctvObject;
    if (state.extra != null && state.extra is Cctv) {
      cctvObject = state.extra! as Cctv;
    }
    return MaterialPage(child: VideoScreen(cctv: cctvObject));
  }

  static Page _aboutScreenBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: AboutScreen(),
    );
  }

  static final GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(
        name: 'splash',
        path: "/splash",
        pageBuilder: _splashScreenBuilder,
      ),
      GoRoute(
        name: "home",
        path: "/home",
        pageBuilder: _homeScreenBuilder,
        routes: [
          GoRoute(
            name: "video",
            path: "video",
            pageBuilder: _videoScreenBuilder,
          ),
          GoRoute(
            name: "about",
            path: "about",
            pageBuilder: _aboutScreenBuilder,
          ),
        ],
      ),
    ],
    initialLocation: "/splash",
  );
}