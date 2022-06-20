// import 'dart:html';

import 'package:demo/check/check.dart';
import 'package:demo/login%20screens/teach.dart';
import 'package:flutter/material.dart';
import 'package:demo/screens/chat_screen.dart';
import 'package:demo/screens/login_screen.dart';
import 'package:demo/screens/registeration.dart';
import 'package:demo/screens/welcome._screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:demo/login screens/timetable.dart';
import 'package:demo/login screens/materialscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flash_chat/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/screens/chat_screen.dart';
import 'package:demo/screens/groupchat.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';

import 'newhome.dart';

// class loginmainscreen extends StatelessWidget {
//   // const loginmainscreen({ Key? key }) : super(key: key);
//   static const String id = 'loginmain_screen';

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

// class loginmainscreen extends StatefulWidget {
//   // const loginmainscreen({ Key? key }) : super(key: key);
//   static const String id = 'loginmain_screen';

//   @override
//   _loginmainscreenState createState() => _loginmainscreenState();
// }

// class _loginmainscreenState extends State<loginmainscreen> {
//   final _auth = FirebaseAuth.instance;
//   User loggeduser;
//   String msg = '';
//   final _firestore = FirebaseFirestore.instance;

//   @override
//   void initstate() {
//     super.initState();
//     getUser();
//   }

//   void getUser() {
//     try {
//       final user = _auth.currentUser;
//       if (user != null) {
//         loggeduser = user;
//         print(loggeduser.email);
//         // print(user);
//       }
//     } catch (e) {
//       // showAlertDialog(context);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // backgroundColor: Color(0xffeb445a),
//         body: Center(
//       child: CustomScrollView(
//         primary: false,
//         slivers: <Widget>[
//           SliverAppBar(
//             backgroundColor: Color(0xffED1C38),
//             pinned: true,
//             floating: false,
//             expandedHeight: 120.0,
//             centerTitle: true,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text(
//                 'COE2 ARENA',
//                 style: GoogleFonts.anton(
//                   textStyle: TextStyle(color: Colors.white, fontSize: 20.0),
//                 ),
//               ),
//             ),
//           ),
//           SliverPadding(
//             padding: const EdgeInsets.all(20),
//             sliver: SliverGrid.count(
//               crossAxisSpacing: 20,
//               mainAxisSpacing: 20,
//               crossAxisCount: 1,
//               children: <Widget>[
//                 TextButton(
//                   onPressed: () {
//                     // print('1');
//                     Navigator.pushNamed(context, Timetable.id);
//                   },
//                   child: Stack(
//                     children: [
//                       Container(
//                         // height: 400,
//                         decoration: new BoxDecoration(
//                           image: new DecorationImage(
//                             image: ExactAssetImage('images/1.jpg'),
//                             fit: BoxFit.fitWidth,
//                           ),
//                           borderRadius: BorderRadius.circular(24),
//                           // color: Colors.green
//                         ),
//                       ),
//                       Container(
//                         alignment: Alignment.center,
//                         child: Text(
//                           'Timetable',
//                           style: GoogleFonts.anton(
//                             textStyle:
//                                 TextStyle(color: Colors.white, fontSize: 30.0),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, groupchat.id);
//                   },
//                   child: Stack(
//                     children: [
//                       Container(
//                         // height: 400,
//                         decoration: new BoxDecoration(
//                           image: new DecorationImage(
//                             image: ExactAssetImage('images/1.jpg'),
//                             fit: BoxFit.fitWidth,
//                           ),
//                           borderRadius: BorderRadius.circular(24),
//                           // color: Colors.green
//                         ),
//                       ),
//                       Container(
//                         alignment: Alignment.center,
//                         child: Text(
//                           'Announcements',
//                           style: GoogleFonts.anton(
//                             textStyle:
//                                 TextStyle(color: Colors.white, fontSize: 30.0),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 // TextButton(
//                 //   onPressed: () {
//                 //     print('svdzdbdzbfdab');
//                 //   },
//                 //   child: Stack(
//                 //     children: [
//                 //       Container(
//                 //         // height: 400,
//                 //         decoration: new BoxDecoration(
//                 //           image: new DecorationImage(
//                 //             image: ExactAssetImage('images/1.jpg'),
//                 //             fit: BoxFit.fitWidth,
//                 //           ),
//                 //           borderRadius: BorderRadius.circular(24),
//                 //           // color: Colors.green
//                 //         ),
//                 //       ),
//                 //       Container(
//                 //         alignment: Alignment.center,
//                 //         child: TextButton(
//                 //           onPressed: () {
//                 //             print('bablo');
//                 //           },
//                 //           child: Text(
//                 //             'Pending Work',
//                 //             style: GoogleFonts.anton(
//                 //               textStyle: TextStyle(
//                 //                   color: Colors.white, fontSize: 30.0),
//                 //             ),
//                 //           ),
//                 //         ),
//                 //       )
//                 //     ],
//                 //   ),
//                 // ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, MaterialScreen.id);
//                   },
//                   child: Stack(
//                     children: [
//                       Container(
//                         // height: 400,
//                         decoration: new BoxDecoration(
//                           image: new DecorationImage(
//                             image: ExactAssetImage('images/1.jpg'),
//                             fit: BoxFit.fitWidth,
//                           ),
//                           borderRadius: BorderRadius.circular(24),
//                           // color: Colors.green
//                         ),
//                       ),
//                       Container(
//                         alignment: Alignment.center,
//                         child: Text(
//                           'Material',
//                           style: GoogleFonts.anton(
//                             textStyle:
//                                 TextStyle(color: Colors.white, fontSize: 30.0),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),

