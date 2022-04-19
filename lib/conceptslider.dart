import 'package:flutter/material.dart';

class ConceptSlider extends StatefulWidget {
  const ConceptSlider({Key? key}) : super(key: key);

  @override
  State<ConceptSlider> createState() => _ConceptSliderState();
}

class _ConceptSliderState extends State<ConceptSlider> {
  double _value = 0.0;

  void _onChanged(double value) => setState(() => _value = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(child: Slider(value: _value, onChanged: _onChanged)),
        ],
      ),
    );
  }
}
