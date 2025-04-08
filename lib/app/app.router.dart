// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i8;
import 'package:stacked/stacked.dart' as _i7;
import 'package:stacked_services/stacked_services.dart' as _i5;

import '../services/guard_service.dart' as _i6;
import '../ui/views/home/home_view.dart' as _i3;
import '../ui/views/login/login_view.dart' as _i2;
import '../ui/views/startup/startup_view.dart' as _i1;
import '../ui/views/unknown/unknown_view.dart' as _i4;

final stackedRouter = StackedRouterWeb(
  navigatorKey: _i5.StackedService.navigatorKey,
  authGuard: _i6.AuthGuard(),
);

class StackedRouterWeb extends _i7.RootStackRouter {
  StackedRouterWeb({
    _i8.GlobalKey<_i8.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i6.AuthGuard authGuard;

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    StartupViewRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginViewRoute.name: (routeData) {
      final args =
          routeData.argsAs<LoginViewArgs>(orElse: () => const LoginViewArgs());
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: _i2.LoginView(key: args.key),
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeViewRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    UnknownViewRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.UnknownView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          StartupViewRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          LoginViewRoute.name,
          path: '/login-view',
        ),
        _i7.RouteConfig(
          HomeViewRoute.name,
          path: '/home-view',
          guards: [authGuard],
        ),
        _i7.RouteConfig(
          UnknownViewRoute.name,
          path: '/404',
        ),
        _i7.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/404',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupViewRoute extends _i7.PageRouteInfo<void> {
  const StartupViewRoute()
      : super(
          StartupViewRoute.name,
          path: '/',
        );

  static const String name = 'StartupView';
}

/// generated route for
/// [_i2.LoginView]
class LoginViewRoute extends _i7.PageRouteInfo<LoginViewArgs> {
  LoginViewRoute({_i8.Key? key})
      : super(
          LoginViewRoute.name,
          path: '/login-view',
          args: LoginViewArgs(key: key),
        );

  static const String name = 'LoginView';
}

class LoginViewArgs {
  const LoginViewArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'LoginViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.HomeView]
class HomeViewRoute extends _i7.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '/home-view',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i4.UnknownView]
class UnknownViewRoute extends _i7.PageRouteInfo<void> {
  const UnknownViewRoute()
      : super(
          UnknownViewRoute.name,
          path: '/404',
        );

  static const String name = 'UnknownView';
}

extension RouterStateExtension on _i5.RouterService {
  Future<dynamic> navigateToStartupView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToLoginView({
    _i8.Key? key,
    void Function(_i7.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      LoginViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToHomeView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToUnknownView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStartupView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithLoginView({
    _i8.Key? key,
    void Function(_i7.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      LoginViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithUnknownView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }
}
