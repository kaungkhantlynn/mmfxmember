import 'package:flutter/material.dart';

import '../data/sharedpref/preferences.dart';
import '../data/sharedpref/shared_preference_helper.dart';
import '../di/components/service_locator.dart';
import 'login/login.dart';


class SplashScreen extends StatefulWidget {
  static String route = '/splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var sharedPreferenceHelper=getIt<SharedPreferenceHelper>();
  @override
  void initState() {
    // nextWidget();
    super.initState();
  }

  void nextWidget() async {
    await Future.delayed(const Duration(seconds: 1));

    var token = await sharedPreferenceHelper.authToken;
    print("HELLOOOO TOKEN $token");
    print(Preferences.logOutToken);
    if(token==null || token==Preferences.logOutToken){
      Navigator.pushReplacementNamed(context, LogIn.route);
      // yield CheckTokenLoaded(success: 'false');
    }
    else{
      Navigator.pushReplacementNamed(context, '/mmfx_author');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0C1553),
        body:
        Center(
          child: Container(
              width: 200,
              height: 200,
              child: Image.asset('assets/images/MMFXlogo.png')
          ),
        )
      // Container(
      //   decoration: BoxDecoration(
      //       image: DecorationImage(
      //           image: Image.asset('assets/images/profile.png').image,
      //           fit: BoxFit.cover
      //       ),
      //       shape: BoxShape.circle
      //   ),
      // ),),
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Padding(
      //       padding: EdgeInsets.symmetric(vertical: 5.5),
      //       child: Text(
      //         'Myanma Forex (MMFX)',
      //         style: TextStyle(
      //             fontFamily: 'Inter',
      //             fontSize: 20,
      //             fontWeight: FontWeight.w400),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
