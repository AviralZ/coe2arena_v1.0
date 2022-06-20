// import 'package:demo/constants.dart';
// import 'package:flutter/material.dart';

// class check2 extends StatefulWidget {
//   // const check2({ Key? key }) : super(key: key);

//   @override
//   _check2State createState() => _check2State();
// }

// class _check2State extends State<check2> {
//   final String sender;
//   final String val;
//   bool istrue = true;

//   check2State({this.sender, this.val});

//   @override
//   Widget build(BuildContext context) {
//     return (istrue
//         ? Container(
//             decoration: kMessageContainerDecoration,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Expanded(
//                   child: TextField(
//                     controller: messageTextController,
//                     onChanged: (value) {
//                       //Do something with the user input.
//                       msg = value;
//                     },
//                     decoration: kMessageTextFieldDecoration,
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     getUser();
//                     messageTextController.clear();
//                     _firestore.collection('messages').add({
//                       'text': msg,
//                       'sender': loggedInUser.email,
//                       'created_at': FieldValue.serverTimestamp()
//                     });
//                     //Implement send functionality.
//                   },
//                   child: Text(
//                     'Send',
//                     style: kSendButtonTextStyle,
//                   ),
//                 ),
//               ],
//             ),
//           )
//         : Container(
//             child: Text("Hello"),
//           ));
//   }
// }
// class yesorno extends StatelessWidget {
//   final String sender;
//   final String val;
//   bool istrue = true;

//   yesorno({this.sender,this.val});

//   get messageTextController => null;

//   @override
//   Widget build(BuildContext context) {
//     return (istrue
//         ? Container(
//             decoration: kMessageContainerDecoration,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Expanded(
//                   child: TextField(
//                     controller: messageTextController,
//                     onChanged: (value) {
//                       //Do something with the user input.
//                       msg = value;
//                     },
//                     decoration: kMessageTextFieldDecoration,
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     getUser();
//                     messageTextController.clear();
//                     _firestore.collection('messages').add({
//                       'text': msg,
//                       'sender': loggedInUser.email,
//                       'created_at': FieldValue.serverTimestamp()
//                     });
//                     //Implement send functionality.
//                   },
//                   child: Text(
//                     'Send',
//                     style: kSendButtonTextStyle,
//                   ),
//                 ),
//               ],
//             ),
//           )
//         : Container(
//             child: Text("Hello"),
//           ));
//   }
// }

//         Container(
//               decoration: kMessageContainerDecoration,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Expanded(
//                     child: TextField(
//                       controller: messageTextController,
//                       onChanged: (value) {
//                         //Do something with the user input.
//                         msg = value;
//                       },
//                       decoration: kMessageTextFieldDecoration,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       getUser();
//                       messageTextController.clear();
//                       _firestore.collection('messages').add({
//                         'text': msg,
//                         'sender': loggedInUser.email,
//                         'created_at': FieldValue.serverTimestamp()
//                       });
//                       //Implement send functionality.
//                     },
//                     child: Text(
//                       'Send',
//                       style: kSendButtonTextStyle,
//                     ),
//                   ),
//                 ],
//               ),
//             ),