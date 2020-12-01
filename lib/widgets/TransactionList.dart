import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  // final List<Transaction> transactions;
  final Function deletetx;

  TransactionList(this.deletetx);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600,
        child: StreamBuilder(
            stream: Firestore.instance.collection('transactions').snapshots(),
            builder: (context, snapshot) {
              // if (!snapshot.hasData) {
              if (snapshot.data.documents.length == 0) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
                  child: Column(
                    children: <Widget>[
                      Text('No Transactions added yet!',
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 200,
                        child: Image.asset(
                          'assets/images/waiting.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                );
              }
              // }
              return ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 14,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.indigo,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text(
                              '\₹${snapshot.data.documents[index]['amount']}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      title: Text(snapshot.data.documents[index]['title'],
                          style: Theme.of(context).textTheme.headline6),
                      subtitle: Text(
                        DateFormat.yMMMd().format(
                            snapshot.data.documents[index]['date'].toDate()),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () =>
                            deletetx(snapshot.data.documents[index]['id']),
                      ),
                    ),
                  );
                },
                itemCount: snapshot.data.documents.length,
              );
            }));
  }
}
