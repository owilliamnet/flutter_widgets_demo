import 'package:flutter/material.dart';
import 'botoes_page.dart';
import 'listas_page.dart';
import 'cards_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String avatarImage = 'https://avatars.githubusercontent.com/owilliamnet';
  String backgroundImage =
      'https://placeholder.com/wp-content/uploads/2018/04/home-office-2452806_640.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('MeuApp'),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Text('Meu App'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(backgroundImage))),
              accountName: Text(
                'William Martins',
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: Text(
                'owilliam.net@gmail.com',
                style: TextStyle(color: Colors.white),
              ),
              currentAccountPicture: GestureDetector(
                onTap: () => {},
                child: CircleAvatar(
                  backgroundImage: NetworkImage(avatarImage),
                ),
              ),
            ),
            ListTile(
                title: Text(
                  'Botões',
                  style: TextStyle(color: Colors.red),
                ),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => BotoesPage()));
                }),
            Divider(),
            ListTile(
              title: Text(
                'Listas',
                style: TextStyle(color: Colors.red),
              ),
              trailing: Icon(Icons.list),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ListasPage()));
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                'Cards',
                style: TextStyle(color: Colors.red),
              ),
              trailing: Icon(Icons.tag_faces),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => CardsPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
