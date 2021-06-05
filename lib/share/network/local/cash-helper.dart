import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences? _pref;
  static init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static dynamic getData(String key) {
    return _pref?.get(key);
  }

  static Future<bool> saveData(String key, dynamic value) async {
    if (value is bool)
      return await _pref!.setBool(key, value);
    else if (value is String)
      return await _pref!.setString(key, value);
    else if (value is int)
      return await _pref!.setInt(key, value);
    else
      return await _pref!.setDouble(key, value);
  }

  static Future<bool>removeData(String key)async{
    return await _pref!.remove(key);
  }
}
