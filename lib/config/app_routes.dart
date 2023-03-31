import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator_apps/models/news.dart';
import 'package:navigator_apps/modul/home/home_screen.dart';
import 'package:navigator_apps/modul/news_detail/new_detail_screen.dart';

import '../models/user.dart';
import '../modul/splashscreen/splash_screen.dart';

class AppRoutes {
  static const String splash = 'splash';
  static const String home = 'home';
  static const String newDetail = 'news-detail';
  static const String profile = 'profile';

  static Page _splashScreenRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return MaterialPage(
      key: state.pageKey,
      child: const SplashScreen(),
    );
  }

  static Page _homeScreenRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    late User user;
    if (state.extra != null && state.extra is User) {
      user = state.extra as User;
    } else {
      user = User(
        id: 000,
        name: "Ayank Tio",
        userName: "20006146",
        email: "2006146@itg.ac.id",
        profileImage:
            "https://scontent-sin6-4.xx.fbcdn.net/v/t39.30808-6/315560104_2647497042050512_9097400968069790629_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFMvzrcyYAy31UZaocU5a51BDmDWCYCoPMEOYNYJgKg8xmR73dt-kNiraNwGzNHxmWZ4vVz2FFda8PXGx52UYMB&_nc_ohc=emIxv2NYtq4AX-ekDRw&_nc_ht=scontent-sin6-4.xx&oh=00_AfAGg0qkCtuC5rlIHurRl71XbTMAofCKx8hQc8OtCU8pGA&oe=642C116F",
        phoneNumber: "+8966455220",
      );
    }
    return CustomTransitionPage(
      child: HomeScreen(key: state.pageKey, user: user),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }

  static Page _newDetailRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    if (state.params['id'] != null) {
      return MaterialPage(
          child: NewsDetailScreen(
        news: state.extra as News,
      ));
    } else {
      return const MaterialPage(
          child: Scaffold(
        body: Center(
          child: Text("Data Not Found"),
        ),
      ));
    }
  }

  static final GoRouter goRouter = GoRouter(
    routerNeglect: true,
    routes: [
      GoRoute(
        name: splash,
        path: "/splash",
        pageBuilder: _splashScreenRouteBuilder,
      ),
      GoRoute(
        name: home,
        path: "/home",
        pageBuilder: _homeScreenRouteBuilder,
      ),
      GoRoute(
        name: newDetail,
        path: "/news-detail/:id",
        pageBuilder: _newDetailRouteBuilder,
      ),
    ],
    initialLocation: "/splash",
  );
}
