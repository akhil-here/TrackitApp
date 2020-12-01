import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:TrackIt/Authentication/services/auth.dart';
import 'login.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> _key = new GlobalKey();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String email, username, password, error;
  bool enabled = false;
  bool check = false;
  bool _validate = false;
  bool _passwordVisible = false;
  String snackbarmsg;
  var obj = new Login();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          key: scaffoldKey,
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: Image.asset(
                'assets/images/register.jpg',
                scale: 1.0,
              ),
            ),
            Text(
              "REGISTER",
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
                    child: ConstrainedBox(
                        constraints: BoxConstraints(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: SingleChildScrollView(
                                child: Container(
                                  margin: EdgeInsets.all(15.0),
                                  child: Form(
                                    key: _key,
                                    autovalidate: _validate,
                                    child: formUI(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )))),
          ]),
        ));
  }

  Widget formUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
          child: TextFormField(
              cursorHeight: 20.0,
              decoration: InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: Colors.indigo.shade900),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              keyboardType: TextInputType.text,
              // validator: (value) {
              //   if (value.length < 2) {
              //     return 'Username not long enough';
              //   }
              // },
              onSaved: (String value) {
                username = value;
              }),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0.0),
          child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: "e.g abc@gmail.com",
                prefixIcon: Icon(Icons.email),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: Colors.indigo.shade900),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (email) => EmailValidator.validate(email)
                  ? null
                  : "Invalid Email Address",
              onSaved: (String value) {
                email = value;
              }),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
          child: TextFormField(
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
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
                  borderSide: BorderSide(color: Colors.indigo.shade900),
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
                  side: BorderSide(color: Colors.red.shade900)),
              color: Colors.red.shade900,
              child: Text(
                'Register',
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
                  side: BorderSide(color: Colors.indigo.shade900)),
              color: Colors.indigo.shade900,
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ],
        ),
      ],
    );
  }

  _sendTOServer() async {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      Authservice instance = new Authservice();
      final val = await instance.registerin(email, password, username);

      error = "Registration Successful";
      print("$username $email $password");
      error = val;
      if (val == 'Success') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      }
      snackbar(error);
    } else {
      setState(() {
        error = "Registration Unsuccessful";
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
