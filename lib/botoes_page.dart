import 'package:flutter/material.dart';

class BotoesPage extends StatefulWidget {
  @override
  _BotoesPageState createState() => _BotoesPageState();
}

class _BotoesPageState extends State<BotoesPage> {
  ShapeBorder _buttonShape;

  @override
  Widget build(BuildContext context) {
    final ButtonThemeData buttonTheme = ButtonTheme.of(context).copyWith(
      shape: _buttonShape,
    );
    return Scaffold(
      body: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Página de botões'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Raised'),
                Tab(text: 'Flat'),
                Tab(text: 'Outline'),
                Tab(text: 'Icons'),
                Tab(text: 'Action'),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ButtonTheme.fromButtonThemeData(
                data: buttonTheme,
                child: buildRaisedButtons(
                    'Raised button adiciona dimensão a layouts simples. E enfatizam funções em espaços ocupados ou amplos.'),
              ),
              ButtonTheme.fromButtonThemeData(
                data: buttonTheme,
                child: buildFlatButtons(
                    'Flat button é um botão mais "clean". Recomendado em barra de ferramentas e nas caixas de diálogos.'),
              ),
              ButtonTheme.fromButtonThemeData(
                data: buttonTheme,
                child: buildOutLineButton(
                    'OutLineButton são opacos e elevam-se quando são pressionados.'),
              ),
              ButtonTheme.fromButtonThemeData(
                data: buttonTheme,
                child: buildIconButton(),
              ),
              ButtonTheme.fromButtonThemeData(
                data: buttonTheme,
                child: buildActionButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildIconButton() {
  return Align(
    alignment: Alignment(0.0, -0.2),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.thumb_up),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.thumb_down),
          onPressed: null,
        ),
      ],
    ),
  );
}

Widget buildActionButton() {
  return Align(
    alignment: Alignment(0.0, -0.2),
    child: FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {},
    ),
  );
}

Widget buildOutLineButton(title) {
  return Align(
    alignment: const Alignment(0.0, -0.2),
    child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      ButtonBar(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          OutlineButton(
            child: Text('OutLine Button'),
            color: Colors.teal,
            onPressed: () {},
          ),
          OutlineButton(
            child: Text('Outline OFF'),
            color: Colors.teal,
            onPressed: null,
          ),
        ],
      ),
      ButtonBar(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          OutlineButton.icon(
            icon: Icon(Icons.dashboard),
            label: Text('Outline icon'),
            onPressed: () {},
          ),
          OutlineButton.icon(
            icon: Icon(Icons.dashboard),
            label: Text('Outline off'),
            onPressed: null,
          ),
        ],
      ),
    ]),
  );
}

Widget buildFlatButtons(title) {
  return Align(
    alignment: const Alignment(0.0, -0.2),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ButtonBar(mainAxisSize: MainAxisSize.min, children: <Widget>[
          FlatButton(
              child: Text('FLAT BUTTON'),
              color: Colors.red[400],
              onPressed: () {}),
          FlatButton(child: Text('DESABILITADO'), onPressed: null),
        ]),
        ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FlatButton.icon(
              label: Text(
                'FLAT BUTTON',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red[400],
              icon: Icon(
                Icons.camera,
                color: Colors.yellow,
                size: 18.0,
              ),
              onPressed: () {},
            ),
            FlatButton.icon(
              label: Text('DESABILITADO'),
              icon: Icon(
                Icons.camera,
                size: 18.0,
              ),
              onPressed: null,
            ),
          ],
        )
      ],
    ),
  );
}

Widget buildRaisedButtons(title) {
  return Align(
      alignment: Alignment(0.0, -0.2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold)),
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton(
                child: const Text('RAISED BUTTON'),
                onPressed: () {},
              ),
              RaisedButton(
                child: const Text('DESABILITADO'),
                onPressed: null,
              ),
            ],
          ),
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton.icon(
                icon: const Icon(
                  Icons.add,
                  size: 18.0,
                ),
                label: Text('RAISED BUTTON'),
                onPressed: () {},
              ),
              RaisedButton.icon(
                icon: const Icon(
                  Icons.add,
                  size: 18.0,
                ),
                label: Text('DESABILITADO'),
                onPressed: null,
              ),
            ],
          ),
        ],
      ));
}
