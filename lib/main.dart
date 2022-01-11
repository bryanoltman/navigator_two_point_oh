import 'package:flutter/material.dart';
import 'package:navigator_two_point_oh/app_state.dart';
import 'package:navigator_two_point_oh/home_screen.dart';
import 'package:navigator_two_point_oh/my_route_information_parser.dart';
import 'package:navigator_two_point_oh/app_router_delegate.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>.value(
      value: AppState(currentTab: HomeScreenTab.lions),
      child: MaterialApp.router(
        routeInformationParser: MyRouteInformationParser(),
        routerDelegate: AppRouterDelegate(),
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
