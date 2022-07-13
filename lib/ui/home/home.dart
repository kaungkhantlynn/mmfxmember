import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../bloc/author/author_list/authorlist_bloc.dart';
import '../../bloc/author/author_list/authorlist_event.dart';
import '../../bloc/author/public_posts/publicposts_bloc.dart';
import '../../bloc/author/public_posts/publicposts_event.dart';
import '../../bloc/author/public_posts/publicposts_state.dart';
import '../../data/local/constants/svgImages.dart';
import '../../data/repository/author_repository.dart';
import '../../di/components/service_locator.dart';
import '../author/authors_to_follow.dart';
import '../post/post_comment.dart';
import '../post/post_detail.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthorListBloc _authorListBloc = AuthorListBloc(getIt<AuthorRepository>());
  PublicPostsBloc _publicPostsBloc = PublicPostsBloc(getIt<AuthorRepository>());
  @override
  void initState(){
    _authorListBloc.add(FetchAuthorList());
    _publicPostsBloc.add(FetchPublicPosts());
    super.initState();
  }

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
                Text("Home",style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.white,fontSize: 24,fontFamily: 'Inter'),),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/notification');
                  },
                  child: Stack(
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
                ),
              ],
            )
        ),
      body: SingleChildScrollView(
        // padding: EdgeInsets.all(20),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // scrollDirection: Axis.vertical,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Text("Authors to follow",style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.bold,
                    fontSize: 18,color: Color(0xff0C1553)),),
              ),
              AuthorsToFollow(),

              Divider(thickness: 3,color: Color(0xff0C1553),),

              //Recent and Search
              Container(
                padding: EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recents",style: TextStyle(fontFamily: 'Poppin', fontSize: 16,color: Color(0xff0C1553))),
                    IconButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/search');
                      },
                      icon: Icon(Icons.search,color: Color(0xff0C1553),)
                    ),
                  ],
                ),
              ),

              BlocBuilder<PublicPostsBloc,PublicPostsState>(
                  bloc: _publicPostsBloc,
                  builder: (context,state){
                    if(state is PublicPostsLoading){
                      return SpinKitFadingFour(color: Color(0xff0C1553),);
                    }
                    else if(state is PublicPostsError){
                      return Container(
                          padding: EdgeInsets.only(top: 20,bottom: 20),
                          child: Center(child: Text("There is something wrong.",style: TextStyle(color: Colors.red,fontSize: 15),)));
                    }
                    else if(state is PublicPostsSuccess){
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: state.publicPostsModel.data!.length,
                          itemBuilder: (BuildContext context, int index){
                            return
                              Column(
                                children: [
                                  Container(
                                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                                      child: Column(
                                        children: [
                                          //image, text, bookmark
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
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
                                                      Text(state.publicPostsModel.data![index].title.toString(),
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
                                                Text(DateFormat('h:mm a, MMM dd').format(DateTime.parse(state.publicPostsModel.data![index].createdAt.toString())),style: TextStyle(fontFamily: 'Inter',
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
                      );
                    }
                    return Center(
                        child: SpinKitFadingFour(color: Color(0xff0C1553),)
                    );
                  }),

            ],
          ),
        ),
      ),
    );
  }
}
