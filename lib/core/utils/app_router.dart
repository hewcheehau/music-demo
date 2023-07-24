import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:music_demo/app.dart';
import 'package:music_demo/feature/home/view/home_screen.dart';
import 'package:music_demo/feature/library/view/library_screen.dart';
import 'package:music_demo/feature/radio/view/radio_screen.dart';
import 'package:music_demo/feature/search/model/music_item.dart';
import 'package:music_demo/feature/search/view/search_detail_screen.dart';
import 'package:music_demo/feature/search/view/search_screen.dart';
part 'app_router.gr.dart';

@RoutePage(name: "HomeRouter")
class HomeRouterPage extends AutoRouter {
  const HomeRouterPage({super.key});
}

@RoutePage(name: "LibraryRouter")
class LibraryRouterPage extends AutoRouter {
  const LibraryRouterPage({super.key});
}

@RoutePage(name: "RadioRouter")
class RadioRouterPage extends AutoRouter {
  const RadioRouterPage({super.key});
}

@RoutePage(name: "SearchRouter")
class SearchRouterPage extends AutoRouter {
  const SearchRouterPage({super.key});
}

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: DashboardRoute.page, 
        path: "/dashboard",
        children: [
          AutoRoute(
              page: HomeRouter.page,
              path: "home",
              children: [AutoRoute(page: HomeRoute.page, path: "")]),
          AutoRoute(
              page: LibraryRouter.page,
              path: "library",
              children: [AutoRoute(page: LibraryRoute.page, path: "")]),
          AutoRoute(
              page: RadioRouter.page,
              path: "radio",
              children: [AutoRoute(page: RadioRoute.page, path: "")]),
          AutoRoute(
              page: SearchRouter.page,
              path: "search",
              children: [AutoRoute(page: SearchRoute.page, path: ""),
              AutoRoute(page: SearchDetailRoute.page, path: "searchDetail")]),
        ])
      ];
}
