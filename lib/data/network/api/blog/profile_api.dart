import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../../models/auth/profile_info.dart';
import '../../dio_client.dart';
import 'dart:io';

import '../../endpoints.dart';

class ProfileApi {
  // dio instance
  // final Dio _dio = new Dio();
  final DioClient _dioClient;
  ProfileApi(this._dioClient);

  Future<ProfileInfo > getProfileInfo() async{
    print("THIS IS");
    final res = await _dioClient.get(Endpoints.profile);
    print("THIS IS");
    print(res.toString());
    return ProfileInfo.fromJson(res);
  }

  Future<ProfileInfo> update({
    @required String? name, @required String? bio, @required File? photo}) async{
    String nameString=photo!.path.split('/').last;
    print("NAME STRING $nameString");
    print(photo.path);

    var formData = FormData.fromMap({
      "name":name,
      "bio":bio,
      "photo":await MultipartFile.fromFile(photo.path,filename: nameString,),
    });
    final res = await _dioClient.post(Endpoints.updateProfile, data: formData);
    return ProfileInfo.fromJson(res);
  }

}
