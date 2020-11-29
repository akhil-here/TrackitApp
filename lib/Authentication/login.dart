import 'package:TrackIt/widgets/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:TrackIt/Authentication/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';

class Login extends StatefulWidget {
  static const String routeName = '/logout';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email, password, error;
  bool _validate = false;
  bool _passwordVisible = false;
  GlobalKey<FormState> _key = new GlobalKey();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        key: scaffoldKey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/login.jpg',
              scale: 1.2,
            ),
            Text(
              "LOGIN",
              style: TextStyle(
                color: Colors.black,
                fontSize: 40.0,
                fontFamily: 'Bangers-Regular',
                fontWeight: FontWeight.w700,
                letterSpacing: 2.0,
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Container(
                  child: Form(
                      key: _key,
                      autovalidate: _validate,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                            child: TextFormField(
                              cursorHeight: 20.0,
                              decoration: InputDecoration(
                                labelText: "Username",
                                hintText: "e.g abc@gmail.com",
                                prefixIcon: Icon(Icons.person),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide:
                                      BorderSide(color: Colors.indigo.shade900),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              validator: (email) =>
                                  EmailValidator.validate(email)
                                      ? null
                                      : "Invalid Email Address",
                              onSaved: (String value) {
                                email = value;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: TextFormField(
                                cursorHeight: 20.0,
                                obscureText: !_passwordVisible,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                        color: Colors.indigo.shade900),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value.length < 8) {
                                    return 'Password should be more than 8 characters';
                                  }
                                  return null;
                                },
                                onSaved: (String value) {
                                  password = value;
                                }),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              RaisedButton(
                                elevation: 10.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: Colors.indigo.shade900)),
                                color: Colors.indigo.shade900,
                                child: Text(
                                  'Login',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  _sendTOServer();
                                },
                              ),
                              RaisedButton(
                                elevation: 10.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side:
                                        BorderSide(color: Colors.red.shade900)),
                                color: Colors.red.shade900,
                                child: Text(
                                  'Register',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _sendTOServer() async {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      Authservice instance = new Authservice();
      final val = await instance.signIn(email, password);

      error = "Login Successful";
      print("$email $password");
      error = val;
      if (val == 'Success') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyIntroPage()));
      }
      snackbar(error);
      //Temporary
      _auth.authStateChanges().listen((User user) {
        if (user == null) {
          print('User is currently signed out!');
        } else {
          print('User is signed in!');
        }
      });
    } else {
      error = "Login Unsuccessful";

      setState(() {
        _validate = true;
      });
    }
  }

  void snackbar(String msg) {
    final snackbar = new SnackBar(
      content: new Text("$msg"),
      backgroundColor: Colors.indigo.shade900,
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }
}
