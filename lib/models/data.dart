import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class Details {
  final String day;
  final int amount;
  final charts.Color barColor;

  Details({@required this.day, @required this.amount, @required this.barColor});
}
