import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

import '../../config/colors.dart';
import 'create_password.dart';

class Verification extends StatefulWidget {
  static String route = '/verification';
  const Verification({Key? key}) : super(key: key);

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";
  String text = '';
  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: Duration(seconds: 2),
      ),
    );
  }

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
                          'Enter verification code',
                          style: TextStyle(
                              color: HexColor(MMfxColor.primary),
                              fontFamily: 'Inter-Bold',
                              fontWeight: FontWeight.w800,
                              fontSize: 24),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.5),
                        child: Text(
                          'We have sent you an SMS with the code!',
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontFamily: 'Poppins-Medium',
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.5),
                        child: PinCodeTextField(
                          appContext: context,
                          pastedTextStyle: TextStyle(
                            color: HexColor(MMfxColor.primary),
                            fontWeight: FontWeight.bold,
                          ),
                          length: 6,
                          obscureText: true,
                          obscuringCharacter: '*',
                          // obscuringWidget: FlutterLogo(
                          //   size: 24,
                          // ),
                          blinkWhenObscuring: true,
                          animationType: AnimationType.fade,
                          validator: (v) {
                            if (v!.length < 3) {
                              return "I'm from validator";
                            } else {
                              return null;
                            }
                          },
                          pinTheme: PinTheme(
                              inactiveFillColor:
                                  HexColor(MMfxColor.backgroundColor),
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: 50,
                              fieldWidth: 50,
                              selectedFillColor:
                                  HexColor(MMfxColor.backgroundColor),
                              activeFillColor: Colors.white,
                              inactiveColor: HexColor(MMfxColor.primary)),
                          cursorColor: Colors.black,
                          animationDuration: Duration(milliseconds: 300),
                          enableActiveFill: true,
                          errorAnimationController: errorController,
                          controller: textEditingController,
                          keyboardType: TextInputType.number,
                          boxShadows: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              color: Colors.black12,
                              blurRadius: 10,
                            )
                          ],
                          onCompleted: (v) {
                            print("Completed");
                          },
                          // onTap: () {
                          //   print("Pressed");
                          // },
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              currentText = value;
                            });
                          },
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(5.5)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "If you don't receive a code! ",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey.shade700),
                          ),
                          Text(
                            'Resend!',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                decoration: TextDecoration.underline),
                          )
                        ],
                      ),
                      NumericKeyboard(
                        onKeyboardTap: _onKeyboardTap,
                        textColor: HexColor(MMfxColor.primary),
                        rightButtonFn: () {
                          setState(() {
                            textEditingController.text = textEditingController
                                .text
                                .substring(0, text.length - 1);
                          });
                        },
                        rightIcon: Icon(
                          Icons.backspace,
                          color: HexColor(MMfxColor.primary),
                        ),
                        leftButtonFn: () {
                          print('left button clicked');
                        },
                        leftIcon: Icon(
                          Icons.check,
                          color: HexColor(MMfxColor.primary),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10.5)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.5),
                        child: FractionallySizedBox(
                          widthFactor: 1,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary:
                                    HexColor(MMfxColor.primary), // background
                                onPrimary: Colors.white, // foreground
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, CreatePassword.route);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: 15, bottom: 15),
                                child: Text(
                                  'Continue',
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

  _onKeyboardTap(String value) {
    setState(() {
      textEditingController.text = textEditingController.text + value;
    });
  }
}
