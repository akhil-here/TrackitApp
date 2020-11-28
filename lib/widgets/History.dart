import 'package:TrackIt/models/transaction.dart';
import 'package:TrackIt/widgets/BarGraph.dart';
import 'package:TrackIt/widgets/Chart.dart';
import 'package:TrackIt/widgets/MainDrawer.dart';
import 'package:flutter/material.dart';

class History extends StatelessWidget {
  static const String routeName = '/history';
  final List<Transaction> _userTransactions = [];
  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

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
      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       crossAxisAlignment: CrossAxisAlignment.stretch,
      //       children: <Widget>[
      //         Chart(_recentTransactions),
      //         // TransactionList(_userTransactions, _deleteTransaction),
      //       ],
      //     ),
      //   ),
      // ),

      body: SimpleBarChart(),
    );
  }
}