//                 TextButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, Material2Screen.id);
//                   },
//                   child: Stack(
//                     children: [
//                       Container(
//                         // height: 400,
//                         decoration: new BoxDecoration(
//                           image: new DecorationImage(
//                             image: ExactAssetImage('images/1.jpg'),
//                             fit: BoxFit.fitWidth,
//                           ),
//                           borderRadius: BorderRadius.circular(24),
//                           // color: Colors.green
//                         ),
//                       ),
//                       Container(
//                         alignment: Alignment.center,
//                         child: Text(
//                           'Contacts',
//                           style: GoogleFonts.anton(
//                             textStyle:
//                                 TextStyle(color: Colors.white, fontSize: 30.0),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ));
//     ;
//   }
// }

class loginmainscreen extends StatefulWidget {
  // loginmainscreen({Key key}) : super(key: key);
  static const String id = 'loginmain_screen';

  @override
//   _loginmainscreenState createState() => _loginmainscreenState();
  _loginmainscreenState createState() => _loginmainscreenState();
}

class _loginmainscreenState extends State<loginmainscreen> {
  //   final _auth = FirebaseAuth.instance;
  // User loggedInUser;

  //   String getUser() {
  //   try {
  //     final user = _auth.currentUser;
  //     if (user != null) {
  //       loggedInUser = user;
  //       return(nameID(loggedInUser.email));
  //     }
  //   } catch (e) {

  //     // showAlertDialog(context);
  //   }
  // }
  int _selectedIndex = 0;
  final _widgetOptions = [
    // Text('Home Page',
    //     style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    homenew(),
    groupchat(),
    Material2Screen(),
    Timetable(),
    MaterialScreen(),

    // Text('Profile Page',
    //     style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     title: const Text('Flutter BottomNavigationBar Example'),
      //     backgroundColor: Colors.green),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF8501F6),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble),
                label: 'Chats',
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.contact_page_rounded),
                label: 'Contacts',
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
              icon: Icon(Icons.timelapse_rounded),
              label: 'Timetable',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.picture_as_pdf_rounded),
              label: 'Material',
              backgroundColor: Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          iconSize: 20.0,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
