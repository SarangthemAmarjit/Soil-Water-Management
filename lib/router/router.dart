import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        //HomeScreen is generated as HomeRoute because
        //of the replaceInRouteName property
        AutoRoute(
          path: '/',
          page: SplashRoutePage.page,
        ),
        AutoRoute(
          path: '/dashboard',
          page: HomePage.page,
        ),

        AutoRoute(path: '/moisturePage', page: CommonGraphPage.page),
        AutoRoute(path: '/npkPage', page: SoilNpkPage.page),
        AutoRoute(path: '/contactPage', page: ContactPage.page),
      ];
}
