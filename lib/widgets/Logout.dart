import 'package:TrackIt/widgets/MainDrawer.dart';
import 'package:flutter/material.dart';

class LogoutPage extends StatelessWidget {
  static const String routeName = '/logout';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(
            "Logout",
            style: TextStyle(fontFamily: 'Quicksand'),
          ),
        ),
        drawer: MainDrawer(),
        body: Center(child: Text("This is Logout page")));
  }
}
