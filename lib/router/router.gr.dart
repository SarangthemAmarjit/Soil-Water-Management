// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:soilmoisturedetector/pages/contactUs.page.dart' as _i2;
import 'package:soilmoisturedetector/pages/dashboard.dart' as _i3;
import 'package:soilmoisturedetector/pages/moisture.page.dart' as _i1;
import 'package:soilmoisturedetector/pages/soilNPK.page.dart' as _i4;
import 'package:soilmoisturedetector/pages/splash_screen.dart' as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    CommonGraphPage.name: (routeData) {
      final args = routeData.argsAs<CommonGraphPageArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CommonGraphPage(
          key: args.key,
          index: args.index,
        ),
      );
    },
    ContactPage.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ContactPage(),
      );
    },
    HomePage.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    SoilNpkPage.name: (routeData) {
      final args = routeData.argsAs<SoilNpkPageArgs>(
          orElse: () => const SoilNpkPageArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.SoilNpkPage(key: args.key),
      );
    },
    SplashRoutePage.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashScreenPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CommonGraphPage]
class CommonGraphPage extends _i6.PageRouteInfo<CommonGraphPageArgs> {
  CommonGraphPage({
    _i7.Key? key,
    required int index,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          CommonGraphPage.name,
          args: CommonGraphPageArgs(
            key: key,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'CommonGraphPage';

  static const _i6.PageInfo<CommonGraphPageArgs> page =
      _i6.PageInfo<CommonGraphPageArgs>(name);
}

class CommonGraphPageArgs {
  const CommonGraphPageArgs({
    this.key,
    required this.index,
  });

  final _i7.Key? key;

  final int index;

  @override
  String toString() {
    return 'CommonGraphPageArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i2.ContactPage]
class ContactPage extends _i6.PageRouteInfo<void> {
  const ContactPage({List<_i6.PageRouteInfo>? children})
      : super(
          ContactPage.name,
          initialChildren: children,
        );

  static const String name = 'ContactPage';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomePage extends _i6.PageRouteInfo<void> {
  const HomePage({List<_i6.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SoilNpkPage]
class SoilNpkPage extends _i6.PageRouteInfo<SoilNpkPageArgs> {
  SoilNpkPage({
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          SoilNpkPage.name,
          args: SoilNpkPageArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SoilNpkPage';

  static const _i6.PageInfo<SoilNpkPageArgs> page =
      _i6.PageInfo<SoilNpkPageArgs>(name);
}

class SoilNpkPageArgs {
  const SoilNpkPageArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'SoilNpkPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.SplashScreenPage]
class SplashRoutePage extends _i6.PageRouteInfo<void> {
  const SplashRoutePage({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRoutePage.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoutePage';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
