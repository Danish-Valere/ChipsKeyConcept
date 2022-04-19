import 'package:chips_key_tooltip/groupofcandles.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';

class ChartConcept extends StatefulWidget {
  const ChartConcept({Key? key}) : super(key: key);

  @override
  State<ChartConcept> createState() => _ChartConceptState();
}

class Sales {
  String year;
  int sales;
  Sales(this.year, this.sales);
}

class _ChartConceptState extends State<ChartConcept> {
  late List<Sales> _data;
  late List<charts.Series<Sales, String>> _chartdata;

  @override
  void initState() {
    _makeData();
  }

  void _makeData() {
    _data = <Sales>[];
    _chartdata = <charts.Series<Sales, String>>[];

    final rnd = Random();

    for (int i = 2010; i < 2020; i++) {
      _data.add(Sales(i.toString(), rnd.nextInt(1100)));
    }

    _chartdata.add(charts.Series(
        id: 'Sales',
        colorFn: (Sales sales, __) => charts.MaterialPalette.red.shadeDefault,
        data: _data,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        fillPatternFn: (Sales sales, __) => charts.FillPatternType.forwardHatch,
        displayName: 'Sales'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chart'),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GroupOfCandles()));
              }),
              icon: const Icon(
                Icons.move_up,
                size: 32,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            const Text('Sales data'),
            Expanded(child: charts.BarChart(_chartdata))
          ],
        ),
      ),
    );
  }
}
