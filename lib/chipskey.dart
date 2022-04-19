import 'package:chips_key_tooltip/popupmenubutton.dart';
import 'package:flutter/material.dart';

class ChipsKey extends StatefulWidget {
  const ChipsKey({Key? key}) : super(key: key);

  @override
  State<ChipsKey> createState() => _ChipsKeyState();
}

class _ChipsKeyState extends State<ChipsKey> {
  int counter = 0;
  final List<Widget> _list = [];

  @override
  void initState() {
    for (int i = 0; i < 8; i++) {
      Widget child = _newItem(i);
      _list.add(child);
    }
  }

  void _onClicked() {
    Widget child = _newItem(counter);
    setState(() => _list.add(child));
  }

  Widget _newItem(int i) {
    Key key = Key('ITEM_${i}');
    Padding child = Padding(
      key: key,
      padding: const EdgeInsets.all(10.0),
      child: Chip(
        label: Text('${i} Name here'),
        deleteIcon: Icon(Icons.delete),
        deleteIconColor: Colors.red,
        onDeleted: () => _removeItem(key),
        avatar: CircleAvatar(
          backgroundColor: Colors.green.shade400,
          child: Text(i.toString()),
        ),
      ),
    );

    counter++;
    return child;
  }

  void _removeItem(Key key) {
    for (int i = 0; i < _list.length; i++) {
      Widget child = _list.elementAt(i);
      if (child.key == key) {
        setState(() => _list.removeAt(i));
        print('Removing ${key.toString()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CHIPS KEY CONCEPT'),
        actions: [
          IconButton(
            onPressed: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PopUpMenuButton()));
            }),
            icon: const Icon(Icons.skip_next),
            iconSize: 38,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClicked,
        child: const Icon(Icons.add),
      ),
      body: Container(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _list,
          )),
    );
  }
}
