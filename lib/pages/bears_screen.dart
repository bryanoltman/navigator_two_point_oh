import 'package:flutter/material.dart';
import 'package:navigator_two_point_oh/app_state.dart';
import 'package:navigator_two_point_oh/models/models.dart';

class BearsScreen extends StatefulWidget {
  final AppState appState;
  const BearsScreen({Key? key, required this.appState}) : super(key: key);

  @override
  _BearsScreenState createState() => _BearsScreenState();
}

class _BearsScreenState extends State<BearsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bears'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text(Bear.bears[index].name),
          onTap: () {
            widget.appState.selectedBear = Bear.bears[index];
          },
        ),
        itemCount: Bear.bears.length,
      ),
    );
  }
}
