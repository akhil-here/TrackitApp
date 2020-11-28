import 'package:flutter/material.dart';
import '../routes/Routes.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text(
                'WELCOME',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Quicksand',
                  fontSize: 30,
                  letterSpacing: 2.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              size: 26,
              color: Colors.black,
            ),
            title: Text(
              'HOME',
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.home),
          ),
          ListTile(
            leading: Icon(
              Icons.history,
              size: 26,
              color: Colors.black,
            ),
            title: Text(
              'HISTORY',
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.history),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
            child: Divider(
              thickness: .5,
              color: Colors.black,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.add_to_home_screen,
              size: 26,
              color: Colors.black,
            ),
            title: Text(
              'LOGOUT',
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.logout),
          ),
          Expanded(
            flex: 5,
            child: Text(''),
          ),
          Container(
            height: 80,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Center(
              child: Text(
                'धन्यवाद!',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                  letterSpacing: 2.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
