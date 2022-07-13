import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../config/colors.dart';


class FollowAuthor extends StatefulWidget {
  static String route = '/follow_author';
  const FollowAuthor({Key? key}) : super(key: key);

  @override
  _FollowAuthorState createState() => _FollowAuthorState();
}

class _FollowAuthorState extends State<FollowAuthor> {
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
                      Padding(padding: EdgeInsets.symmetric(vertical: 40.5)),
                      Center(
                        child: Image.asset('assets/images/friends.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 70.5),
                        child: Text(
                          'Who to Follow',
                          style: TextStyle(
                              color: HexColor(MMfxColor.primary),
                              fontFamily: 'Inter-Bold',
                              fontWeight: FontWeight.w700,
                              fontSize: 24),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.5),
                        child: Text(
                          'Follow the author and get the update',
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontFamily: 'Inter-Regular',
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 400,
                        child: GridView.count(
                          // Create a grid with 2 columns. If you change the scrollDirection to
                          // horizontal, this produces 2 rows.
                          crossAxisCount: 3,
                          // Generate 100 widgets that display their index in the List.
                          children: List.generate(9, (index) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage('assets/images/friends.png'),
                                    radius: 30,
                                  ),
                                  Padding(padding: EdgeInsets.symmetric(vertical: 8.5),
                                  child: Text('Kyaw Kunt',style: TextStyle(
                                    fontFamily: 'Inter-Regular',
                                    fontSize: 14,
                                    color: HexColor(MMfxColor.primary)
                                  ),),)
                                ],
                              )
                            );
                          }),
                        ),
                      ),


                      Padding(padding: EdgeInsets.symmetric(vertical: 15.5)),

                      Row(

                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle:  TextStyle(fontSize: 16,color: Colors.grey.shade700),
                            ),
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/mmfx_main');
                            },
                            child:  Text('Skip',style: TextStyle(decoration: TextDecoration.underline),),
                          ),

                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary:
                                HexColor(MMfxColor.primary), // background
                                onPrimary: Colors.white, // foreground
                              ),
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, '/mmfx_main');
                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 10,left: 14,right: 14),
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                      fontFamily: 'Inter-Medium',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: HexColor(MMfxColor.secondary)),
                                ),
                              )),
                        ],
                      )
                    ],
                  )),
            )),
      ),
    );
  }
}
