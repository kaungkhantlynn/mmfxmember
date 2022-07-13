import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

import '../../bloc/author/author_follow/authorfollow_bloc.dart';
import '../../bloc/author/author_follow/authorfollow_event.dart';
import '../../bloc/author/author_follow/authorfollow_state.dart';
import '../../bloc/author/author_follow_list/authofollowlist_event.dart';
import '../../bloc/author/author_follow_list/authorfollowlist_bloc.dart';
import '../../bloc/author/author_follow_list/authorfollowlist_state.dart';
import '../../data/repository/author_repository.dart';
import '../../di/components/service_locator.dart';


class SearchAuthors extends StatefulWidget {
  @override
  _SearchAuthorsState createState() => _SearchAuthorsState();
}

class _SearchAuthorsState extends State<SearchAuthors> {
  AuthorFollowBloc _authorFollowBloc = AuthorFollowBloc(getIt<AuthorRepository>());
  FollowedAuthorListBloc _followedAuthorListBloc = FollowedAuthorListBloc(getIt<AuthorRepository>());

  @override
  void initState(){
    _followedAuthorListBloc.add(FetchFollowedAuthorList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F6FF),
      body:
          BlocListener<AuthorFollowBloc,AuthorFollowState>(
            bloc: _authorFollowBloc,
            listener: (context,state)async{
              if(state is AuthorFollowLoading){
                print("FJDSFJSKFJSFJ this is loading123");
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
                print("FJDSFJSKFJSFJ this is loading123 error");
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Fail. There is something wrong.'),
                    )); // _marketPriceListBloc.add(MarketPriceListStart());
              }
              else if(state is AuthorFollowSuccess){
                print("FJDSFJSKFJSFJ this is loading123 success");
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.authorFollowModel.message.toString())),
                );// _marketPriceListBloc.add(MarketPriceListStart());
              }
            },
            child: BlocBuilder<FollowedAuthorListBloc,FollowedAuthorListState>(
              bloc: _followedAuthorListBloc,
              builder: (context,state){
                if(state is FollowedAuthorListLoading){
                  print("FJDSFJSKFJSFJ this is loading");
                  return SpinKitFadingFour(color: Color(0xff0C1553),);
                }
                else if(state is FollowedAuthorListError){
                  return Container(
                      padding: EdgeInsets.only(top: 20,bottom: 20),
                      child: Center(child: Text("There is something wrong.",style: TextStyle(color: Colors.red,fontSize: 15),)));
                }
                else if(state is FollowedAuthorListSuccess){
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: state.followedAuthorList.data!.length,
                      itemBuilder: (BuildContext context, int index){
                        return
                          GestureDetector(
                            onTap: (){
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
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                                            //name, follower
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(state.followedAuthorList.data![index].name.toString(),style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.w500,fontSize: 18,color: Color(0xff575757)),),
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

                                            //unfollow
                                            GestureDetector(
                                              onTap: (){
                                                _authorFollowBloc.add(FollowAuthor(id: state.followedAuthorList.data![index].id.toString()));
                                              },
                                              child: Container(
                                                padding: EdgeInsets.fromLTRB(12,6,12,6),
                                                decoration: BoxDecoration(
                                                  // color: Colors.white,
                                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                                  border: Border.all(
                                                      color: Color(0xff0C1553),
                                                      width: 2
                                                  ),
                                                ),
                                                child:  Text("Unfollow",style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: Color(0xff0C1553)),),
                                              ),
                                            )

                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.only(top: 10)),
                                        //text
                                        Container(
                                          // padding: EdgeInsets.only(left: 90,top: 5),
                                          child: Text(state.followedAuthorList.data![index].bio.toString(),
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
                  ) ;
                }
                return SpinKitFadingFour(color: Color(0xff0C1553),);
              },
            ),
          )
    );
  }
}
