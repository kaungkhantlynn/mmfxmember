import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../config/colors.dart';
import '../../data/local/constants/svgImages.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController _oldPasswordController = new TextEditingController();
  TextEditingController _newPasswordController = new TextEditingController();
  TextEditingController _confirmPasswordController = new TextEditingController();
  bool hideOldPassword=true;
  bool hideNewPassword=true;
  bool hideConfirmPassword=true;

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F6FF),
      appBar: AppBar(
          backgroundColor: Color(0xff0C1553),
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  width: 50,
                  height: 50,
                  child: SvgPicture.string(SvgImages.back_arrow,color: Colors.white,),
                ),
              ),
              Text("  Change Password",style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.white,fontSize: 24,fontFamily: 'Inter'),),
            ],
          )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // margin: EdgeInsets.symmetric(horizontal: 15.5),
              padding: EdgeInsets.only(left: 15.5,top: 60),
              alignment: Alignment.topLeft,
              child: Text("Change your password",style: TextStyle(color: Color(0xff0C1553),fontWeight: FontWeight.bold,fontSize: 24,
                  fontFamily: 'Inter'),),
            ),

            //old password
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 50,left: 15.5),
                child: Text("Old Password",style: TextStyle(color: Color(0xff0C1553),fontWeight: FontWeight.bold,fontSize: 14,fontFamily: 'Inter'),)
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.5, vertical: 15.5),
              child: TextFormField(
                controller: _oldPasswordController,
                obscureText: hideOldPassword,
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
                          width: 1.5)),
                  hintText: 'Enter Old Password',
                  hintStyle: TextStyle(color: Color(0xff535B88),fontSize: 18,fontFamily: 'Inter'),
                    suffixIcon: hideOldPassword?
                    IconButton(
                        onPressed: (){
                          setState(() {
                            hideOldPassword=!hideOldPassword;
                          });
                        },
                        icon: SvgPicture.string(SvgImages.remove_eye,width: 25,height: 25,color: Colors.black45,),
                        // icon: Icon(Icons.lock,color: Color(0xff96AFB8),)
                    ):
                    IconButton(
                        onPressed: (){
                          setState(() {
                            hideOldPassword=!hideOldPassword;
                          });
                        },
                      icon: SvgPicture.string(SvgImages.eye,width: 25,height: 25,color: Colors.black45,),
                    )
                ),
              ),
            ),

            //new password
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 15,left: 15.5),
                child: Text("New Password",style: TextStyle(color: Color(0xff0C1553),fontWeight: FontWeight.bold,fontSize: 14,fontFamily: 'Inter'),)
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.5, vertical: 15.5),
              child: TextFormField(
                controller: _newPasswordController,
                obscureText: hideNewPassword,
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
                            width: 1.5)),
                    hintText: 'Enter New Password',
                    hintStyle: TextStyle(color: Color(0xff535B88),fontSize: 18,fontFamily: 'Inter'),
                    suffixIcon: hideNewPassword?
                    IconButton(
                      onPressed: (){
                        setState(() {
                          hideNewPassword=!hideNewPassword;
                        });
                      },
                      icon: SvgPicture.string(SvgImages.remove_eye,width: 25,height: 25,color: Colors.black45,),
                      // icon: Icon(Icons.lock,color: Color(0xff96AFB8),)
                    ):
                    IconButton(
                      onPressed: (){
                        setState(() {
                          hideNewPassword=!hideNewPassword;
                        });
                      },
                      icon: SvgPicture.string(SvgImages.eye,width: 25,height: 25,color: Colors.black45,),
                    )
                ),
              ),
            ),

            //confirm password
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 15,left: 15.5),
                child: Text("Confirm New Password",style: TextStyle(color: Color(0xff0C1553),fontWeight: FontWeight.bold,fontSize: 14,fontFamily: 'Inter'),)
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.5, vertical: 15.5),
              child: TextFormField(
                controller: _confirmPasswordController,
                obscureText: hideConfirmPassword,
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
                            width: 1.5)),
                    hintText: 'Enter Confirm New Password',
                    hintStyle: TextStyle(color: Color(0xff535B88),fontSize: 18,fontFamily: 'Inter'),
                    suffixIcon: hideConfirmPassword?
                    IconButton(
                      onPressed: (){
                        setState(() {
                          hideConfirmPassword=!hideConfirmPassword;
                        });
                      },
                      icon: SvgPicture.string(SvgImages.remove_eye,width: 25,height: 25,color: Colors.black45,),
                      // icon: Icon(Icons.lock,color: Color(0xff96AFB8),)
                    ):
                    IconButton(
                      onPressed: (){
                        setState(() {
                          hideConfirmPassword=!hideConfirmPassword;
                        });
                      },
                      icon: SvgPicture.string(SvgImages.eye,width: 25,height: 25,color: Colors.black45,),
                    )
                ),
              ),
            ),

            //save
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.5, vertical: 15.5),
              padding: EdgeInsets.only(top: 10,bottom: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xff0C1553),
                borderRadius: BorderRadius.all(Radius.circular(6)),
                border: Border.all(
                    width: 2
                ),
              ),
              child:  Text("Save",textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.bold,fontSize: 16,color: Color(0xffFFD500)),),
            )

          ],
        ),
      ),
    );
  }
}
