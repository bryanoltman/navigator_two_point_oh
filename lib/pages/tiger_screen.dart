import 'package:flutter/material.dart';
import 'package:navigator_two_point_oh/models/models.dart';

class TigerScreen extends StatefulWidget {
  final Tiger tiger;
  const TigerScreen({Key? key, required this.tiger}) : super(key: key);

  @override
  _TigerScreenState createState() => _TigerScreenState();
}

class _TigerScreenState extends State<TigerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiger'),
      ),
      body: Center(
        child: Text(widget.tiger.name),
      ),
    );
  }
}
