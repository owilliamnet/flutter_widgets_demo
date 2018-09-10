import 'package:flutter/material.dart';

class ListasPage extends StatefulWidget {
  @override
  _ListasPageState createState() => _ListasPageState();
}

class _ListasPageState extends State<ListasPage> {
  List<String> items = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
  ];
  bool _ordenacaoReversa = false;

  @override
  Widget build(BuildContext context) {
    Iterable<Widget> listTiles =
        items.map((String item) => buildListTile(context, item));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text('Listas Page'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.sort_by_alpha),
            onPressed: () {
              setState(() {
                _ordenacaoReversa = !_ordenacaoReversa;
                items.sort((String a, String b) => _ordenacaoReversa ? b.compareTo(a) : a.compareTo(b));
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: null,
          )
        ],
      ),
      body: Scrollbar(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          children: listTiles.toList(),
        ),
      ),
    );
  }
}

Widget buildListTile(BuildContext context, String item) {
  Widget secondary = const Text('Texto secundário');

  return MergeSemantics(
    child: ListTile(
      title: Text('Este item representa a letra $item'),
      subtitle: secondary,
    ),
  );
}
