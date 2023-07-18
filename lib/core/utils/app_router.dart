import 'package:auto_route/auto_route.dart';
import 'package:music_demo/feature/home/view/home_screen.dart';
part 'app_router.gr.dart';

@RoutePage()
class HomeRouterPage extends AutoRouter {
  const HomeRouterPage({super.key});
}

@RoutePage()
class LibraryRouterPage extends AutoRouter {
  const LibraryRouterPage({super.key});
}

@RoutePage()
class RadioRouterPage extends AutoRouter {
  const RadioRouterPage({super.key});
}

@RoutePage()
class SearchRouterPage extends AutoRouter {
  const SearchRouterPage({super.key});
}

@AutoRouterConfig(replaceInRouteName: 'Screen,Route',)
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: DashboardRoute.page,children: [
      // AutoRoute(page: HomeRouter)
    ])
  ];
}