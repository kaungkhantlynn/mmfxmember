import 'package:bloc/bloc.dart';

import '../../../data/repository/profile_repository.dart';
import '../../../data/sharedpref/preferences.dart';
import '../../../models/auth/profile_info.dart';
import 'updateprofile_event.dart';
import 'updateprofile_state.dart';


class UpdateProfileBloc extends Bloc<UpdateProfileEvent,UpdateProfileState>{
  ProfileRepository profileRepository;
  UpdateProfileBloc(this.profileRepository) : super(UpdateProfileInitialized());

  @override
  Stream<UpdateProfileState> mapEventToState(
      UpdateProfileEvent event
      ) async*{
    if(event is UpdateProfilePressedButton){
      yield UpdateProfileLoading();
      try{
        ProfileInfo profileInfo=await profileRepository.update(event.name, event.bio, event.photo);
        //save profile
        Preferences.profileInfo=profileInfo;

        yield UpdateProfileSuccess(profileInfo: profileInfo);
      }
      catch (e){
        print("ERROR is ${e.toString()}");
        yield UpdateProfileError(errorMessage: e.toString());
      }
    }
  }
}
