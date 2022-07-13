import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:linkfy_text/linkfy_text.dart';

import '../../config/colors.dart';
import 'terms_and_conditions.dart';
import 'verification.dart';

class Register extends StatefulWidget {
  static String route = '/register';
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isAgreeChecked = false;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: HexColor(MMfxColor.backgroundColor),
      body: Column(
        children: [
          Container(
            width: mediaQuery.size.width,
            height: mediaQuery.size.height / 4,
            decoration: BoxDecoration(
                border:
                    Border.all(width: 0, color: HexColor(MMfxColor.primary)),
                color: HexColor(MMfxColor.primary),
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(140))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 130,
                    height: 130,
                    child: Image.asset('assets/images/MMFXlogo.png')
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            width: mediaQuery.size.width,
            color: HexColor(MMfxColor.primary),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 0, color: HexColor(MMfxColor.backgroundColor)),
                color: HexColor(MMfxColor.backgroundColor),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(140)),
              ),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(30)),
                  Text(
                    'WELCOME',
                    style: TextStyle(
                        fontFamily: 'Inter-Bold',
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: HexColor(MMfxColor.primary)),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.5, vertical: 15.5),
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
                          labelText: 'Name',
                          hintText: 'Enter Your Name'),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.5, vertical: 15.5),
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
                          labelText: '09 xxxx xxxx',
                          hintText: 'Mobile Phone'),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(7.5)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isAgreeChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isAgreeChecked = value!;
                          });
                        },
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '"By checking this box, you are agreeing to our'),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, TermsAndConditions.route);
                            },
                            child: Text(
                              'term of service',
                              style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(10.5)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.5),
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: HexColor(MMfxColor.primary), // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, Verification.route);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  fontFamily: 'Inter-Medium',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: HexColor(MMfxColor.secondary)),
                            ),
                          )),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10.5)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Alerady Member?'),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/login');
                        },
                        child:  Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    ));
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return HexColor(MMfxColor.primary);
  }
}
