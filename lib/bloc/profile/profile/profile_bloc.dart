import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../../data/repository/profile_repository.dart';
import '../../../data/sharedpref/preferences.dart';
import '../../../models/auth/profile_info.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent,ProfileState>{
  ProfileRepository profileRepository;
  ProfileBloc(this.profileRepository) : super(ProfileInitialized());

  @override
  Stream<ProfileState> mapEventToState(
      ProfileEvent event
      ) async*{
    if(event is FetchProfile){
      print("HELLO FetchProfile");
      yield ProfileLoading();
      try{
        // print("HELLO getProfileInfo123");
        // Dio dio=new Dio();
        // var sharedPreferenceHelper=getIt<SharedPreferenceHelper>();
        // var token = await sharedPreferenceHelper.authToken;
        // print("Token $token");
        // dio.options.headers.putIfAbsent('Authorization', () => "Bearer " + token.toString());
        // // dio.options.headers["authorization"] = "token ${token}";
        // Response res=await dio.get('https://radiant-inlet-82222.herokuapp.com/api/v1/author/profile',
        // // options: Options(
        // //   headers: {
        // //     "Authorization": "Bearer $token"
        // //   }
        // // )
        // );
        // print("HELLOOO ${res.data}");
        //
        ProfileInfo profileInfo=await profileRepository.getProfileInfo();
        print("HELLO getProfileInfo");

        //save profile
        Preferences.profileInfo=profileInfo;

        yield ProfileSuccess(profileInfo: profileInfo);
      }
      catch (e){
        yield ProfileError(errorMessage: e.toString());
      }
    }
  }
}