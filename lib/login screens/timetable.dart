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

class Timetable extends StatefulWidget {
  // const Timetable({ Key? key }) : super(key: key);
  static const String id = 'timetable_screen';

  @override
  _TimetableState createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8501F6),
        // centerTitle: true,
        title: Text(
          'Timetable',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      ),
      body: WebView(
        initialUrl: 'https://coe2timetable.netlify.app/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
