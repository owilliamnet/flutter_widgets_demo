import 'package:flutter/material.dart';

class CardViagem {
  final String titulo;
  final List<String> descricao;

  const CardViagem({
    this.titulo,
    this.descricao,
  });
}

final List<CardViagem> destinos = <CardViagem>[
  const CardViagem(
    titulo: 'Rio de Janeiro',
    descricao: const <String>[
      'Corcovado',
      'Cristo Redentor',
      'Maracanã',
    ],
  ),
  const CardViagem(titulo: 'São Paulo', descricao: <String>[
    'Av. Paulista',
    'Morumbi',
    'Museu',
  ]),
  const CardViagem(titulo: 'Cuiaba', descricao: <String>[
    'Orla do porto',
    'Prainha',
    'Fronteira',
  ]),
];

class CardItens extends StatelessWidget {
  CardItens({Key key, @required this.destinos, this.shape}) : super(key: key);

  static const double height = 160.0;
  final CardViagem destinos;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle descricaoStyle = theme.textTheme.subhead;

    return SafeArea(
      top: false,
      bottom: false,
      child: Container(
        padding: EdgeInsets.all(1.0),
        height: height,
        child: Card(
          shape: shape,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                child: Text(
                  destinos.titulo,
                  style: descricaoStyle.copyWith(color: Colors.redAccent),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: DefaultTextStyle(
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: descricaoStyle,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 1.0),
                          child: Text(
                            destinos.descricao[0],
                            style: descricaoStyle.copyWith(color: Colors.green),
                          ),
                        ),
                        Text(destinos.descricao[1]),
                        Text(destinos.descricao[2]),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardsPage extends StatefulWidget {
  @override
  _CardsPageState createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  ShapeBorder _shape;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.sentiment_very_satisfied),
            onPressed: () {
              setState(() {
                _shape = _shape != null
                    ? null
                    : const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(16.0),
                          topRight: const Radius.circular(16.0),
                          bottomLeft: const Radius.circular(2.0),
                          bottomRight: const Radius.circular(2.0),
                        ),
                      );
              });
            },
          ),
        ],
      ),
      body: ListView(
        itemExtent: CardItens.height,
        padding:
            const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0, bottom: 0.0),
        children: destinos.map((CardViagem dest) {
          return Container(
            //margin: const EdgeInsets.only(bottom: 1.0),
            child: CardItens(destinos: dest, shape: _shape),
          );
        }).toList(),
      ),
    );
  }
}
