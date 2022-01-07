import 'package:flutter/material.dart';
import 'package:navigator_two_point_oh/app_state.dart';
import 'package:navigator_two_point_oh/home_screen.dart';

class MyRouteInformationParser extends RouteInformationParser<AppState> {
  @override
  Future<AppState> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final uri = Uri.parse(routeInformation.location!);
    print(uri);
    return AppState(currentTab: HomeScreenTab.lions);
  }
}
