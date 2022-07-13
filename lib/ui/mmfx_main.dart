import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../data/local/constants/svgImages.dart';
import 'announcement/announcement.dart';
import 'bookmarks/book_marks.dart';
import 'home/home.dart';
import 'profile/my_profile.dart';


class MMfxMain extends StatefulWidget {
  @override
  _MMfxMainState createState() => _MMfxMainState();
}

class _MMfxMainState extends State<MMfxMain> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  int index=0;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this, initialIndex:0);
    _tabController.addListener(_handleSelected);
    // getLocation();
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleSelected() {
    setState(() {
      index=_tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:
        Container(
          padding: EdgeInsets.only(top: 15,bottom: 15),
          decoration: BoxDecoration(
              color: Color(0xff0C1553),
              // border: Border(
              //   top: BorderSide( color: Color(0xff989898)),
              // ),
              boxShadow: [
                BoxShadow(
                    color: Color(0xff989898),
                    // spreadRadius: ,
                    blurRadius: 3,
                    // offset: Offset(0, 3),
                    offset: Offset(0.0, 0.75)
                ),
              ]
          ),
          child: TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            labelColor: Color(0xff334A52),
            unselectedLabelColor: Color(0xff989898),
            tabs: [
              // SvgPicture.string(SvgImages.ledger,width: 35,height: 35,)
              Tab(
                child:Icon(Icons.home,size: index == 0?40:30,color: index == 0? Color(0xffFFD500):Colors.white,),
              ),
              Tab(
                  child: SvgPicture.string(SvgImages.bookmarks,color: index == 1? Color(0xffFFD500):Colors.white,
                    width: index==1?40:30,height: index==1?40:30,),
              ),
              Tab(
                child: SvgPicture.string(SvgImages.horn,color: index == 2? Color(0xffFFD500):Colors.white,
                  width: index==2?35:25,height: index==2?35:25,),
              ),
              Tab(
                child:Icon(Icons.person,size: index == 3?40:30,color: index == 3?  Color(0xffFFD500):Colors.white,),
              ),
              // Tab(icon: Icon(Icons.person)),
            ],
          ),
        ),
        body:TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            Home(),
            BookMarks(),
            Announcement(),
            MyProfile(),
          ],

        )
    );
  }
}
