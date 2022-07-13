import 'dart:async';
import 'dart:io';

import '../../models/auth/profile_info.dart';
import '../network/api/blog/profile_api.dart';

class ProfileRepository {
  // api object
  final ProfileApi _profileApi;


  // constructor
  ProfileRepository(this._profileApi);

  Future<ProfileInfo> getProfileInfo() async{
    return _profileApi.getProfileInfo();
  }

  Future<ProfileInfo> update(String name, String bio, File photo) async{
    return _profileApi.update(name: name, bio: bio, photo: photo);
  }

}