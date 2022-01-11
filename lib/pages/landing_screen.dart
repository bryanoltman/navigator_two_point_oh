import 'package:flutter/material.dart';
import 'package:navigator_two_point_oh/app_state.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Go Home'),
          onPressed: () {
            appState.isHome = true;
          },
        ),
      ),
    );
  }
}
