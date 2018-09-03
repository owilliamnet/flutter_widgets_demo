import 'package:flutter/material.dart';

class CardsPage extends StatefulWidget {
  @override
  _CardsPageState createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
      ),
      body: Center(
        child: Text('Cards'),
      ),
    );
  }
}
