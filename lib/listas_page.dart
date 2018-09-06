import 'package:flutter/material.dart';

class ListasPage extends StatefulWidget {
  @override
  _ListasPageState createState() => _ListasPageState();
}

class _ListasPageState extends State<ListasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas 2'),
        centerTitle: true,
        backgroundColor : Colors.lightGreenAccent
      ),
      body: Center(
        child: Text('Listas 2'),
      )
    );
  }
}