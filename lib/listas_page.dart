import 'package:flutter/material.dart';

enum _MaterialListType {
  umaLinha,
  umLinhaComAvatar,
  duasLinhas,
  tresLinhas,
}

class ListasPage extends StatefulWidget {
  const ListasPage({Key key}) : super(key: key);

  @override
  _ListasPageState createState() => _ListasPageState();
}

class _ListasPageState extends State<ListasPage> {
  static final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

  PersistentBottomSheetController<Null> _bottomSheet;
  _MaterialListType _itemType = _MaterialListType.tresLinhas;
  bool ordenacaoReversa = false;

  bool _showAvatars = true;
  bool _showIcons = false;

  List<String> items = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'
  , 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S'
  , 'T', 'U', 'V', 'W', 'Y', 'X', 'Z'];
  //bool _ordenacaoReversa = false;

  void changeItemType(_MaterialListType type) {
    setState(() {
          _itemType = type;
    });
    _bottomSheet?.setState((){});
  }

  void _showConfigurationSheet() {

    final PersistentBottomSheetController<Null> bottomSheet = 
    scaffoldkey.currentState.showBottomSheet((BuildContext bottomSheetContext) {
      return Container(
        decoration: const BoxDecoration(
          border: const Border(top: const BorderSide(color: Colors.black26)),
          color: Colors.purpleAccent,
        ),
        child: ListView(
          shrinkWrap: true,
          primary: false,
          children: <Widget>[
            MergeSemantics(
              child: ListTile(
                dense: true,
                title: Text('Uma Linha'),
                trailing: Radio<_MaterialListType>(
                  value: _MaterialListType.umaLinha,
                  groupValue: _itemType,
                  onChanged: changeItemType,
                ),
              ),
            ),
            MergeSemantics(
              child: ListTile(
                dense: true,
                title: const Text('Duas Linhas'),
                trailing: Radio<_MaterialListType>(
                  value: _MaterialListType.duasLinhas,
                  groupValue: _itemType,
                  onChanged: changeItemType,
                ),
              ),
            ),
            MergeSemantics(
              child: ListTile(
                dense: true,
                title: const Text('Três Linhas'),
                trailing: Radio<_MaterialListType>(
                  value: _MaterialListType.tresLinhas,
                  groupValue: _itemType,
                  onChanged: changeItemType,
                ),
              ),
            ),

            MergeSemantics(
              child: ListTile(
                dense: true,
                title: const Text('Show Avatar'),
                trailing: Checkbox(
                  value: _showAvatars,
                  onChanged: (bool value) {
                    setState(() {
                      _showAvatars = value;

                    });
                    _bottomSheet?.setState((){});
                  }
                ),
              ),
            ),

            MergeSemantics(
              child: ListTile(
                dense: true,
                title: const Text('Show Ícone'),
                trailing: Checkbox(
                  value: _showIcons,
                  onChanged: (bool value) {
                    setState(() {
                      _showIcons = value;

                    });
                    _bottomSheet?.setState((){});
                  }
                ),
              ),
            ),
          ],
        ),
      );
    });

    setState(() {
      _bottomSheet = bottomSheet;
    });


    _bottomSheet.closed.whenComplete((){
      if (mounted) {
        setState(() {
          _bottomSheet = null;
        });
      }
    });
  }

  Widget buildListTile(BuildContext context, String item) {
    Widget secondary;
    if (_itemType == _MaterialListType.duasLinhas) {
      secondary = const Text('Texto secundário');
    } else if (_itemType == _MaterialListType.tresLinhas) {
      secondary = Text('Essa linha adicional aparece com o modelo 3 linhas. Vou adicionar mais texto aqui para quebrar a terceira linha...',
      );
    }
    return MergeSemantics(
      child: ListTile(
        isThreeLine: _itemType == _MaterialListType.tresLinhas,
        leading: _showAvatars ? ExcludeSemantics(child: CircleAvatar(child: Text(item))): null,
        trailing: _showIcons ? Icon(Icons.info, color: Theme.of(context).disabledColor): null,
        title: Text('Esse item representa a letra $item.'),
        subtitle: secondary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String itemTypeText;
    switch (_itemType) {
      case _MaterialListType.umaLinha:
      case _MaterialListType.umLinhaComAvatar:
        itemTypeText = 'Uma Linha';
        break;
      case _MaterialListType.duasLinhas:
        itemTypeText = 'Duas Linhas';
        break;
      case _MaterialListType.tresLinhas:
        itemTypeText = 'Três Linhas';
        break;
    }

    Iterable<Widget> listTiles = items.map((String item) => buildListTile(context, item));
    listTiles = ListTile.divideTiles(context: context, tiles: listTiles);

    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text('Listas Page'),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.sort_by_alpha),
            tooltip: 'Sort',
            onPressed: () {
              setState(() {
                ordenacaoReversa = !ordenacaoReversa;
                items.sort((String a, String b) => ordenacaoReversa ? b.compareTo(a) : a.compareTo(b));
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: _bottomSheet == null ? _showConfigurationSheet: null,
          ),
        ],
      ),
      body: Scrollbar(
        child: ListView(
          children: listTiles.toList(),
        ),
      ),
    );
  }
}


