import 'package:flutter/material.dart';

class BotoesPage extends StatefulWidget {
  @override
  _BotoesPageState createState() => _BotoesPageState();
}

class _BotoesPageState extends State<BotoesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Botões'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
