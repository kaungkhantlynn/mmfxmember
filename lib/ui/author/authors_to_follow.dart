import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../bloc/author/author_list/authorlist_bloc.dart';
import '../../bloc/author/author_list/authorlist_event.dart';
import '../../bloc/author/author_list/authorlist_state.dart';
import '../../bloc/author/public_posts/publicposts_bloc.dart';
import '../../bloc/author/public_posts/publicposts_event.dart';
import '../../data/repository/author_repository.dart';
import '../../di/components/service_locator.dart';
import 'author_profile.dart';

class AuthorsToFollow extends StatefulWidget {
  @override
  _AuthorsToFollowState createState() => _AuthorsToFollowState();
}

class _AuthorsToFollowState extends State<AuthorsToFollow> {
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
    return  BlocBuilder<AuthorListBloc,AuthorListState>(
        bloc: _authorListBloc,
        builder: (context,state){
          if(state is AuthorListLoading){
            return SpinKitFadingFour(color: Color(0xff0C1553),);
          }
          else if(state is AuthorListError){
            return Container(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                child: Center(child: Text("There is something wrong.",style: TextStyle(color: Colors.red,fontSize: 15),)));
          }
          else if(state is AuthorListSuccess){
            return
              Container(
                // padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                height: 75.0,
                child: ListView.builder(
                  // padding: const EdgeInsets.only(left: 5, top: 0, bottom: 30, right: 5),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: state.authorListModel.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return
                        GestureDetector(
                          onTap: ()=>Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AuthorProfile(id: state.authorListModel.data![index].id.toString(),
                                  name: state.authorListModel.data![index].name.toString(),
                                  phone: state.authorListModel.data![index].phone.toString(),
                                  bio: state.authorListModel.data![index].bio.toString(),)),
                          ),
                          child: Container(
                            margin: EdgeInsets.only(right: 20),
                            width: 75,
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
                        );
                    }),
              );
          }
          return Center(
              child: SpinKitFadingFour(color: Color(0xff0C1553),)
          );
        }
    );
  }
}
