import 'package:flutter/material.dart';

import 'expansionpanelconcept.dart';

class PopUpMenuButton extends StatefulWidget {
  const PopUpMenuButton({Key? key}) : super(key: key);

  @override
  State<PopUpMenuButton> createState() => _PopUpMenuButtonState();
}

enum Animals { Cat, Dog, Bird, Lizard, Fish }

class _PopUpMenuButtonState extends State<PopUpMenuButton> {
  Animals _selected = Animals.Cat;
  String _value = 'Make a Selection';
  final List<PopupMenuEntry<Animals>> _items = <PopupMenuEntry<Animals>>[];

  @override
  void initState() {
    for (Animals animal in Animals.values) {
      _items.add(PopupMenuItem(
        child: Text(
          _getDisplay(animal),
        ),
        value: animal,
      ));
    }
  }

  void _onSelected(Animals animal) {
    setState(() {
      _selected = animal;
      _value = 'You Have Selected ${_getDisplay(animal)}';
    });
  }

  String _getDisplay(Animals animal) {
    int index = animal.toString().indexOf('.');
    index++;
    return animal.toString().substring(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name here'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(32.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _value,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                  PopupMenuButton<Animals>(
                      child: const Icon(Icons.arrow_drop_down_circle_rounded),
                      initialValue: Animals.Cat,
                      onSelected: _onSelected,
                      itemBuilder: (BuildContext context) {
                        return _items;
                      }),
                ],
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ExpansionPanelConcept()));
            },
            icon: const Icon(
              Icons.near_me,
            ),
            label: const Text('Expansion-Screen'),
          )
        ],
      ),
    );
  }
}
