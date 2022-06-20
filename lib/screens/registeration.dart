import 'package:demo/login%20screens/loginmainscreen.dart';
import 'package:demo/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:demo/components/components.dart';
import 'package:demo/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:demo/check/check.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'register_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email;
  String password;
  String msg = " ";
  String msg1 = " ";
  final _auth = FirebaseAuth.instance;
  bool showspinner = false;
  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(msg),
      content: Text(msg1),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage('images/avi13.gif'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: ModalProgressHUD(
            inAsyncCall: showspinner,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 37.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Hero(
                        tag: 'logo',
                        child: Container(
                          width: MediaQuery.of(context).size.height * 0.4,
                          // height: 150.0,
                          height: MediaQuery.of(context).size.height * 0.4,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/avi5.gif'),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(500.0)),
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 48.0,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          //Do something with the user input.
                          email = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Enter your Email'),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          password = value;
                          //Do something with the user input.
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Enter your password'),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      RoundedButton(
                          title: 'Register',
                          color: Colors.white,
                          Onpressed: () async {
                            setState(() {
                              showspinner = true;
                            });
                            try {
                              int n = check(email);

                              if (n == 1) {
                                final newuser =
                                    await _auth.createUserWithEmailAndPassword(
                                        email: email, password: password);

                                if (newuser != null) {
                                  // Navigate to Homepage
                                  Navigator.pushNamed(
                                      context, loginmainscreen.id);

                                  setState(() {
                                    showspinner = false;
                                  });
                                }
                              } else {
                                msg = "App Built only for Coe2 Students";
                                msg1 = " So you can't be Registered Sorry... ";
                                showAlertDialog(context);
                                setState(() {
                                  showspinner = false;
                                });
                              }
                            } catch (e) {
                              msg = 'Email already in use';
                              msg1 = 'Contact Avi ,if required';
                              showAlertDialog(context);
                              setState(() {
                                showspinner = false;
                              });
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
