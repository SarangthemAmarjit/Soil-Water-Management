// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:soilmoisturedetector/pages/contactUs.page.dart' as _i1;
import 'package:soilmoisturedetector/pages/dashboard.dart' as _i2;
import 'package:soilmoisturedetector/pages/moisture.page.dart' as _i3;
import 'package:soilmoisturedetector/pages/soilNPK.page.dart' as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    ContactPage.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ContactPage(),
      );
    },
    HomePage.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    MoisturePage.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MoisturePage(),
      );
    },
    SoilNpkPage.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SoilNpkPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ContactPage]
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
/// [_i2.HomePage]
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
/// [_i3.MoisturePage]
class MoisturePage extends _i5.PageRouteInfo<void> {
  const MoisturePage({List<_i5.PageRouteInfo>? children})
      : super(
          MoisturePage.name,
          initialChildren: children,
        );

  static const String name = 'MoisturePage';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SoilNpkPage]
class SoilNpkPage extends _i5.PageRouteInfo<void> {
  const SoilNpkPage({List<_i5.PageRouteInfo>? children})
      : super(
          SoilNpkPage.name,
          initialChildren: children,
        );

  static const String name = 'SoilNpkPage';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
