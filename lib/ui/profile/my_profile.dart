import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/local/constants/svgImages.dart';
import '../../data/sharedpref/preferences.dart';
import 'following.dart';
import 'subscription.dart';


class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile>  with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int tabIndex=0;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleSelected);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleSelected() {
    setState(() {
      tabIndex=_tabController.index;
    });
  }

  openSetting(){
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context){
          return SingleChildScrollView(
            child:
            Container(
              padding: EdgeInsets.only(top: 40,left: 20),
              height: 230,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/edit_profile');
                    },
                    child: Row(
                      children: [
                        Icon(Icons.edit,color: Color(0xff0C1553),),
                        Text("  Edit Profile",style: TextStyle(fontFamily: 'Inter',fontSize: 14),)
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/change_password');
                    },
                    child: Row(
                      children: [
                        Icon(Icons.lock_open_outlined,color: Color(0xff0C1553)),
                        Text("  Change Password",style: TextStyle(fontFamily: 'Inter',fontSize: 14),)
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Row(
                    children: [
                      Icon(Icons.logout,color: Color(0xff0C1553)),
                      Text("  Log Out",style: TextStyle(fontFamily: 'Inter',fontSize: 14),)
                    ],
                  )
                ],
              ),
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F6FF),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(340.0),
          child: Column(
            children: [
              //Author AuthorProfile
              Container(
                color: Color(0xff0C1553),
                padding: EdgeInsets.fromLTRB(10, 50, 10, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("My Profile",style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.white,fontSize: 24,fontFamily: 'Inter'),),
                    GestureDetector(
                      onTap: (){
                        openSetting();
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        child: SvgPicture.string(SvgImages.setting,color: Colors.white,),
                      ),
                    ),
                  ],
                ),
              ),

              //AuthorProfile
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //icon, follower
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //icon
                        Container(
                          width: 80,
                          height: 80,
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
                            Text(Preferences.profileInfo.data!.name.toString(),style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.w500,fontSize: 18,color: Color(0xff0C1553)),),
                          ],
                        ),

                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),

                    //text
                    Container(
                      // padding: EdgeInsets.only(left: 90,top: 5),
                      child: Text(Preferences.profileInfo.data!.bio.toString(),
                        style: TextStyle(fontFamily: 'Inter',fontSize: 20,color: Color(0xff0C1553)),),
                    ),
                    Padding(padding: EdgeInsets.only(top: 15)),
                  ],
                ),
              ),
              Divider(thickness: 2,color: Colors.black45,),

              Padding(padding: EdgeInsets.only(top: 10)),
              Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Color(0xff0C1553),
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      color: Color(0xff0C1553),
                    ),
                  ),
                  controller: _tabController,
                  labelColor: Color(0xff0C1553),
                  tabs: [
                    Tab(child: Text('Following',style: TextStyle(fontFamily: 'Inter',
                        fontWeight: tabIndex==0?FontWeight.w600:FontWeight.normal,color:Color(0xff0C1553),fontSize: 18),),),
                    Tab(child: Text('Subscription',style: TextStyle(fontFamily: 'Inter',
                        fontWeight: tabIndex==1?FontWeight.w600:FontWeight.normal,color:Color(0xff0C1553),fontSize: 18),),),
                  ],
                ),
              ),

            ],
          ),
        ),
        body:TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            Following(),
            Subscription()
          ],

        )
    );
  }
}
