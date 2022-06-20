import 'package:demo/check/Cred.dart';
import 'package:demo/login%20screens/loginmainscreen.dart';
import 'package:flutter/material.dart';
import 'package:demo/components/components.dart';
import 'package:demo/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:demo/screens/chat_screen.dart';
import 'package:demo/check/check.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:/demo/check/Cred.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String msg = '';
  String password;
  bool value = false;
  final _auth = FirebaseAuth.instance;
  bool showspinner = false;
  String e = '';
  String p = '';
  bool _isChecked = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    // _loadUserEmailPassword();
    super.initState();
  }

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
      content: Text("Contact Avi ,if required"),
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

  // void _handleRemeberme(bool value) {
  //   print("Handle Rember Me");
  //   _isChecked = value;
  //   SharedPreferences.getInstance().then(
  //     (prefs) {
  //       prefs.setBool("remember_me", value);
  //       prefs.setString('email', _emailController.text);
  //       prefs.setString('password', _passwordController.text);
  //       print(email);
  //       print("holiday");
  //     },
  //   );
  //   setState(() {
  //     _isChecked = value;
  //   });
  // }

  // void _loadUserEmailPassword() async {
  //   print("Load Email");
  //   try {
  //     SharedPreferences _prefs = await SharedPreferences.getInstance();
  //     var _email = _prefs.getString("email") ?? "";
  //     var _password = _prefs.getString("password") ?? "";
  //     var _remeberMe = _prefs.getBool("remember_me") ?? false;

  //     print(_remeberMe);
  //     print(_email);
  //     print(_password);
  //     if (_remeberMe) {
  //       setState(() {
  //         _isChecked = true;
  //       });
  //       email = _email ?? "";
  //       password = _password ?? "";
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }

  @override
  Widget build(BuildContext context) {
    // var showspinner;
    return Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage('images/avi10.gif'),
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
                          width: MediaQuery.of(context).size.height * 0.45,
                          // height: 150.0,
                          height: MediaQuery.of(context).size.height * 0.45,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/avi4.gif'),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(800.0)),
                            // color: Colors.redAccent,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 48.0,
                      ),
                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          email = value;
                          //Do something with the user input.
                        },
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your Email',
                          // labelStyle: TextStyle(
                          //     fontWeight: FontWeight.bold,
                          //     fontSize: 20,
                          //     color: Colors.yellowAccent),
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          //Do something with the user input.
                          password = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Enter your password'),
                      ),
                      SizedBox(
                        height: 14.0,
                      ),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     SizedBox(
                      //         height: 24.0,
                      //         width: 24.0,
                      //         child: Theme(
                      //           data: ThemeData(
                      //               unselectedWidgetColor:
                      //                   Color(0xff00C8E8) // Your color
                      //               ),
                      //           child: Checkbox(
                      //               activeColor: Color(0xff00C8E8),
                      //               value: _isChecked,
                      //               onChanged: _handleRemeberme),
                      //         )),
                      //     SizedBox(width: 10.0),
                      //     Text(
                      //       "Remember Me",
                      //       style: TextStyle(
                      //           color: Color(0xff646464),
                      //           fontSize: 12,
                      //           fontFamily: 'Rubic'),
                      //     ),
                      //   ],
                      // ),
                      // TextButton.icon(
                      //   onPressed: () {
                      //     print('hello');
                      //   },
                      //   icon: Icon(Icons.access_alarm),
                      //   label: Text('hello'),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(left: 28),
                      //   child: ListTile(
                      //     // minVerticalPadding: 20,
                      //     leading: ,
                      //     title: Text(
                      //       'Remember Me',
                      //       style: TextStyle(fontSize: 14),
                      //     ),
                      //   ),
                      // ),
                      // TextButton(
                      //   onPressed: () {
                      //     print('skjbdvsakvbdksajd');
                      //   },
                      //   //   if (email != '' && password != '') {
                      //   //     setState(() {
                      //   //       cred().email[0] = email;
                      //   //       cred().password[0] = password;
                      //   //       print(email);
                      //   //       print(password);
                      //   //     });
                      //   //   }

                      //   //   if (email == '' && password == '') {
                      //   //     setState(() {
                      //   //       email = cred().email[0];
                      //   //       password = cred().password[0];
                      //   //       print(email);
                      //   //       print(password);
                      //   //     });
                      //   //   }
                      //   // },
                      //   child: Text(
                      //     'Rememeber Credentials',
                      //     style: TextStyle(color: Colors.black, fontSize: 12),
                      //   ),
                      // ),
                      // RaisedButton(onPressed: onPressed)

                      RoundedButton(
                        title: 'Login',
                        color: Colors.white,
                        Onpressed: () async {
                          setState(() {
                            showspinner = true;
                          });

                          try {
                            int n = check(email);
                            if (n == 1) {
                              final newuser =
                                  await _auth.signInWithEmailAndPassword(
                                      email: email, password: password);

                              if (newuser != null) {
                                // print(email);
                                // print("");
                                // print(newuser);
                                Navigator.pushNamed(
                                    context, loginmainscreen.id);

                                setState(() {
                                  showspinner = false;
                                });
                              }
                            } else {
                              msg = 'Wrong Email or Password';
                              showAlertDialog(context);
                              setState(() {
                                showspinner = false;
                              });
                            }
                            // if (n == 1) {
                            //   Navigator.pushNamed(context, loginmainscreen.id);
                            //   setState(() {
                            //     showspinner = false;
                            //   });
                            // }

                          } catch (e) {
                            print(e);
                            msg = 'Wrong Password';
                            showAlertDialog(context);
                            setState(() {
                              showspinner = false;
                            });
                          }
                          //Implement registration functionality.
                        },
                      ),
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

// void _handleRemeberme(bool value) {
//     print("Handle Rember Me");
//     _isChecked = value;
//     SharedPreferences.getInstance().then(
//       (prefs) {
//         prefs.setBool("remember_me", value);
//         prefs.setString('email', _emailController.text);
//         prefs.setString('password', _passwordController.text);
//       },
//     );
//     setState(() {
//       _isChecked = value;
//     });
//   }

//   void _loadUserEmailPassword() async {
//     print("Load Email");
//     try {
//       SharedPreferences _prefs = await SharedPreferences.getInstance();
//       var _email = _prefs.getString("email") ?? "";
//       var _password = _prefs.getString("password") ?? "";
//       var _remeberMe = _prefs.getBool("remember_me") ?? false;

//       print(_remeberMe);
//       print(_email);
//       print(_password);
//       if (_remeberMe) {
//         setState(() {
//           _isChecked = true;
//         });
//         _emailController.text = _email ?? "";
//         _passwordController.text = _password ?? "";
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
// }

// field(TextEditingController controller, Icon icon, String label) {
//   return Container(
//     decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: Colors.white,
//             blurRadius: 5.0,
//           ),
//         ],
//         borderRadius: BorderRadius.circular(30),
//         border: Border.all(color: Color(0xffECEBEB))),
//     child: TextField(
//         controller: controller,
//         //onChanged: onchange,

//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.only(top: 8, left: 20),
//           focusedBorder: InputBorder.none,
//           enabledBorder: InputBorder.none,
//           errorBorder: InputBorder.none,
//           disabledBorder: InputBorder.none,
//           border: InputBorder.none,
//           suffixIcon: icon,
//           labelText: label,
//           labelStyle: TextStyle(fontSize: 14, decoration: TextDecoration.none),
//         )),
//   );
// }

  // void _handleRemeberme(bool value) {
  //   print("Handle Rember Me");
  //   _isChecked = value;
  //   SharedPreferences.getInstance().then(
  //     (prefs) {
  //       prefs.setBool("remember_me", value);
  //       prefs.setString('email', _emailController.text);
  //       prefs.setString('password', _passwordController.text);
  //     },
  //   );
  //   setState(() {
  //     _isChecked = value;
  //   });
  // }



//   void _loadUserEmailPassword() async {
//     print("Load Email");
//     try {
//       SharedPreferences _prefs = await SharedPreferences.getInstance();
//       var _email = _prefs.getString("email") ?? "";
//       var _password = _prefs.getString("password") ?? "";
//       var _remeberMe = _prefs.getBool("remember_me") ?? false;

//       print(_remeberMe);
//       print(_email);
//       print(_password);
//       if (_remeberMe) {
//         setState(() {
//           _isChecked = true;
//         });
//         _emailController.text = _email ?? "";
//         _passwordController.text = _password ?? "";
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
// }