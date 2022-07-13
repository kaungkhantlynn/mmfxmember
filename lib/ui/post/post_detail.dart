import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/local/constants/svgImages.dart';

class PostDetail extends StatefulWidget {
  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f6ff),
      appBar: AppBar(
          backgroundColor: Color(0xff0C1553),
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 50,
                height: 50,
                child: SvgPicture.string(SvgImages.back_arrow,color: Colors.white,),
              ),
            ),
          )
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: [
              //title
              Text("Wall Street Sags as Americans  Turn Focus to Real-World Problems",
                style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.bold,
                  fontSize: 24,color: Color(0xff0C1553)),),
              Padding(padding: EdgeInsets.only(top: 15)),

              //icon,name
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //icon , name
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
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
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Text("Ko Htet",style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: Color(0xff535B88)),),

                    ],
                  ),
                  //date
                  Text("4:56 PM Feb 20",style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: Color(0xff535B88)),),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 25)),

              //info
              Text("The higher meat prices has, however, had the Biden administration concerned as profits continue to mount at meatpackers. Analysts have said increased operating margins could attract more unwanted scrutiny from Washington for Tyson and three other industry behemoths that slaughter about 85% of grain-fattened cattle carved into steaks for consumer.",
                style: TextStyle(fontFamily: 'Inter',fontSize: 20,color: Color(0xff0C1553)),),
            ],
          ),
        ),
      ),
    );
  }
}
