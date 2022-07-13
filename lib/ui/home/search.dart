import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/local/constants/svgImages.dart';
import 'search_authors.dart';
import 'search_posts.dart';


class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin{
  TextEditingController _searchController = new TextEditingController();
  bool doSearch=false;
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
    _searchController.dispose();
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child:
        Container(
          color:  Color(0xffF2F6FF),
          padding: EdgeInsets.fromLTRB(10, 50, 10, 20),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: ()=>Navigator.pop(context),
                    child: Container(
                      width: 50,
                      height: 50,
                      child: SvgPicture.string(SvgImages.back_arrow,color: Color(0xff0C1553)),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _searchController,
                      minLines:1,
                      maxLines: 5,
                      decoration: InputDecoration(
                        // labelText: 'Enter',
                        // labelStyle: TextStyle(color: Colors.black),
                        hintText: ' Search',
                        hintStyle: TextStyle(color: Color(0xff0C1553),fontSize: 18,fontFamily: 'Inter'),
                        prefixIcon: Icon(Icons.search,color: Color(0xff0C1553)),
                        fillColor: Color(0xffD8DBE2),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onFieldSubmitted: (value){
                        print("HELLOOOOO $value");
                        if(value.length!=0){
                          setState(() {
                            doSearch=true;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  // indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Color(0xff0C1553),
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      color: Color(0xff0C1553),
                    ),
                  ),
                  controller: _tabController,
                  labelColor: Color(0xff0C1553),
                  tabs: [
                    Tab(child: Text('Posts', style: TextStyle(fontFamily: 'Inter',
                        fontWeight: tabIndex==0?FontWeight.w600:FontWeight.normal,
                        color:Color(0xff0C1553),fontSize: 18),),),
                    Tab(child: Text('Authors',style: TextStyle(fontFamily: 'Inter',
                        fontWeight: tabIndex==1?FontWeight.w600:FontWeight.normal,
                        color:Color(0xff0C1553),fontSize: 18),),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          SearchPosts(),
          SearchAuthors(),
        ],
      )
    );
  }
}
