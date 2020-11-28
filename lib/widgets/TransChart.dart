import 'package:TrackIt/models/data.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class DetailsChart extends StatelessWidget {
  final List<Details> data;

  DetailsChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Details, String>> series = [
      charts.Series(
          id: "Subscribers",
          data: data,
          domainFn: (Details series, _) => series.day,
          measureFn: (Details series, _) => series.amount,
          colorFn: (Details series, _) => series.barColor)
    ];

    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Material(
        elevation: 14.0,
        child: Card(
            child: Expanded(
          child: charts.BarChart(series, animate: true),
        )),
      ),
    );
  }
}
