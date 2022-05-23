
import 'package:fidigames/resources/strings_manager.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<void> saveAuthToken({String? authToken}) async {
  
    bool success = await setString(AppStrings.apiToken, authToken!);
    
  Logger().d(success?'Data Persisted':'Data Not Persisted');
  }

  static String? getLoginDetails() {
    String? apiToken =  getString(AppStrings.apiToken);
     Logger().d('TOKEN $apiToken');
    return apiToken;
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
