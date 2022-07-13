import 'dart:async';

import '../../models/author/author_follow_model.dart';
import '../../models/author/author_list_model.dart';
import '../../models/author/followed_author_list.dart';
import '../../models/author/public_posts_model.dart';
import '../network/api/blog/author_api.dart';

class AuthorRepository {
  // api object
  final AuthorApi _authorApi;

  // shared pref object
  // final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  AuthorRepository(this._authorApi);

  Future<AuthorListModel> getAuthorList() async{
    return _authorApi.getAuthorList();
  }

  Future<AuthorFollowModel> followAuthor(String authorId) async{
    return _authorApi.followAuthor(authorId);
  }

  Future<PublicPostsModel> getPublicPosts() async{
    return _authorApi.getPublicPosts();
  }

  Future<FollowedAuthorList> getFollowedAuthorList() async{
    return _authorApi.getFollowedAuthorList();
  }
}