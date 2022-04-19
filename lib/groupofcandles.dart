import 'package:chips_key_tooltip/animatedpiechart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';

class GroupOfCandles extends StatefulWidget {
  const GroupOfCandles({Key? key}) : super(key: key);

  @override
  State<GroupOfCandles> createState() => _GroupOfCandlesState();
}

class Sales {
  String year;
  int sales;

  Sales(this.year, this.sales);
}

class _GroupOfCandlesState extends State<GroupOfCandles> {
  late List<Sales> _laptops;
  late List<Sales> _desktops;
  late List<charts.Series<Sales, String>> _chartdata;

  void _makeData() {
    _laptops = <Sales>[];
    _desktops = <Sales>[];
    _chartdata = <charts.Series<Sales, String>>[];

    final rnd = Random();

    for (int i = 2016; i < 2020; i++) {
      _laptops.add(Sales(i.toString(), rnd.nextInt(1000)));
      _desktops.add(Sales(i.toString(), rnd.nextInt(1000)));
    }
    _chartdata.add(charts.Series(
      id: 'Sales',
      data: _laptops,
      domainFn: (Sales sales, __) => sales.year,
      measureFn: (Sales sales, __) => sales.sales,
      displayName: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
    ));

    _chartdata.add(charts.Series(
      id: 'Sales',
      data: _desktops,
      domainFn: (Sales sales, __) => sales.year,
      measureFn: (Sales sales, __) => sales.sales,
      displayName: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
    ));
  }

  @override
  void initState() {
    _makeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GROUPING CANDLES'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AnimatedPieChart()));
              },
              icon: Icon(Icons.move_up))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(28.0),
        child: Column(
          children: [
            Expanded(
                child: charts.BarChart(
              _chartdata,
              vertical: true,
            ))
          ],
        ),
      ),
    );
  }
}
