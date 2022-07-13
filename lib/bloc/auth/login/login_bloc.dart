import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/repository/auth_repository.dart';
import '../../../data/sharedpref/preferences.dart';
import '../../../data/sharedpref/shared_preference_helper.dart';
import '../../../di/components/service_locator.dart';
import '../../../models/auth/login_data.dart';
import '../../../models/auth/profile_info.dart';
import 'login_event.dart';
import 'login_state.dart';

class LogInBloc extends Bloc<LogInEvent,LogInState>{
  AuthRepository authRepository;
  LogInBloc(this.authRepository) : super(LogInInitialized());

  @override
  Stream<LogInState> mapEventToState(
      LogInEvent event
      ) async*{
    if(event is LogInPressedButton){
      yield LogInLoading();
      try{
        LogInData logInData=await authRepository.login(event.phone, event.password);

        //save token
        var sharedPreference=getIt<SharedPreferenceHelper>();
        await sharedPreference.persistToken(logInData.data!.token.toString());

        //save profile
        ProfileInfo profileInfo=await authRepository.getProfileInfo();
        Preferences.profileInfo=profileInfo;

        yield LogInSuccess(logInData: logInData);
      }
      catch (e){
        yield LogInError(errorMessage: e.toString());
      }
    }
  }
}