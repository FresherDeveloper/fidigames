import 'dart:developer';

import 'package:fidigames/resources/strings_manager.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<void> saveAuthToken({String? authToken}) async {
  //  final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool sucess = await setString(AppStrings.apiToken, authToken!);
    
  Logger().d(sucess?'Data Persisted':'Data Not Persisted');
  }

  static String? getLoginDetails() {
    String? api_token =  getString(AppStrings.apiToken);
     Logger().d('TOKEN $api_token');
    return api_token;
  }

  static Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static String? getString(String key, [String? defValue]) {
    return _prefsInstance?.getString(key) ?? defValue;
  }

  static void clear(){
     _prefsInstance!.clear();
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }



  
}
