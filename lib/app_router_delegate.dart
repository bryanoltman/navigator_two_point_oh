import 'package:flutter/material.dart';
import 'package:navigator_two_point_oh/app_state.dart';
import 'package:navigator_two_point_oh/home_screen.dart';
import 'package:navigator_two_point_oh/pages/landing_screen.dart';
import 'package:provider/provider.dart';

class AppRouterDelegate extends RouterDelegate<AppState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Navigator(
        key: navigatorKey,
        pages: [
          const MaterialPage(child: LandingScreen()),
          if (appState.isHome)
            MaterialPage(
              child: HomeScreen(appState: appState),
            ),
        ],
        onPopPage: (route, result) {
          if (appState.currentTab == HomeScreenTab.bears &&
              appState.selectedBear != null) {
            appState.selectedBear = null;
            return false;
          } else if (appState.currentTab == HomeScreenTab.tigers &&
              appState.selectedTiger != null) {
            appState.selectedTiger = null;
            return false;
          } else if (appState.currentTab == HomeScreenTab.lions &&
              appState.selectedLion != null) {
            appState.selectedLion = null;
            return false;
          } else if (appState.isHome) {
            appState.isHome = false;
            return false;
          }
          return route.didPop(result);
        });
  }

  @override
  Future<void> setNewRoutePath(AppState configuration) async {
    print('configuration: $configuration');
    // TODO: implement setNewRoutePath
    // throw UnimplementedError();
  }
}
