import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

import '../../bloc/author/author_follow/authorfollow_bloc.dart';
import '../../bloc/author/author_follow/authorfollow_event.dart';
import '../../bloc/author/author_follow/authorfollow_state.dart';
import '../../data/local/constants/svgImages.dart';
import '../../data/repository/author_repository.dart';
import '../../di/components/service_locator.dart';
import 'author_announcements.dart';
import 'author_private.dart';
import 'author_pubic.dart';

class AuthorProfile extends StatefulWidget {
  String id;
  String name;
  String phone;
  String bio;
  AuthorProfile({required this.id, required this.name, required this.phone,required this.bio});

  @override
  _AuthorProfileState createState() => _AuthorProfileState();
}

class _AuthorProfileState extends State<AuthorProfile> with SingleTickerProviderStateMixin{
  AuthorFollowBloc _authorFollowBloc=AuthorFollowBloc(getIt<AuthorRepository>());
  late TabController _tabController;
  int tabIndex=0;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this, initialIndex: 0);
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

  @override
  Widget build(BuildContext context) {
    return
      BlocProvider<AuthorFollowBloc>(
          create:(_)=>AuthorFollowBloc(getIt<AuthorRepository>()),
          child: BlocListener<AuthorFollowBloc,AuthorFollowState>(
            bloc: _authorFollowBloc,
            listener: (context,state) async{
              if(state is AuthorFollowLoading){
                showDialog(
                    barrierDismissible: false,
                    barrierColor: Color(0x00ffffff),
                    context: context,
                    builder: (BuildContext context){
                      return
                        Material(
                          type: MaterialType.transparency,
                          child: Center(
                              child: SpinKitFadingFour(color: Color(0xff0C1553),)
                          ),
                        );
                    }
                );
              }
              else if(state is AuthorFollowError){
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Fail. There is something wrong.'),
                )); // _marketPriceListBloc.add(MarketPriceListStart());
              }
              else if(state is AuthorFollowSuccess){
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(content: Text(state.authorFollowModel.message.toString())),
                );
              }
            },
            child: Scaffold(
                backgroundColor: Color(0xffF2F6FF),
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(360.0),
                  child: Column(
                    children: [
                      //Author AuthorProfile
                      Container(
                        color: Color(0xff0C1553),
                        padding: EdgeInsets.fromLTRB(10, 50, 10, 20),
                        child: Row(
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
                            Text("  Author's Profile",style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.white,fontSize: 24,fontFamily: 'Inter'),),
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
                                    Text(widget.name,style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.w500,fontSize: 18,color: Color(0xff0C1553)),),
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

                            //text
                            Container(
                              // padding: EdgeInsets.only(left: 90,top: 5),
                              child: Text(widget.bio,
                                style: TextStyle(fontFamily: 'Inter',fontSize: 20,color: Color(0xff0C1553)),),
                            ),
                            Padding(padding: EdgeInsets.only(top: 15)),

                            //follow
                            GestureDetector(
                              onTap: (){
                                _authorFollowBloc.add(FollowAuthor(id: widget.id));
                              },
                              child: Container(
                                padding: EdgeInsets.fromLTRB(12,6,12,6),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                  border: Border.all(
                                      color: Color(0xff0C1553),
                                      width: 2
                                  ),
                                ),
                                child:  Text("Follow",style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: Color(0xff0C1553)),),
                              ),
                            )
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
                            Tab(child: Text('Public',style: TextStyle(fontFamily: 'Inter',
                                fontWeight: tabIndex==0?FontWeight.w600:FontWeight.normal,color:Color(0xff0C1553),fontSize: 18),),),
                            Tab(child: Text('Private',style: TextStyle(fontFamily: 'Inter',
                                fontWeight: tabIndex==1?FontWeight.w600:FontWeight.normal,color:Color(0xff0C1553),fontSize: 18),),),
                            Tab(child: Text('Announcements',style: TextStyle(fontFamily: 'Inter',
                                fontWeight: tabIndex==2?FontWeight.w600:FontWeight.normal,color:Color(0xff0C1553),fontSize: 18),),),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                body:
                TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    AuthorPublic(),
                    AuthorPrivate(),
                    AuthorAnnouncements()],

                )
            ),
          ),
    );
  }
}
