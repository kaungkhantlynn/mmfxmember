import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../config/colors.dart';
import '../../data/local/constants/svgImages.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _nameController = new TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
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
              Text("  Edit Profile",style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.white,fontSize: 24,fontFamily: 'Inter'),),
            ],
          )
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(100)),
                border: Border.all(
                    color: Colors.white,
                    width: 2
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset('assets/images/profile.png').image,
                        fit: BoxFit.cover
                    ),
                    shape: BoxShape.circle
                ),
              ),),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text('Change Profile Picture', style: TextStyle(fontFamily: 'Poppings',
                  color:Colors.black87,fontSize: 18),),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 40,left: 15.5),
              child: Text("Name",style: TextStyle(color: Color(0xff0C1553),fontWeight: FontWeight.bold,fontSize: 16,fontFamily: 'Inter'),)

              // child: Text("Name",style: TextStyle(color: Color(0xff0C1553),fontSize: 14,fontFamily: 'Inter'),)
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.5, vertical: 15.5),
              child: TextFormField(
                controller: _nameController,
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
                    hintText: 'Kyaw Kyaw',
                  hintStyle: TextStyle(color: Color(0xff0C1553),fontSize: 18,fontFamily: 'Inter'),),
              ),
            ),
            //subscribe
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
        )
      )
    );
  }
}
