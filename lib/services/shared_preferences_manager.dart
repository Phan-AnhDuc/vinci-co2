// ignore_for_file: slash_for_doc_comments

import 'package:MoveGreen/constant/app_keys.dart';
import 'package:MoveGreen/shared/shared_preferences_utils.dart';

class SharedPrefManager {
  SharedPrefManager._();

  /** 
    * Get key token
    * Response: String
  */
  static Future<String?>? getKeyToken() async {
    final result = await SharedPrefUtils.getString(key: KEY_TOKEN);
    return result;
  }

  /** 
    * Set key token
    * Params: value
    * Response: bool
  */
  static Future<bool?>? setKeyToken({required String token}) async {
    final result = await SharedPrefUtils.saveString(key: KEY_TOKEN, value: token);
    return result;
  }

  /** 
    * Get key token
    * Response: String
  */
  static Future<String?>? getKeyRefreshToken() async {
    final result = await SharedPrefUtils.getString(key: KEY_REFRESH_TOKEN);
    return result;
  }

  /** 
    * Set key token
    * Params: value
    * Response: bool
  */
  static Future<bool?>? setKeyRefreshToken({required String refreshToken}) async {
    final result = await SharedPrefUtils.saveString(key: KEY_REFRESH_TOKEN, value: refreshToken);
    return result;
  }

  /** 
    * Remove key  token
  */
  static Future<void> removeKeyToken() async {
    await SharedPrefUtils.removeData(key: KEY_TOKEN);
  }

  /** 
    * Remove key refresh token
  */
  static Future<void> removeKeyRefreshToken() async {
    await SharedPrefUtils.removeData(key: KEY_REFRESH_TOKEN);
  }
}
