import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Subscription extends StatefulWidget {
  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F6FF),
      body: ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: 4,
          itemBuilder: (BuildContext context, int index){
            return
              GestureDetector(
                onTap: (){
                  // Navigator.pushNamed(context, '/author_profile');
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => AuthorProfile()),
                  // );
                },
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                        child: Column(
                          children: [
                            //icon, name, unfollow
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //icon
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

                                //name, follower
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Ko Htet",style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.w500,fontSize: 18,color: Color(0xff0C1553)),),
                                    Padding(padding: EdgeInsets.only(top: 10)),
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("342 followers",style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: Color(0xff535B88)),),
                                        Padding(padding: EdgeInsets.only(left: 20)),
                                        Text("345 posts",style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: Color(0xff535B88)),),
                                      ],
                                    )
                                  ],
                                ),

                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            //text
                            Container(
                              // padding: EdgeInsets.only(left: 90,top: 5),
                              child: Text("Mike Zaccardi is an adjunct finance instructor at the University of North Florida",
                                style: TextStyle(fontFamily: 'Inter',fontSize: 20,color: Color(0xff0C1553)),),
                            ),
                          ],
                        )
                    ),
                    Divider(thickness: 1,color: Colors.black45,)
                    // Divider(color: Color(0xff0C1553),),
                  ],
                ),
              );
          }
      ),
    );
  }
}
