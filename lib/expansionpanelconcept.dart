import 'package:chips_key_tooltip/stepperconcept.dart';
import 'package:flutter/material.dart';

class ExpansionPanelConcept extends StatefulWidget {
  const ExpansionPanelConcept({Key? key}) : super(key: key);

  @override
  State<ExpansionPanelConcept> createState() => _ExpansionPanelConceptState();
}

class MyItem {
  bool isExpanded;
  final String header;
  final Widget body;

  MyItem(this.isExpanded, this.header, this.body);
}

class _ExpansionPanelConceptState extends State<ExpansionPanelConcept> {
  final List<MyItem> _items = <MyItem>[];

  @override
  void initState() {
    for (int i = 0; i < 10; i++) {
      _items.add(MyItem(
          false,
          'Number : ${i}',
          Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text("This is Expansion's Code"),
          )));
    }
  }

  ExpansionPanel _createitem(MyItem item) {
    return ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return Container(
            padding: const EdgeInsets.all(5.0),
            child: Text('This is ${item.header}'),
          );
        },
        body: item.body,
        isExpanded: item.isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expansion-Panel-Concept'),
        centerTitle: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: ListView(
          children: [
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _items[index].isExpanded = !_items[index].isExpanded;
                });
              },
              children: _items.map(_createitem).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StepperConcept()));
                  },
                  icon: const Icon(Icons.next_week_sharp),
                  label: Text('Stepper__Screen')),
            )
          ],
        ),
      ),
    );
  }
}
