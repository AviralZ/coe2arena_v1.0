// import 'dart:html';

import 'package:flutter/material.dart';
// import 'package:demo/screens/home.dart';
import 'package:demo/screens/login_screen.dart';
import 'package:demo/screens/registeration.dart';
import 'package:demo/screens/welcome._screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:demo/login screens/loginmainscreen.dart';
import 'package:demo/login screens/timetable.dart';
import 'package:demo/login screens/materialscreen.dart';
import 'package:demo/screens/chat_screen.dart';
import 'package:demo/screens/groupchat.dart';
import 'package:demo/login screens/teach.dart';

// void main() {
//   runApp(MyApp());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        // ChatScreen.id: (context) => ChatScreen(),
        loginmainscreen.id: (context) => loginmainscreen(),
        Timetable.id: (context) => Timetable(),
        MaterialScreen.id: (context) => MaterialScreen(),
        groupchat.id: (context) => groupchat(),
        Material2Screen.id: (context) => Material2Screen(),
      },
    );
  }
}
