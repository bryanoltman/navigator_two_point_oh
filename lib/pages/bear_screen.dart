import 'package:flutter/material.dart';
import 'package:navigator_two_point_oh/models/models.dart';

class BearScreen extends StatefulWidget {
  final Bear bear;

  const BearScreen({Key? key, required this.bear}) : super(key: key);

  @override
  _BearScreenState createState() => _BearScreenState();
}

class _BearScreenState extends State<BearScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bear'),
      ),
      body: Center(
        child: Text(widget.bear.name),
      ),
    );
  }
}
