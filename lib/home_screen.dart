import 'package:flutter/material.dart';
import 'package:navigator_two_point_oh/app_state.dart';
import 'package:navigator_two_point_oh/pages/bear_screen.dart';
import 'package:navigator_two_point_oh/pages/bears_screen.dart';
import 'package:navigator_two_point_oh/pages/lions_screen.dart';
import 'package:navigator_two_point_oh/pages/tiger_screen.dart';
import 'package:navigator_two_point_oh/pages/tigers_screen.dart';

enum HomeScreenTab { lions, tigers, bears }

class HomeScreen extends StatefulWidget {
  final AppState appState;
  const HomeScreen({
    Key? key,
    required this.appState,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final tabsToNavKeys = {
    HomeScreenTab.lions: GlobalKey<NavigatorState>(),
    HomeScreenTab.tigers: GlobalKey<NavigatorState>(),
    HomeScreenTab.bears: GlobalKey<NavigatorState>(),
  };

  Widget _screenForTab(HomeScreenTab tab, AppState appState) {
    switch (tab) {
      case HomeScreenTab.lions:
        return LionsScreen();
      case HomeScreenTab.tigers:
        return TigersScreen();
      case HomeScreenTab.bears:
        return BearsScreen();
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

  Widget _navigatorForAppState(AppState appState) {
    final navigatorKey = tabsToNavKeys[appState.currentTab]!;
    final detailsScreen = _detailScreen(appState);

    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          child: _screenForTab(appState.currentTab, appState),
        ),
        if (detailsScreen != null) MaterialPage(child: detailsScreen)
      ],
      onPopPage: (route, result) => route.didPop(result),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navigatorForAppState(widget.appState),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.appState.currentTab.index,
        onTap: (index) =>
            widget.appState.currentTab = HomeScreenTab.values[index],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.crop_3_2_rounded),
            label: 'Lions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.line_weight),
            label: 'Tigers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.link_sharp),
            label: 'Bears',
          ),
        ],
      ),
    );
  }
}
