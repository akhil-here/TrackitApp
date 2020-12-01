import 'package:TrackIt/widgets/BarGraph.dart';
import 'package:TrackIt/widgets/MainDrawer.dart';
import 'package:flutter/material.dart';

class History extends StatelessWidget {
  static const String routeName = '/history';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          "History",
          style: TextStyle(fontFamily: 'Quicksand'),
        ),
      ),
      drawer: MainDrawer(),
      body: SimpleBarChart(),
    );
  }
}
