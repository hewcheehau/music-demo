import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:music_demo/core/constants/string_constants.dart';
import 'package:music_demo/core/utils/app_router.dart';
import 'package:music_demo/core/utils/app_scroll_behavior.dart';
import 'package:music_demo/data/service_locator.dart';
import 'package:music_demo/feature/home/cubit/bottom_navigation_cubit.dart';
import 'package:music_demo/feature/home/view/home_nav_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'feature/search/bloc/bloc/search_bloc.dart';

class AppleMusicApp extends StatelessWidget {
  const AppleMusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = sl<AppRouter>();
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavigationCubit>(
            create: (context) => BottomNavigationCubit()),
        BlocProvider<SearchBloc>(create: (context) => SearchBloc()),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          primaryColor: Colors.red,
          useMaterial3: true,
        ),
        title: StringConstants.appTitle,
        routeInformationParser: router.defaultRouteParser(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        routerDelegate:
            AutoRouterDelegate(router, initialDeepLink: '/dashboard'),
        builder: (context, child) {
          return ScrollConfiguration(
              behavior: AppScrollBehavior(), child: child!);
        },
      ),
    );
  }
}

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [HomeRouter(), RadioRouter(), LibraryRouter(), SearchRouter()],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        // the passed child is technically our animated selected-tab page
        child: child,
      ),
      builder: (context, child) {
        // obtain the scoped TabsRouter controller using context
        final tabsRouter = AutoTabsRouter.of(context);
        context.read<BottomNavigationCubit>().setRouter(tabsRouter);
        return Scaffold(
          body: child,
          extendBody: true,
          bottomNavigationBar: const HomeNavBar(),
        );
      },
    );
  }
}
