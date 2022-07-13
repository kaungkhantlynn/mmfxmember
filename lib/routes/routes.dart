import 'package:flutter/widgets.dart';

import '../ui/check_state.dart';
import '../ui/home/home.dart';
import '../ui/home/search.dart';
import '../ui/login/forgot_password.dart';
import '../ui/login/login.dart';
import '../ui/mmfx_main.dart';
import '../ui/notification/notification.dart';
import '../ui/profile/change_password.dart';
import '../ui/profile/edit_profile.dart';
import '../ui/registration/create_password.dart';
import '../ui/registration/follow_author.dart';
import '../ui/registration/register.dart';
import '../ui/registration/terms_and_conditions.dart';
import '../ui/registration/verification.dart';
import '../ui/registration/welcome.dart';
import '../ui/splash_screen.dart';


class Routes {
  Routes._();

  //static variables
  static const String check_state = '/check_state';
  static const String splash = '/splash_screen';
  static const String register = '/register';
  static const String termsAndConditions = '/terms_and_conditions';
  static const String verification = '/verification';
  static const String createPassword = '/create_password';
  static const String welcome = '/welcome';
  static const String followAuthor = '/follow_author';
  static const String home = '/home';
  static const String mmfx_main='/mmfx_main';
  static const String notification='/notification';
  static const String search='/search';
  static const String edit_profile='/edit_profile';
  static const String change_password='/change_password';
  static const String login='/login';
  static const String forgot_password='/forgot_password';

  //author site
  static const String mmfx_author='/mmfx_author';
  static const String author_notification='/author_notification';

  //profile
  static const String author_edit_profile='/author_edit_profile';
  static const String author_change_password='/author_change_password';
  static const String subscribtion_setting='/subscribtion_setting';
  static const String password_success='/password_success';

  //post
  static const String new_post='/new_post';
  static const String post_success='/post_success';

  static const String test='/test';

  static final routes = <String, WidgetBuilder>{
    check_state: (BuildContext context) => CheckState(),
    splash: (BuildContext context) => SplashScreen(),
    register: (BuildContext context) => Register(),
    termsAndConditions: (BuildContext context) => TermsAndConditions(),
    verification: (BuildContext context) => Verification(),
    createPassword: (BuildContext context) => CreatePassword(),
    welcome: (BuildContext context) => Welcome(),
    followAuthor: (BuildContext context) => FollowAuthor(),
    home: (BuildContext context) => Home(),
    mmfx_main: (BuildContext context) => MMfxMain(),
    notification: (BuildContext context) => NotificationPage(),
    search: (BuildContext context) => Search(),
    edit_profile: (BuildContext context) => EditProfile(),
    change_password: (BuildContext context) => ChangePassword(),
    login: (BuildContext context) => LogIn(),
    forgot_password: (BuildContext context) => ForgotPassword(),

    // mmfx_author: (BuildContext context) => MMfxAuthor(),
    // author_notification: (BuildContext context) => AuthorNotification(),
    // author_edit_profile: (BuildContext context) => AuthorEditProfile(),
    // author_change_password: (BuildContext context) => AuthorChangePassword(),
    // password_success: (BuildContext context) => PasswordSuccess(),
    // subscribtion_setting: (BuildContext context) => SubscribtionSetting(),
    // new_post: (BuildContext context) => NewPost(),
    // post_success: (BuildContext context) => PostSuccess(),
    //
    // test: (BuildContext context) => HtmlEditorExampleApp(),
  };
}
