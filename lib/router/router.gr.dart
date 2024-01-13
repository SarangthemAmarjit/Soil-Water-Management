// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:soilmoisturedetector/pages/contactUs.page.dart' as _i2;
import 'package:soilmoisturedetector/pages/dashboard.dart' as _i3;
import 'package:soilmoisturedetector/pages/moisture.page.dart' as _i1;
import 'package:soilmoisturedetector/pages/soilNPK.page.dart' as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    CommonGraphPage.name: (routeData) {
      final args = routeData.argsAs<CommonGraphPageArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CommonGraphPage(
          key: args.key,
          index: args.index,
        ),
      );
    },
    ContactPage.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ContactPage(),
      );
    },
    HomePage.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    SoilNpkPage.name: (routeData) {
      final args = routeData.argsAs<SoilNpkPageArgs>(
          orElse: () => const SoilNpkPageArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.SoilNpkPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.CommonGraphPage]
class CommonGraphPage extends _i5.PageRouteInfo<CommonGraphPageArgs> {
  CommonGraphPage({
    _i6.Key? key,
    required int index,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          CommonGraphPage.name,
          args: CommonGraphPageArgs(
            key: key,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'CommonGraphPage';

  static const _i5.PageInfo<CommonGraphPageArgs> page =
      _i5.PageInfo<CommonGraphPageArgs>(name);
}

class CommonGraphPageArgs {
  const CommonGraphPageArgs({
    this.key,
    required this.index,
  });

  final _i6.Key? key;

  final int index;

  @override
  String toString() {
    return 'CommonGraphPageArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i2.ContactPage]
class ContactPage extends _i5.PageRouteInfo<void> {
  const ContactPage({List<_i5.PageRouteInfo>? children})
      : super(
          ContactPage.name,
          initialChildren: children,
        );

  static const String name = 'ContactPage';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomePage extends _i5.PageRouteInfo<void> {
  const HomePage({List<_i5.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SoilNpkPage]
class SoilNpkPage extends _i5.PageRouteInfo<SoilNpkPageArgs> {
  SoilNpkPage({
    _i6.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          SoilNpkPage.name,
          args: SoilNpkPageArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SoilNpkPage';

  static const _i5.PageInfo<SoilNpkPageArgs> page =
      _i5.PageInfo<SoilNpkPageArgs>(name);
}

class SoilNpkPageArgs {
  const SoilNpkPageArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'SoilNpkPageArgs{key: $key}';
  }
}
