import '../../models/auth/profile_info.dart';

class Preferences {
  Preferences._();

  static const String is_logged_in = "isLoggedIn";
  static const String auth_token = "authToken";
  static String logOutToken="logoutToken";


  static const String is_dark_mode = "is_dark_mode";
  static const String current_language = "current_language";

  static String firstTimeAppUse = "first_time";
  static String userAlreadyLogin = "access_token";
  static String doneFirstTime = "VbwWDwTGwYu";
  // static String logoutString = "KLzmyrioVjra";
  static const String keyRememberMe = 'remember_me';
  static const String keyUsername = 'username';
  static const String keyPassword = 'password';
  static String authKey = "";

  static ProfileInfo profileInfo=ProfileInfo();

}
