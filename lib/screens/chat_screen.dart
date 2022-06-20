// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:demo/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flash_chat/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl_standalone.dart';
// import 'dart:html';

class ChatScreen extends StatefulWidget {
  static const String id = 'Chat_Screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initstate() {
    super.initState();
    getUser();
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
      title: Text("Error"),
      content: Text("Check your Internet"),
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

  final _auth = FirebaseAuth.instance;
  User loggedInUser;
  String msg = '';
  final _firestore = FirebaseFirestore.instance;
  // final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').snapshots();

  void messagestream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  void getUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      // showAlertDialog(context);
    }
  }

  void getmessages() async {
    final messages = await _firestore.collection('messages').get();
    for (var message in messages.docs) {
      print(message.data());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('Group Chat'),
        backgroundColor: Color(0xffED1C38),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('messages').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                        backgroundColor: Colors.lightBlueAccent),
                  );
                }

                getUser();
                final messages = snapshot.data.docs;
                List<Text> messageWidgets = [];
                for (var message in messages) {
                  final data = Map<String, String>.from(message.data());
                  final messageText = data['text'];
                  final messageSender = data['sender'];

                  final messageWidget = Text(
                    '$messageText from $messageSender',
                    style: TextStyle(fontSize: 29),
                  );
                  messageWidgets.add(messageWidget);
                }

                // return Expanded(
                //   child: ListView(
                //     children: messageWidgets,
                //   ),
                return Column(
                  children: messageWidgets,
                );
              },
            ),
            //     getUser();
            //     final messages = snapshot.data.docs;
            //     List<MessageBubble> messageBubbles = [];
            //     for (var message in messages) {
            //       final data = Map<String, String>.from(message.data());
            //       final messageText = data['text'];
            //       final messageSender = data['sender'];

            //       final currentUser = loggedInUser.email;

            //       final messageBubble = MessageBubble(
            //         sender: messageSender,
            //         text: messageText,
            //         isMe: currentUser == messageSender,
            //       );

            //       messageBubbles.add(messageBubble);
            //     }
            //     return Expanded(
            //       child: ListView(
            //         reverse: true,
            //         padding:
            //             EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            //         children: messageBubbles,
            //       ),
            //     );
            //   },
            // ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        //Do something with the user input.
                        msg = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Implement send functionality.
                      getUser();
                      _firestore
                          .collection('messages')
                          .add({'text': msg, 'sender': loggedInUser.email});
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.text, this.isMe});

  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0))
                : BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
            elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black54,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// import 'dart:html';
// import 'package:flutter/material.dart';
// import 'package:demo/constants.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flash_chat/constants.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:intl/intl_standalone.dart';

// // import 'dart:html';
// final _firestore = FirebaseFirestore.instance;
// User loggedInUser;

// class ChatScreen extends StatefulWidget {
//   static const String id = 'Chat_Screen';
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final messageTextController = TextEditingController();
//   showAlertDialog(BuildContext context) {
//     // set up the button
//     Widget okButton = TextButton(
//       child: Text("OK"),
//       onPressed: () {
//         Navigator.of(context).pop();
//       },
//     );

//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       title: Text("Error"),
//       content: Text("Check your Internet"),
//       actions: [
//         okButton,
//       ],
//     );

//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }

//   final _auth = FirebaseAuth.instance;
//   // User loggeduser;
//   String msg = '';
//   // final _firestore = FirebaseFirestore.instance;
//   // final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').snapshots();

//   void messagestream() async {
//     await for (var snapshot in _firestore.collection('messages').snapshots()) {
//       for (var message in snapshot.docs) {
//         print(message.data());
//       }
//     }
//   }

//   void getUser() {
//     try {
//       final user = _auth.currentUser;
//       if (user != null) {
//         loggedInUser = user;
//         print(loggedInUser.email);
//       }
//     } catch (e) {
//       // showAlertDialog(context);
//     }
//   }

//   void getmessages() async {
//     final messages = await _firestore.collection('messages').get();
//     for (var message in messages.docs) {
//       print(message.data());
//     }
//   }

//   @override
//   void initstate() {
//     super.initState();
//     getUser();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: null,
//         actions: <Widget>[
//           IconButton(
//               icon: Icon(Icons.close),
//               onPressed: () {
//                 _auth.signOut();
//                 Navigator.pop(context);
//               }),
//         ],
//         title: Text('Announcements'),
//         backgroundColor: Color(0xffED1C38),
//       ),
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             StreamBuilder<QuerySnapshot>(
//               stream: _firestore.collection('messages').snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return Center(
//                     child: CircularProgressIndicator(
//                       backgroundColor: Colors.lightBlueAccent,
//                     ),
//                   );
//                 }
//                 getUser();
//                 final messages = snapshot.data.docs;

//                 List<MessageBubble> messageBubbles = [];
//                 for (var message in messages) {
//                   final data = Map<String, String>.from(message.data());
//                   final messageText = data['text'];
//                   final messageSender = data['sender'];

//                   final currentUser = loggedInUser.email;

//                   final messageBubble = MessageBubble(
//                     sender: messageSender,
//                     text: messageText,
//                     isMe: currentUser == messageSender,
//                   );

//                   messageBubbles.add(messageBubble);
//                 }
//                 return Expanded(
//                   child: ListView(
//                     // reverse: true,
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
//                     children: messageBubbles,
//                   ),
//                 );
//               },
//             ),
//             Container(
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
//                       // Implement send functionality.
//                       getUser();
//                       messageTextController.clear();
//                       _firestore.collection('messages').add({
//                         'text': msg,
//                         'sender': loggedInUser.email,
//                       });
//                     },
//                     child: Text(
//                       'Send',
//                       style: kSendButtonTextStyle,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MessageBubble extends StatelessWidget {
//   MessageBubble({this.sender, this.text, this.isMe});

//   final String sender;
//   final String text;
//   final bool isMe;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(10.0),
//       child: Column(
//         crossAxisAlignment:
//             isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             sender,
//             style: TextStyle(
//               fontSize: 12.0,
//               color: Colors.black54,
//             ),
//           ),
//           Material(
//             borderRadius: isMe
//                 ? BorderRadius.only(
//                     topLeft: Radius.circular(30.0),
//                     bottomLeft: Radius.circular(30.0),
//                     bottomRight: Radius.circular(30.0))
//                 : BorderRadius.only(
//                     bottomLeft: Radius.circular(30.0),
//                     bottomRight: Radius.circular(30.0),
//                     topRight: Radius.circular(30.0),
//                   ),
//             elevation: 5.0,
//             color: isMe ? Colors.red[400] : Colors.white,
//             child: Padding(
//               padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//               child: Text(
//                 text,
//                 style: TextStyle(
//                   color: isMe ? Colors.white : Colors.black,
//                   fontSize: 15.0,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
