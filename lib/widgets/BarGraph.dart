import 'package:TrackIt/models/data.dart';
import 'package:TrackIt/widgets/TransChart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleBarChart extends StatelessWidget {
  final List<Details> data = [
    Details(
      day: "Sun",
      amount: 100,
      barColor: charts.ColorUtil.fromDartColor(Colors.indigo),
    ),
    Details(
      day: "Mon",
      amount: 110,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    Details(
      day: "Tues",
      amount: 120,
      barColor: charts.ColorUtil.fromDartColor(Colors.indigo),
    ),
    Details(
      day: "Wed",
      amount: 100,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    Details(
      day: "Thurs",
      amount: 40,
      barColor: charts.ColorUtil.fromDartColor(Colors.indigo),
    ),
    Details(
      day: "Fri",
      amount: 77,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    Details(
      day: "Sat",
      amount: 76,
      barColor: charts.ColorUtil.fromDartColor(Colors.indigo),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Chart(_recentTransactions),
            DetailsChart(
              data: data,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 25.0, 20.0, 25.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                  ),
                ),
                child: Card(
                  elevation: 14.0,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4.0, 2.0, 6.0, 8.0),
                    child: Row(children: <Widget>[
                      Text("Total amount spent \nover the week:",
                          style: TextStyle(
                              fontFamily: 'Quicksand', fontSize: 25.0)),
                      Text("\n₹2000/-",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Quicksand',
                              fontSize: 28.0))
                    ]),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                child: Row(children: <Widget>[
                  Text("Realise,",
                      style: TextStyle(
                          fontFamily: 'Bangers-Regular',
                          fontSize: 50.0,
                          color: Colors.indigo)),
                  Text("Think",
                      style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'Bangers-Regular',
                          fontSize: 50.0)),
                  Text(",Spend",
                      style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'Bangers-Regular',
                          fontSize: 50.0,
                          color: Colors.indigo)),
                ]),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
