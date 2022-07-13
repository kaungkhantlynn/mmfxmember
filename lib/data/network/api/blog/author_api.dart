import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../models/author/author_follow_model.dart';
import '../../../../models/author/author_list_model.dart';
import '../../../../models/author/followed_author_list.dart';
import '../../../../models/author/public_posts_model.dart';
import '../../dio_client.dart';
import '../../endpoints.dart';

class AuthorApi {
  // dio instance
  final DioClient _dioClient;
  AuthorApi(this._dioClient);

  Future<AuthorListModel> getAuthorList() async{
    final res = await _dioClient.get(Endpoints.authorList);
    return AuthorListModel.fromJson(res);
  }

  Future<AuthorFollowModel> followAuthor(String authorId) async{
    var formData = FormData.fromMap({
      "author_id":authorId,
    });
    final res = await _dioClient.post(Endpoints.authorfollow,data: formData);
    return AuthorFollowModel.fromJson(res);
  }

  Future<PublicPostsModel> getPublicPosts() async{
    final res = await _dioClient.get(Endpoints.publicPosts);
    return PublicPostsModel.fromJson(res);
  }

  Future<FollowedAuthorList> getFollowedAuthorList() async{
    final res = await _dioClient.get(Endpoints.followedAuthorList);
    return FollowedAuthorList.fromJson(res);
  }
}
