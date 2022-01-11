import 'package:flutter/material.dart';
import 'package:navigator_two_point_oh/app_state.dart';
import 'package:navigator_two_point_oh/models/models.dart';
import 'package:provider/provider.dart';

class BearsScreen extends StatefulWidget {
  const BearsScreen({Key? key}) : super(key: key);

  @override
  _BearsScreenState createState() => _BearsScreenState();
}

class _BearsScreenState extends State<BearsScreen> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bears'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text(Bear.bears[index].name),
          onTap: () {
            appState.selectedBear = Bear.bears[index];
          },
        ),
        itemCount: Bear.bears.length,
      ),
    );
  }
}
