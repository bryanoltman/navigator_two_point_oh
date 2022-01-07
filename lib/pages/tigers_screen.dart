import 'package:flutter/material.dart';
import 'package:navigator_two_point_oh/app_state.dart';
import 'package:navigator_two_point_oh/models/models.dart';

class TigersScreen extends StatefulWidget {
  final AppState appState;

  const TigersScreen({Key? key, required this.appState}) : super(key: key);

  @override
  _TigersScreenState createState() => _TigersScreenState();
}

class _TigersScreenState extends State<TigersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tigers'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text(Tiger.tigers[index].name),
          onTap: () => widget.appState.selectedTiger = Tiger.tigers[index],
        ),
        itemCount: Tiger.tigers.length,
      ),
    );
  }
}
