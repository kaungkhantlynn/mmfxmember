import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/local/constants/svgImages.dart';
import '../post/post_comment.dart';
import '../post/post_detail.dart';

class SearchPosts extends StatefulWidget {
  @override
  _SearchPostsState createState() => _SearchPostsState();
}

class _SearchPostsState extends State<SearchPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F6FF),
      body: ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: 4,
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
                            //icon
                            GestureDetector(
                              onTap: (){
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => AuthorProfile()),
                                // );
                              },
                              child: Container(
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
                            ),
                            Padding(padding: EdgeInsets.only(left: 20)),


                            Expanded(
                              child:
                              GestureDetector(
                                onTap: ()=>Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PostDetail()),
                                ),
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
                              GestureDetector(
                                onTap: ()=>Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PostComment()),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.string(SvgImages.message,color: Color(0xff535B88),width: 30,height: 30,),
                                    Text(index.toString(),style: TextStyle(fontFamily: 'Inter',
                                        fontSize: 16,color: Color(0xff535B88)))
                                  ],
                                ),
                              ),
                              Text("4:00 PM Feb 20",style: TextStyle(fontFamily: 'Inter',
                                  fontSize: 16,color: Color(0xff535B88)))
                            ],
                          ),
                        )
                      ],
                    )
                ),
                Divider(thickness: 1,color: Colors.black45,)
                // Divider(color: Color(0xff0C1553),),
              ],
            );
          }
      ),
    );
  }
}
