import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthorPrivate extends StatefulWidget {
  @override
  _AuthorPrivateState createState() => _AuthorPrivateState();
}

class _AuthorPrivateState extends State<AuthorPrivate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F6FF),
      body: Column(
        children: [
          Center(
            child: Container(
              width: 350,height: 260,
                child: Image.asset('assets/images/subscribe.png')),
          ),
          Text("Upgrade to Premium",style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.w500,
              fontSize: 18,color: Color(0xff0C1553)),),
          Padding(padding: EdgeInsets.only(top: 15)),
          Text("Subscribe & Get Private update news",style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: Color(0xff3E4683)),),

          Padding(padding: EdgeInsets.only(top: 50)),
          EasyRichText(
            "5000 ks/month",
            patternList: [
              EasyRichTextPattern(
                targetString: '5000',
                  style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.w500,
                      fontSize: 14,color: Color(0xff0C1553))
              ),
              EasyRichTextPattern(
                targetString: 'ks/month',
                  style: TextStyle(fontFamily: 'Inter',fontSize: 12,color: Color(0xff3E4683))
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 10)),

          //subscribe
          Container(
            padding: EdgeInsets.fromLTRB(14,8,14,8),
            decoration: BoxDecoration(
              color: Color(0xff0C1553),
              borderRadius: BorderRadius.all(Radius.circular(6)),
              border: Border.all(
                  // color: Color(0xff0C1553),
                  width: 2
              ),
            ),
            child:  Text("Subscribe Now",style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.bold,fontSize: 16,color: Color(0xffFFD500)),),
          )
        ],
      ),
    );
  }
}
