import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'preferences.dart';

class SharedPreferenceHelper {
  // shared pref instance
  final SharedPreferences _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  // First Time: ---------------------------------------------------------------
  Future<String?> get getFirstTimeUse async {
    return _sharedPreference.getString(Preferences.firstTimeAppUse);
  }

  Future<void> doFirstTime() async {
    /// write to keystore/keychain
    // await  StorageService.setString(key: AppSetting.firstTimeAppUse, value: AppSetting.doneFirstTime);
    await _sharedPreference.setString(
        Preferences.firstTimeAppUse, Preferences.doneFirstTime);
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await _sharedPreference.setString(Preferences.userAlreadyLogin, token);
    return;
  }

  // General Methods: ----------------------------------------------------------
  Future<String?> get authToken async {
    return _sharedPreference.getString(Preferences.userAlreadyLogin);
  }

  Future<bool> saveAuthToken(String authToken) async {
    return _sharedPreference.setString(Preferences.auth_token, authToken);
  }

  String? get loggedinToken {
    return _sharedPreference.getString(Preferences.userAlreadyLogin);
  }

  // Future<void> expireToken() async {
  //   await _sharedPreference.setString(
  //       Preferences.userAlreadyLogin, Preferences.logoutString);
  // }

  // Future<void> deleteToken() async {
  //   // String accessToken = StorageUtil.getString(AppSetting.userAlreadyLogin);
  //   // await _apiService.postUserLogout(accessToken);
  //   _sharedPreference.setString(
  //       Preferences.userAlreadyLogin, Preferences.logoutString);
  //
  //   _sharedPreference.setString("refresh_token", "");
  //
  //   return;
  // }

  // Login:---------------------------------------------------------------------
  Future<bool> get isLoggedIn async {
    return _sharedPreference.getBool(Preferences.is_logged_in) ?? false;
  }

  Future<bool> saveIsLoggedIn(bool value) async {
    return _sharedPreference.setBool(Preferences.is_logged_in, value);
  }

  // Remember Me: -------------------------------------------------------------
  // Future<void> saveRememberMe(LoginData loginData) async {
  //   _sharedPreference.setBool(Preferences.keyRememberMe, loginData.rememberMe);
  //   if (loginData.rememberMe) {
  //     print('REMEMBER TRUE');
  //     _sharedPreference.setString(Preferences.keyUsername, loginData.username);
  //     _sharedPreference.setString(Preferences.keyPassword, loginData.password);
  //     _sharedPreference.setBool(Preferences.keyRememberMe, false);
  //   } else {
  //     print('REMEMBER FALSE');
  //     _sharedPreference.setString(Preferences.keyUsername, '');
  //     _sharedPreference.setString(Preferences.keyPassword, '');
  //     _sharedPreference.setBool(Preferences.keyRememberMe, false);
  //   }
  //   return;
  // }

  bool getRememberMe() {
    return _sharedPreference.getBool(Preferences.keyRememberMe) ?? false;
  }

  // String get getUsername {
  //   return _sharedPreference.getString(Preferences.keyUsername) ?? " ";
  // }

  String getUsername() {
    return _sharedPreference.getString(Preferences.keyUsername) ?? "";
  }

  String getPassword() {
    return _sharedPreference.getString(Preferences.keyPassword) ?? "";
  }

  // Theme:------------------------------------------------------
  bool get isDarkMode {
    return _sharedPreference.getBool(Preferences.is_dark_mode) ?? false;
  }

  Future<void> changeBrightnessToDark(bool value) {
    return _sharedPreference.setBool(Preferences.is_dark_mode, value);
  }

  // Language:---------------------------------------------------
  String? get currentLanguage {
    return _sharedPreference.getString(Preferences.current_language);
  }

  Future<void> changeLanguage(String language) {
    return _sharedPreference.setString(Preferences.current_language, language);
  }
}
