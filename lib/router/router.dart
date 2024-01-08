import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        //HomeScreen is generated as HomeRoute because
        //of the replaceInRouteName property
        //Todo-->
        AutoRoute(
          path: '/',
          page: HomePage.page,
        ),
        //todo-->
        AutoRoute(path: '/moisturePage', page: MoisturePage.page),
        // AutoRoute(path: '/', page: MoisturePage.page),
      ];
}
