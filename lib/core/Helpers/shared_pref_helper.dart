import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  // private constructor as i don't to allow creating an instance from this class interface
  SharedPrefHelper._();

  /// rermove a value from shared Prefrence with given [key]
  static removeData(String key) async {
    debugPrint('SharedPrefHelper : data with key : $key has been removed');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(key);
  }

  /// rermove all keys and values from shared Prefrence
  static clearAllData(String key) async {
    debugPrint('SharedPrefHelper : all data has been cleared');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  /// save a [value] with a [key] in shared prefrence
  static setData(String key, dynamic value) async {
    debugPrint('SharedPrefHelper : set this data: $value with this key: $key');
    SharedPreferences sharedPrefHelper = await SharedPreferences.getInstance();
    switch (value.runtimeType) {
      case String:
        await sharedPrefHelper.setString(key, value);
      case int:
        await sharedPrefHelper.setInt(key, value);
      case bool:
        await sharedPrefHelper.setBool(key, value);
      case double:
        await sharedPrefHelper.setDouble(key, value);
        break;
      default:
        return null;
    }
  }

  static getString(String key) async {
    debugPrint('SharedPrefHelper : get data with this key: $key');
    SharedPreferences sharedPrefHelper = await SharedPreferences.getInstance();
    return sharedPrefHelper.getString(key) ?? "";
  }
  static getInt(String key) async {
    debugPrint('SharedPrefHelper : get data with this key: $key');
    SharedPreferences sharedPrefHelper = await SharedPreferences.getInstance();
    return sharedPrefHelper.getInt(key);
  }
}
