import 'package:demo/screens/login_screen.dart';
import 'package:demo/screens/registeration.dart';
import 'package:demo/screens/videoc.dart';
import 'package:flutter/material.dart';
import 'package:demo/main.dart';
import 'package:demo/components/components.dart';
import 'package:video_player/video_player.dart';

class WelcomeScreen extends StatefulWidget {
  // gnfgfgnfm fhf   gfgfjghjgvbhm
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  VideoPlayerController _controller;
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: (this),
    );
    animation = ColorTween(
      begin: Color(0xffED1C38),
      end: Color(0xfffc0526),
    ).animate(controller);
    // animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    controller.forward();
    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

    controller.addListener(() {
      setState(() {
        // print(animation.value);
      });
    });
    // _controller = VideoPlayerController.asset('videos/vid1.mp4')
    //   ..initialize().then((_) {
    //     _controller.play();
    //     _controller.setLooping(true);
    //     // Ensure the first frame is shown after the video is initialized
    //     setState(() {});
    //   });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage('images/avi9.gif'),
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
                                image: AssetImage('images/avi.gif'),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(370.0)),
                              // color: Colors.redAccent,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
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
                          'COE2 ARENA',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          '© App by Aviral ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 48.0,
                    ),
                    RoundedButton(
                        title: 'Log In',
                        color: Color(0xffffffff),
                        Onpressed: () {
                          print('LOG IN');
                          Navigator.pushNamed(context, LoginScreen.id);
                        }),
                    RoundedButton(
                        title: 'Register',
                        // color: Color(0xff3B3B3B),
                        color: Color(0xffffffff),
                        Onpressed: () {
                          print('REGISTER IN');
                          Navigator.pushNamed(context, RegistrationScreen.id);
                        }),
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
