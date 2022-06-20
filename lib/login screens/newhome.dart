import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:demo/check/check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:firebase_core/firebase_core.dart';

class homenew extends StatefulWidget {
  // const homenew({ Key? key }) : super(key: key);

  @override
  _homenewState createState() => _homenewState();
}

class _homenewState extends State<homenew> {
  // String _timeString;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  // }

  // String _getTime() {
  //   final String formattedDateTime =
  //       DateFormat('yyyy-MM-dd \n kk:mm:ss').format(DateTime.now()).toString();
  //   setState(() {
  //     _timeString = formattedDateTime;
  //     return (_timeString);
  //   });
  // }

  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  String getUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        return (nameID(loggedInUser.email));
      }
    } catch (e) {
      // showAlertDialog(context);
    }
  }

//   DateTime now = new DateTime.now();
// DateTime date = new DateTime(now.year, now.month, now.day);
  String _timeString;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  // }

  // void _getTime() {
  //   final String formattedDateTime =
  //       DateFormat('kk:mm').format(DateTime.now()).toString();
  //   setState(() {
  //     _timeString = formattedDateTime;
  //     print(_timeString);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    String n = getUser();
    // _getTime();
    return Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage('images/avi12.gif'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(
                      children: [
                        Hero(
                          tag: 'logo',
                          child: Container(
                            width: MediaQuery.of(context).size.height * 0.28,
                            // height: 150.0,
                            height: MediaQuery.of(context).size.height * 0.28,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('images/avi16.gif'),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(370.0)),
                              // color: Colors.redAccent,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //  image: DecorationImage(
                        //     fit: BoxFit.cover, image: NetworkImage('images/avi.gif')
                        //     )
                        //     ),
                        // borderRadius: BorderRadius.all(Radius.circular(8.0)),)
                        //         color: Colors.redAccent,
                        // child: Image.asset('images/avi.gif'),
                        // height: MediaQuery.of(context).size.height * 0.4,

                        Text(
                          'Welcome !',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        // Container(
                        //   height: MediaQuery.of(context).size.height * 0.1,
                        //   child: FadeAnimatedTextKit(
                        //     // totalRepeatCount: 80,
                        //     text: ['Welcome', 'to', 'Coe2', 'Arena'],
                        //     textStyle: TextStyle(
                        //       color: Colors.white,
                        //       fontSize: 32.0,
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.01,
                        // ),
                        Text(
                          n,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),

                        // ignore: deprecated_member_use
                        // Container(
                        //   height: MediaQuery.of(context).size.height * 0.3,
                        //   child: FadeAnimatedTextKit(
                        //     text: ['Welcome', 'to', 'Coe2', 'Arena'],
                        //     textStyle: TextStyle(
                        //       color: Colors.white,
                        //       fontSize: 22.0,
                        //       fontWeight: FontWeight.w900,
                        //     ),
                        //   ),
                        // )
                        // ButtonBar()
                        // TextButton(
                        //   onPressed: () {
                        //     _getTime();
                        //   },
                        //   child: Text('have'),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    // Text(
                    //   _timeString.toString(),
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 22.0,
                    //     fontWeight: FontWeight.w900,
                    //   ),
                    // ),

                    // RoundedButton(
                    //     title: 'Log In',
                    //     color: Color(0xffffffff),
                    //     Onpressed: () {
                    //       print('LOG IN');
                    //       Navigator.pushNamed(context, LoginScreen.id);
                    //     }),
                    // RoundedButton(
                    //     title: 'Register',
                    //     // color: Color(0xff3B3B3B),
                    //     color: Color(0xffffffff),
                    //     Onpressed: () {
                    //       print('REGISTER IN');
                    //       Navigator.pushNamed(context, RegistrationScreen.id);
                    //     }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
