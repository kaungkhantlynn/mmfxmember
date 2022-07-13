import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../../data/sharedpref/preferences.dart';
import '../../../data/sharedpref/shared_preference_helper.dart';
import '../../../di/components/service_locator.dart';
import 'checktoken_event.dart';
import 'checktoken_state.dart';

class CheckTokenBloc extends Bloc<CheckTokenEvent,CheckTokenState>{
  CheckTokenBloc(CheckTokenState initialState) : super(CheckTokenInitialize());

  @override
  Stream<CheckTokenState> mapEventToState(
      CheckTokenEvent event
      ) async*{
    if(event is CheckTokenStart){
      yield CheckTokenLoading();
      var sharedPreferenceHelper=getIt<SharedPreferenceHelper>();
      var token = await sharedPreferenceHelper.authToken;
      if(token==null || token==Preferences.logOutToken){
        yield CheckTokenLoaded(success: false);
      }
      else{
        yield CheckTokenLoaded(success: true);
      }
    }
  }
}