import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/local/constants/svgImages.dart';

class AuthorPublic extends StatefulWidget {
  @override
  _AuthorPublicState createState() => _AuthorPublicState();
}

class _AuthorPublicState extends State<AuthorPublic> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // padding: EdgeInsets.all(20),
      child:
      //List
      ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: 3,
          itemBuilder: (BuildContext context, int index){
            return Column(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      children: [
                        //image, text, bookmark
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 65,
                              height: 65,
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
                            Padding(padding: EdgeInsets.only(left: 20)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Ko Htet",style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.w500,fontSize: 18,color: Color(0xff0C1553)),),
                                  Padding(padding: EdgeInsets.only(top: 5)),
                                  Text("Wall Street Sags as Americans  Turn Focus to Real-World",
                                    style: TextStyle(fontFamily: 'Inter',fontSize: 20,color: Color(0xff0C1553)),),
                                ],
                              ),
                            ),
                            SvgPicture.string(SvgImages.bookmark_add,color: Color(0xff0C1553),width: 30,height: 30,),
                          ],
                        ),

                        //chat and time
                        Container(
                          padding: EdgeInsets.only(left: 90,top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.string(SvgImages.message,color: Color(0xff535B88),width: 30,height: 30,),
                                  Text(index.toString(),style: TextStyle(fontFamily: 'Inter',
                                      fontSize: 16,color: Color(0xff535B88)))
                                ],
                              ),
                              Text("4:00 PM Feb 20",style: TextStyle(fontFamily: 'Inter',
                                  fontSize: 16,color: Color(0xff535B88)))
                            ],
                          ),
                        )
                      ],
                    )
                ),
                Divider(color: Color(0xff0C1553),),
              ],
            );
          }
      ),
    );
  }
}
