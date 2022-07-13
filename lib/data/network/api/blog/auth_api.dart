import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../models/auth/login_data.dart';
import '../../../../models/auth/logout_data.dart';
import '../../../../models/auth/profile_info.dart';
import '../../dio_client.dart';
import '../../endpoints.dart';

class AuthApi {
  // dio instance
  final DioClient _dioClient;
  AuthApi(this._dioClient);

  Future<LogInData> login({
  @required String? phone, @required String? password}) async{
    var formData = FormData.fromMap({
      "phone":phone,
      "password":password
    });
    final res = await _dioClient.post(Endpoints.login, data: formData);
    return LogInData.fromJson(res);
  }

  Future<LogOutData > logout() async{
    final res = await _dioClient.post(Endpoints.logout);
    return LogOutData.fromJson(res);
  }

  Future<ProfileInfo > getProfileInfo() async{
    final res = await _dioClient.get(Endpoints.profile);
    return ProfileInfo.fromJson(res);
  }
}
