import 'package:TrackIt/widgets/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:TrackIt/Authentication/login.dart';
import 'package:TrackIt/Authentication/register.dart';

class PageIntro extends StatelessWidget {
  //making list of pages needed to pass in IntroViewsFlutter constructor.
  final pages = [
    PageViewModel(
        pageColor: Colors.white,
        iconImageAssetPath: 'assets/images/dollar.png',
        bubble: Image.asset('assets/images/dollar.png'),
        body: Text(
          'Not being able to keep a track of all your expenses?',
          style: TextStyle(
            fontFamily: 'Bangers-Regular',
            color: Hexcolor('#838EDE'),
            fontStyle: FontStyle.normal,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 0.0),
          child: Text(
            'Worried??',
            style: TextStyle(
                fontFamily: 'Bangers-Regular',
                color: Hexcolor('#000033'),
                fontSize: 70.0),
          ),
        ),
        titleTextStyle: TextStyle(color: Colors.black),
        bodyTextStyle: TextStyle(color: Colors.black),
        mainImage: Image.asset(
          'assets/images/sad.png',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        )),
    PageViewModel(
      pageColor: Colors.white,
      iconImageAssetPath: 'assets/images/dollar.png',
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 12.0),
        child: Text(
          'Finding it difficult to where to spend and where not to??',
          style: TextStyle(
            fontFamily: 'Bangers-Regular',
            color: Hexcolor('#838EDE'),
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 0.0),
        child: Text(
          'Having no clue??',
          style: TextStyle(
              fontFamily: 'Bangers-Regular',
              color: Hexcolor('#000033'),
              fontSize: 60.0),
        ),
      ),
      mainImage: Image.asset(
        'assets/images/empty_pocket.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(color: Colors.black),
      bodyTextStyle: TextStyle(color: Colors.black),
    ),
    PageViewModel(
      pageColor: Colors.white,
      iconImageAssetPath: 'assets/images/dollar.png',
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 12.0),
        child: Text(
          'One stop for all your solutions...\n Let\'s Get Started',
          style: TextStyle(
            fontFamily: 'Bangers-Regular',
            color: Hexcolor('#838EDE'),
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 0.0),
        child: Text(
          'Don\'t Worry!!',
          style: TextStyle(
              fontFamily: 'Bangers-Regular',
              color: Hexcolor('#000033'),
              fontSize: 70.0),
        ),
      ),
      mainImage: Image.asset(
        'assets/images/savings.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(color: Colors.white),
      bodyTextStyle: TextStyle(color: Colors.white),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IntroViews Flutter', //title of app
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), //ThemeData
      home: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
          showNextButton: true,
          showBackButton: true,
          onTapSkipButton: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  // builder: (context) => MyIntroPage(),
                  builder: (context) => Register()),
            );
          },
          onTapDoneButton: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Register(),
              ), //MaterialPageRoute
            );
          },
          pageButtonTextStyles: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
        ), //IntroViewsFlutter
      ), //Builder
    ); //Material App
  }
}
