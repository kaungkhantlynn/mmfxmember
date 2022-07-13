import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../config/colors.dart';
import 'welcome.dart';

class CreatePassword extends StatefulWidget {
  static String route = '/create_password';

  const CreatePassword({Key? key}) : super(key: key);

  @override
  _CreatePasswordState createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
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
                          'Create Your Password',
                          style: TextStyle(
                              color: HexColor(MMfxColor.primary),
                              fontFamily: 'Inter-Bold',
                              fontWeight: FontWeight.w700,
                              fontSize: 24),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.5, vertical: 15.5),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: HexColor(
                                        MMfxColor.primary,
                                      ),
                                      width: 1.5)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: HexColor(
                                        MMfxColor.primary,
                                      ),
                                      width: 1.5)),
                              labelText: 'Password',
                              hintText: 'Enter password'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.5, vertical: 15.5),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: HexColor(
                                        MMfxColor.primary,
                                      ),
                                      width: 1.5)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: HexColor(
                                        MMfxColor.primary,
                                      ),
                                      width: 1.5)),
                              labelText: 'Confirm Password',
                              hintText: 'Enter confirm password'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.5, vertical: 15.5),
                        child: FractionallySizedBox(
                          widthFactor: 1,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary:
                                    HexColor(MMfxColor.primary), // background
                                onPrimary: Colors.white, // foreground
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, Welcome.route);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: 15, bottom: 15),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontFamily: 'Inter-Medium',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: HexColor(MMfxColor.secondary)),
                                ),
                              )),
                        ),
                      ),
                    ],
                  )),
            )),
      ),
    );
  }
}
