import 'dart:async';

import '../../models/auth/login_data.dart';
import '../../models/auth/logout_data.dart';
import '../../models/auth/profile_info.dart';
import '../network/api/blog/auth_api.dart';
import '../sharedpref/shared_preference_helper.dart';


class AuthRepository {
  // api object
  final AuthApi _authApi;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  AuthRepository(this._authApi, this._sharedPrefsHelper);

  Future<LogInData> login(String phone, String password) async{
    return _authApi.login(phone: phone, password: password);
  }

  Future<LogOutData> logout() async{
    return _authApi.logout();
  }

  Future<ProfileInfo> getProfileInfo() async{
    return _authApi.getProfileInfo();
  }
}