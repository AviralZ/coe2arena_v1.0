// import 'dart:html';
import 'package:demo/components/components.dart';
import 'package:flutter/material.dart';
import 'package:demo/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flash_chat/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl_standalone.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:demo/check/check.dart';
// import 'dart:html';

class groupchat extends StatefulWidget {
  // const groupchat({ Key? key }) : super(key: key);
  static const String id = 'groupchat';

  @override
  _groupchatState createState() => _groupchatState();
}

class _groupchatState extends State<groupchat> {
  final messageTextController = TextEditingController();
  @override
  void initstate() {
    super.initState();
    getUser();
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

  String getUseremail() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        return ((loggedInUser.email).toString());
      }
    } catch (e) {
      // showAlertDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: null,
        // actions: <Widget>[
        //   // IconButton(
        //   //     icon: Icon(Icons.logout),
        //   //     onPressed: () {
        //   //       _auth.signOut();
        //   //       Navigator.pop(context);
        //   //     }),
        // ],
        title: Text(
          'Announcements',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        // centerTitle: true,
        backgroundColor: Color(0xFF8501F6),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              // stream: _firestore.collection('messages').snapshots(),
              stream: _firestore
                  .collection('messages')
                  .orderBy('created_at', descending: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.lightBlueAccent,
                    ),
                  );
                }
                getUser();
                final messages = snapshot.data.docs.reversed;
                List<MessageBubble> messageBubbles = [];

                for (var message in messages) {
                  final messageText = message['text'];
                  final messageSender = message['sender'];
                  // final data = Map<String, String>.from(message.data());
                  // final messageText = data['text'];
                  // final messageSender = data['sender'];

                  final currentUser = loggedInUser.email;

                  final messageBubble = MessageBubble(
                    sender: messageSender,
                    text: messageText,
                    isMe: currentUser == messageSender,
                  );

                  messageBubbles.add(messageBubble);
                }
                return Expanded(
                  child: ListView(
                    reverse: true,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                    children: messageBubbles,
                  ),
                );
              },
            ),

            // RoundedButton(Onpressed: Onpressed),

            yesorno(getUseremail())
                ? Container(
                    decoration: kMessageContainerDecoration,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: messageTextController,
                            onChanged: (value) {
                              //Do something with the user input.
                              msg = value;
                            },
                            decoration: kMessageTextFieldDecoration,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            getUser();
                            messageTextController.clear();
                            _firestore.collection('messages').add({
                              'text': msg,
                              'sender': loggedInUser.email,
                              'created_at': FieldValue.serverTimestamp()
                            });
                            //Implement send functionality.
                          },
                          child: Text(
                            'Send',
                            style: kSendButtonTextStyle,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
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
    String senderName = nameID(sender);
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            // sender,
            senderName,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0))
                : BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
            elevation: 5.0,
            color: isMe ? Color(0xFF8501F6) : Colors.white70,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black,
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
