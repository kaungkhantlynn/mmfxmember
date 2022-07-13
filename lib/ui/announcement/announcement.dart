import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/local/constants/svgImages.dart';

class Announcement extends StatefulWidget {
  @override
  _AnnouncementState createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F6FF),
      appBar: AppBar(
          backgroundColor: Color(0xff0C1553),
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Announcement",style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.white,fontSize: 24,fontFamily: 'Inter'),),
              Stack(
                children: <Widget>[
                  Center(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:  Icon(Icons.notifications,color: Colors.white,size: 40,)
                    ),
                  ),
                  Positioned(
                      left: 30,
                      top: 25,
                      child:
                      Container(
                        width: 20,
                        height: 20,
                        // color:  Color(0xff0C1553),
                        child: Center(child: Text('12',style: TextStyle(color: Colors.white,fontSize: 7),)),
                        decoration: BoxDecoration(
                            color: Color(0xff0C1553),
                            border: Border.all(color: Color(0xffFFD500)),
                            // color: Colors.orange,
                            shape: BoxShape.circle
                        ),
                      )

                  ),
                ],
              ),
            ],
          )
      ),
      body: SingleChildScrollView(
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
      ),
    );
  }
}
