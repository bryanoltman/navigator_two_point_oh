import 'package:flutter/material.dart';
import 'package:navigator_two_point_oh/my_route_information_parser.dart';
import 'package:navigator_two_point_oh/app_router_delegate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: MyRouteInformationParser(),
      routerDelegate: AppRouterDelegate(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
