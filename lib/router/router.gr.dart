// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:soilmoisturedetector/pages/contactUs.page.dart' as _i2;
import 'package:soilmoisturedetector/pages/dashboard.dart' as _i3;
import 'package:soilmoisturedetector/pages/moisture.page.dart' as _i1;
import 'package:soilmoisturedetector/pages/servererrorcontroller.dart' as _i4;
import 'package:soilmoisturedetector/pages/servererrorpage.dart' as _i5;
import 'package:soilmoisturedetector/pages/soilNPK.page.dart' as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    CommonGraphPage.name: (routeData) {
      final args = routeData.argsAs<CommonGraphPageArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CommonGraphPage(
          key: args.key,
          index: args.index,
        ),
      );
    },
    ContactPage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ContactPage(),
      );
    },
    HomePage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    InitialPage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.InitialPage(),
      );
    },
    ServerErrorPage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ServerErrorPage(),
      );
    },
    SoilNpkPage.name: (routeData) {
      final args = routeData.argsAs<SoilNpkPageArgs>(
          orElse: () => const SoilNpkPageArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.SoilNpkPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.CommonGraphPage]
class CommonGraphPage extends _i7.PageRouteInfo<CommonGraphPageArgs> {
  CommonGraphPage({
    _i8.Key? key,
    required int index,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          CommonGraphPage.name,
          args: CommonGraphPageArgs(
            key: key,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'CommonGraphPage';

  static const _i7.PageInfo<CommonGraphPageArgs> page =
      _i7.PageInfo<CommonGraphPageArgs>(name);
}

class CommonGraphPageArgs {
  const CommonGraphPageArgs({
    this.key,
    required this.index,
  });

  final _i8.Key? key;

  final int index;

  @override
  String toString() {
    return 'CommonGraphPageArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i2.ContactPage]
class ContactPage extends _i7.PageRouteInfo<void> {
  const ContactPage({List<_i7.PageRouteInfo>? children})
      : super(
          ContactPage.name,
          initialChildren: children,
        );

  static const String name = 'ContactPage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomePage extends _i7.PageRouteInfo<void> {
  const HomePage({List<_i7.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.InitialPage]
class InitialPage extends _i7.PageRouteInfo<void> {
  const InitialPage({List<_i7.PageRouteInfo>? children})
      : super(
          InitialPage.name,
          initialChildren: children,
        );

  static const String name = 'InitialPage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ServerErrorPage]
class ServerErrorPage extends _i7.PageRouteInfo<void> {
  const ServerErrorPage({List<_i7.PageRouteInfo>? children})
      : super(
          ServerErrorPage.name,
          initialChildren: children,
        );

  static const String name = 'ServerErrorPage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SoilNpkPage]
class SoilNpkPage extends _i7.PageRouteInfo<SoilNpkPageArgs> {
  SoilNpkPage({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          SoilNpkPage.name,
          args: SoilNpkPageArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SoilNpkPage';

  static const _i7.PageInfo<SoilNpkPageArgs> page =
      _i7.PageInfo<SoilNpkPageArgs>(name);
}

class SoilNpkPageArgs {
  const SoilNpkPageArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'SoilNpkPageArgs{key: $key}';
  }
}
