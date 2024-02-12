import 'package:shared_preferences/shared_preferences.dart';

abstract class CashHelper {
  static SharedPreferences? sharedPreferences;

  static Future<SharedPreferences> init() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  //-------------------------------setter getter for cash --------------------------//
  static Future<bool> setCash(String key, dynamic value) async {
    if (value is bool) {
      return await sharedPreferences!.setBool(key, value);
    } else if (value is int) {
      return await sharedPreferences!.setInt(key, value);
    } else if (value is String) {
      return await sharedPreferences!.setString(key, value);
    } else if (value is double) {
      return await sharedPreferences!.setDouble(key, value);
    } else {
      return await sharedPreferences!.setStringList(key, [value.toString()]);
    }
  }

  static Object? getCash<T>(String key) {
    return sharedPreferences!.get(key);
  }
}
