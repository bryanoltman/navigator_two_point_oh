import 'package:flutter/material.dart';
import 'package:navigator_two_point_oh/app_state.dart';
import 'package:navigator_two_point_oh/home_screen.dart';
import 'package:navigator_two_point_oh/pages/bear_screen.dart';
import 'package:navigator_two_point_oh/pages/bears_screen.dart';
import 'package:navigator_two_point_oh/pages/lions_screen.dart';
import 'package:navigator_two_point_oh/pages/tiger_screen.dart';
import 'package:navigator_two_point_oh/pages/tigers_screen.dart';

class AnimalsRouterDelegate extends RouterDelegate<AppState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppState> {
  AppState get appState => _appState;
  AppState _appState;
  set appState(AppState value) {
    _appState = value;
    notifyListeners();
  }

  @override
  final navigatorKey = GlobalKey<NavigatorState>();

  AnimalsRouterDelegate(this._appState) {
    appState.addListener(notifyListeners);
  }

  @override
  Future<bool> popRoute() async {
    switch (appState.currentTab) {
      case HomeScreenTab.lions:
        return false;
      case HomeScreenTab.tigers:
        if (appState.selectedTiger != null) {
          appState.selectedTiger = null;
          return true;
        }
        return false;
      case HomeScreenTab.bears:
        if (appState.selectedBear != null) {
          appState.selectedBear = null;
          return true;
        }
        break;
    }

    return false;
  }

  @override
  Future<void> setNewRoutePath(AppState configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }

  Widget _screenForTab(HomeScreenTab tab) {
    switch (tab) {
      case HomeScreenTab.lions:
        return LionsScreen(
          appState: appState,
        );
      case HomeScreenTab.tigers:
        return TigersScreen(
          appState: appState,
        );
      case HomeScreenTab.bears:
        return BearsScreen(
          appState: appState,
        );
    }
  }

  Widget? _detailScreen(AppState appState) {
    switch (appState.currentTab) {
      case HomeScreenTab.lions:
        return null;
      case HomeScreenTab.tigers:
        if (appState.selectedTiger != null) {
          return TigerScreen(tiger: appState.selectedTiger!);
        }

        return null;
      case HomeScreenTab.bears:
        if (appState.selectedBear != null) {
          return BearScreen(bear: appState.selectedBear!);
        }

        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final detailsScreen = _detailScreen(appState);
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          child: _screenForTab(appState.currentTab),
        ),
        if (detailsScreen != null) MaterialPage(child: detailsScreen)
      ],
      onPopPage: (route, result) {
        switch (appState.currentTab) {
          case HomeScreenTab.lions:
            break;
          case HomeScreenTab.tigers:
            appState.selectedTiger = null;
            notifyListeners();
            return false;
          case HomeScreenTab.bears:
            appState.selectedBear = null;
            notifyListeners();
            return false;
        }
        return route.didPop(result);
      },
    );
  }
}
