import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth/check_token/checktoken_bloc.dart';
import '../bloc/auth/check_token/checktoken_event.dart';
import '../bloc/auth/check_token/checktoken_state.dart';
import '../bloc/profile/profile/profile_bloc.dart';
import '../bloc/profile/profile/profile_event.dart';
import '../bloc/profile/profile/profile_state.dart';
import '../data/repository/profile_repository.dart';
import '../di/components/service_locator.dart';
import 'login/login.dart';
import 'mmfx_main.dart';
import 'splash_screen.dart';


class CheckState extends StatefulWidget {
  @override
  _CheckStateState createState() => _CheckStateState();
}

class _CheckStateState extends State<CheckState> {
  final CheckTokenBloc _checkTokenBloc = CheckTokenBloc(CheckTokenInitialize());
  final ProfileBloc _profileBloc = ProfileBloc(getIt<ProfileRepository>());

  @override
  void initState(){
    _checkTokenBloc.add(CheckTokenStart());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=>CheckTokenBloc(CheckTokenInitialize())..add(CheckTokenStart())),
          BlocProvider(create: (_)=>ProfileBloc(getIt<ProfileRepository>())..add(FetchProfile())),
        ],
        child: BlocBuilder<CheckTokenBloc,CheckTokenState>(
          bloc: _checkTokenBloc,
          builder: (context,state){
            if(state is CheckTokenLoading){
              return SplashScreen();
            }
            else if(state is CheckTokenLoaded){
              if(state.success==false){
                return LogIn();
              }
              else{
                _profileBloc.add(FetchProfile());
                return
                  BlocBuilder<ProfileBloc,ProfileState>(
                    bloc: _profileBloc,
                    builder: (context,state){
                      if(state is ProfileLoading){
                        return SplashScreen();
                      }
                      //DO SOMETHING
                      else if(state is ProfileError){
                        return LogIn();
                        // return Text("There is something wrong");
                      }
                      else if(state is ProfileSuccess){
                        return MMfxMain();
                      }
                      return SplashScreen();
                    },
                  );
              }

            }
            return SplashScreen();
          },
        )
    );
  }
}
