import 'package:TrackIt/widgets/History.dart';
import 'package:TrackIt/widgets/MainDrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../routes/Routes.dart';
import 'TransactionList.dart';
import 'NewTransaction.dart';
import 'package:TrackIt/Authentication/login.dart';

class MyIntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              button: TextStyle(color: Colors.white),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'Bangers-Regular',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
      routes: {
        pageRoutes.home: (context) => MyHomePage(),
        pageRoutes.logout: (context) => Login(),
        pageRoutes.history: (context) => History()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const String routeName = '/homePage';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List expenses = [];
  FirebaseFirestore databaseReference = Firestore.instance;
  // CollectionReference databaseReference =
  //     FirebaseFirestore.instance.collection('transactions');

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) async {
    List itemsList = [];
    await databaseReference
        .collection('transactions')
        .doc('exp')
        .set(
          {
            'title': txTitle,
            'amount': txAmount,
            'date': chosenDate,
            'id': DateTime.now().toString(),
          },
        )
        .then((value) => print("Expense Added"))
        .catchError((error) => print("Failed to add expense: $error"));
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    try {
      databaseReference.collection('transactions').doc('exp').delete();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Expenses',
          style: TextStyle(fontFamily: 'Quicksand'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Chart(_recentTransactions),
              TransactionList(_deleteTransaction),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text(
          'Add',
          style: TextStyle(
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
