import 'package:chips_key_tooltip/conceptslider.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class AnimatedPieChart extends StatefulWidget {
  const AnimatedPieChart({Key? key}) : super(key: key);

  @override
  State<AnimatedPieChart> createState() => _AnimatedPieChartState();
}

class Sales {
  int year;
  int sales;
  charts.Color color;
  Sales(this.year, this.sales, this.color);
}

class _AnimatedPieChartState extends State<AnimatedPieChart> {
  List<Sales> _data = [];
  List<charts.Series<Sales, int>> _chartdata = [];
  @override
  void initState() {
    _makeData();
  }

  void _makeData() {
    _chartdata = <charts.Series<Sales, int>>[];
    _data = <Sales>[
      Sales(0, 50, charts.MaterialPalette.red.shadeDefault),
      Sales(1, 25, charts.MaterialPalette.blue.shadeDefault),
      Sales(2, 130, charts.MaterialPalette.green.shadeDefault),
      Sales(3, 50, charts.MaterialPalette.yellow.shadeDefault),
    ];

    _chartdata.add(charts.Series(
      id: 'Sales',
      data: _data,
      colorFn: (Sales sales, _) => sales.color,
      domainFn: (Sales sales, _) => sales.year,
      measureFn: (Sales sales, _) => sales.sales,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Pie Chart'),
        actions: [
          IconButton(
              onPressed: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ConceptSlider()));
              }),
              icon: Icon(
                Icons.wifi,
                size: 35,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: charts.PieChart(
            _chartdata,
            animate: true,
            animationDuration: Duration(milliseconds: 3000),
          ))
        ],
      ),
    );
  }
}
