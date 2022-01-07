import 'package:flutter/material.dart';
import 'package:navigator_two_point_oh/app_state.dart';
import 'package:navigator_two_point_oh/home_screen.dart';

class AppRouterDelegate extends RouterDelegate<AppState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final navigatorKey = GlobalKey<NavigatorState>();

  AppState appState = AppState(currentTab: HomeScreenTab.bears);

  AppRouterDelegate() {
    appState.addListener(notifyListeners);
  }

  @override
  Widget build(BuildContext context) {
    return
        // ChangeNotifierProvider.value(
        //   value: appState,
        //   child:
        Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          child: HomeScreen(appState: appState),
        ),
      ],
      onPopPage: (route, result) => route.didPop(result),
    );
  }

  @override
  Future<void> setNewRoutePath(AppState configuration) async {
    print('configuration: $configuration');
    // TODO: implement setNewRoutePath
    // throw UnimplementedError();
  }
}
