import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/local/constants/svgImages.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
              Text("  Notification",style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.white,fontSize: 24,fontFamily: 'Inter'),),
            ],
          )
      ),
      body: SingleChildScrollView(
        child:
        ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context,state){
              return
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: Row(
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
                          Padding(padding: EdgeInsets.only(left: 15)),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Ko Htet Post a new announcement",style: TextStyle(fontFamily: 'Inter',fontSize: 20,color: Color(0xff0C1553)),),
                                Padding(padding: EdgeInsets.only(top: 5)),
                                Text("4:00 PM Feb 2022",style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: Color(0xff535B88)),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(thickness: 1,color: Colors.black45,)
                  ],
                );
            }),
      ),
    );
  }
}
