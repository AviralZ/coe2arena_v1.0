import 'dart:io';
import 'package:flutter/material.dart';
import 'package:demo/screens/chat_screen.dart';
import 'package:demo/screens/login_screen.dart';
import 'package:demo/screens/registeration.dart';
import 'package:demo/screens/welcome._screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

// class Timetable extends StatelessWidget {
//   // const Timetable({ Key? key }) : super(key: key);
//   static const String id = 'timetable_screen';

// //  @override
// //   void initState() {
// //     super.initState();
// //     // Enable hybrid composition.
// //     if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
// //   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('AVI'),
//       ),
//       body: WebView(
//         initialUrl: 'https://www.google.com',
//         javascriptMode: JavascriptMode.unrestricted,
//       ),
//     );
//   }
// }

//  }

class Material2Screen extends StatefulWidget {
  // const Timetable({ Key? key }) : super(key: key);
  static const String id = 'contacts_screen';

  @override
  _Material2ScreenState createState() => _Material2ScreenState();
}

class _Material2ScreenState extends State<Material2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8501F6),
        // centerTitle: true,
        title: Text(
          'Contacts',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      ),
      body: WebView(
        initialUrl:
            'https://docs.google.com/spreadsheets/d/1OxUMmYdgsCUwbhzulurO4YeGboAMIWf9pEHyIu2zSJM/edit#gid=0',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
