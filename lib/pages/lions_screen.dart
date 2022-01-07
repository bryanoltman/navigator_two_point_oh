import 'package:flutter/material.dart';
import 'package:navigator_two_point_oh/app_state.dart';
import 'package:navigator_two_point_oh/models/models.dart';

class LionsScreen extends StatefulWidget {
  final AppState appState;
  const LionsScreen({Key? key, required this.appState}) : super(key: key);

  @override
  _LionsScreenState createState() => _LionsScreenState();
}

class _LionsScreenState extends State<LionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lions'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text(Lion.lions[index].name),
          onTap: () {},
        ),
        itemCount: Lion.lions.length,
      ),
    );
  }
}
