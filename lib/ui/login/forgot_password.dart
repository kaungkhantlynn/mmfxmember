import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../config/colors.dart';


class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _phoneController = new TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(MMfxColor.backgroundColor),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Myanma Forex (MMFX)',
                      style: TextStyle(color: Color(0xff0C1553),fontSize: 20),
                    )
                  ],
                ),
              ),
              Text("Forgot Your Password?", style: TextStyle(color: Color(0xff0C1553),
                  fontSize: 24,fontWeight: FontWeight.bold)),
              Padding(padding: EdgeInsets.only(top: 30)),
              Text("Enter the phone number associated with your acount.", style: TextStyle(color: Color(0xff0C1553),
                  fontSize: 18)),

              //Phone number
              Padding(
                  // alignment: Alignment.topLeft,
                  // padding: EdgeInsets.only(top: 20,left: 15.5),
                  padding: EdgeInsets.only(top: 30),
                  child: Text("Mobile Phone",style: TextStyle(color: Color(0xff0C1553),fontWeight: FontWeight.bold,fontSize: 16,fontFamily: 'Inter'),)
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.5),
                child: TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                            color: HexColor(MMfxColor.primary,),
                            width: 1.5)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: HexColor(MMfxColor.primary,),
                            width: 2)),
                    hintText: '09xxxxxxxxx',
                    hintStyle: TextStyle(color: Colors.black54,fontSize: 18,fontFamily: 'Inter'),
                  ),
                ),
              ),

              GestureDetector(
                child:  Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.only(top: 10,bottom: 10,left: 40,right: 40),
                    decoration: BoxDecoration(
                      color: Color(0xff0C1553),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      border: Border.all(
                          width: 2
                      ),
                    ),
                    child:  Text("Send",textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.bold,fontSize: 16,color: Color(0xffFFD500)),),
                  ),
                )
              ),


            ],
          ),
        ),
      ),
    );
  }
}
