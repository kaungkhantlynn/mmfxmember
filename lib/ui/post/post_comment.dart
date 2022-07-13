import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../config/colors.dart';

class PostComment extends StatefulWidget {
  @override
  _PostCommentState createState() => _PostCommentState();
}

class _PostCommentState extends State<PostComment> {
  TextEditingController _commentController = new TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f6ff),
      body: SingleChildScrollView(
        child: Container(
          // padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(12, 50, 10, 0),
                  child: Text("3 comments",style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.w500,fontSize: 18,color: Color(0xff0C1553)),)),

              //comment
              Container(
                padding: EdgeInsets.fromLTRB(12, 10, 10, 0),
                child: Row(
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
                    Expanded(
                      child: TextFormField(
                        controller: _commentController,
                        minLines:1,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: ' Write a Comment',
                          hintStyle: TextStyle(color: Color(0xffC4C4C4),fontSize: 16,fontFamily: 'Rasa'),
                          // suffixIcon:SvgPicture.string(SvgImages.send,color: Color(0xff0C1553)),
                          suffixIcon: Icon(Icons.send,color: Color(0xff0C1553),),
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(
                                  color: HexColor(MMfxColor.primary,),
                                  width: 1.5)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(color: HexColor(MMfxColor.primary,),
                                  width: 1.5)),

                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //listView
              ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context,state){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //icon, ago
                        Container(
                          padding: EdgeInsets.fromLTRB(12, 0, 10, 10),
                          child: Row(
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
                              Padding(padding: EdgeInsets.only(left: 10)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Ko Htet",style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.w500,fontSize: 18,color: Color(0xff0C1553)),),
                                  Text("14 mins ago",style: TextStyle(fontFamily: 'Inter',fontSize: 18,color: Color(0xff535B88)),),
                                ],
                              )
                            ],
                          ),
                        ),

                        //text
                        Container(
                          padding: EdgeInsets.fromLTRB(12, 0, 10, 0),
                          child: Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here'.",
                            style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.w500,fontSize: 18,color: Color(0xff0C1553)),),
                        ),

                        Divider(thickness: 1,color: Colors.black45,)
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
