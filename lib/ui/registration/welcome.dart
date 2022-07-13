import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../config/colors.dart';
import 'follow_author.dart';

class Welcome extends StatefulWidget {
  static String route = '/welcome';
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: SafeArea(
        child: Scaffold(
            backgroundColor: HexColor(MMfxColor.backgroundColor),
            body: SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.symmetric(vertical: 30)),
                      Center(
                        child:  Container(
                            width: 130,
                            height: 130,
                            child: Image.asset('assets/images/MMFXlogo.png')
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 90.5),
                        child: Text(
                          'Welcome, Aung Aung!',
                          style: TextStyle(
                              color: HexColor(MMfxColor.primary),
                              fontFamily: 'Inter-Bold',
                              fontWeight: FontWeight.w700,
                              fontSize: 24),
                        ),
                      ),
                      Image.asset('assets/images/welcome.png'),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.5, vertical: 15.5),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary:
                                    HexColor(MMfxColor.primary), // background
                                onPrimary: Colors.white, // foreground
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, FollowAuthor.route);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: 15, bottom: 15),
                                child: Text(
                                  'Get Started',
                                  style: TextStyle(
                                      fontFamily: 'Inter-Medium',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: HexColor(MMfxColor.secondary)),
                                ),
                              )),
                        ),
                      )
                    ],
                  )),
            )),
      ),
    );
  }
}
