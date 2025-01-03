// // ignore_for_file: slash_for_doc_comments

// import 'package:basegetxbloc/shared/shared_preferences_utils.dart';

// import 'constant.dart';

// class SharedPrefManager {
//   SharedPrefManager._();

//   /** 
//     * Get key local device token
//     * Params: serialNumber
//     * Response: String
//   */
//   static Future<String?>? getKeyLocalDeviceToken({String? serialNumber}) async {
//     final result = await SharedPrefUtils.getString(key: '${LOCAL_DEVICE_TOKEN_PRE}_${serialNumber ?? ''.toUpperCase()}');
//     return result;
//   }

//   /** 
//     * Get device search guide
//     * Params: none
//     * Response: String
//   */
//   static Future<String?>? getDeviceSearchGuide() async {
//     final result = await SharedPrefUtils.getString(key: DEVICE_SEARCH_GUIDE);
//     return result;
//   }

//   /** 
//     * Get key Onelink
//     * Params: none
//     * Response: bool
//   */
//   static Future<bool?>? getKeyOneLink() async {
//     final result = await SharedPrefUtils.getBool(key: KEY_ONELINK);
//     return result;
//   }

//   /** 
//     * Get register local network permission
//     * Params: none
//     * Response: bool
//   */
//   static Future<bool?>? getRegisterLocalNetworkPer() async {
//     final result = await SharedPrefUtils.getBool(key: REGISTER_LOCAL_NETWORK_PER);
//     return result;
//   }

//   /** 
//     * Get key app version update ignored
//     * Params: none
//     * Response: string
//   */
//   static Future<String?>? getKeyAppVerUpdateIgnored() async {
//     final result = await SharedPrefUtils.getString(key: KEY_APP_VER_UPDATE_IGNORED);
//     return result;
//   }

//   /** 
//     * Get dashboard guide
//     * Params: none
//     * Response: string
//   */
//   static Future<String?>? getDashBoardGuide() async {
//     final result = await SharedPrefUtils.getString(key: DASH_BOARD_GUIDE);
//     return result;
//   }

//   /** 
//     * Get user login info
//     * Params: none
//     * Response: string
//   */
//   static Future<String?>? getUserLoginInfo() async {
//     final result = await SharedPrefUtils.getString(key: USER_LOGIN_INFO);
//     return result;
//   }

//   /** 
//     * Get user login denied
//     * Params: userName
//     * Response: string
//   */
//   static Future<String?>? getUserLoginDenied({required String userName}) async {
//     final result = await SharedPrefUtils.getString(key: '${USER_LOGIN_DENIED}_$userName');
//     return result;
//   }

//   /** 
//     * Get local devices
//     * Params: none
//     * Response: List<String>
//   */
//   static Future<List<String>?> getLocalDevices() async {
//     final result = await SharedPrefUtils.getStringList(key: LOCAL_DEVICES);
//     return result;
//   }

//   /** 
//     * Get first open time
//     * Params: none
//     * Response: int
//   */
//   static Future<int?>? getFirstOpenTime() async {
//     final result = await SharedPrefUtils.getInt(key: FIRST_OPEN_TIME);
//     return result;
//   }

//   /** 
//     * Set local devices
//     * Params: value
//     * Response: bool
//   */
//   static Future<bool?>? setLocalDevices({required List<String> value}) async {
//     final result = await SharedPrefUtils.saveStringList(key: LOCAL_DEVICES, value: value);
//     return result;
//   }

//   /** 
//     * Set key local device token
//     * Params: value, serialNumber
//     * Response: bool
//   */
//   static Future<bool?>? setKeyLocalDeviceToken({required String value, String? serialNumber}) async {
//     final result = await SharedPrefUtils.saveString(key: '${LOCAL_DEVICE_TOKEN_PRE}_$serialNumber', value: value);
//     return result;
//   }

//   /** 
//     * Set key one link
//     * Params: value
//     * Response: bool
//   */
//   static Future<bool?>? setKeyOneLink({required bool value}) async {
//     final result = await SharedPrefUtils.saveBool(key: KEY_ONELINK, value: value);
//     return result;
//   }

//   /** 
//     * Set register local network permission
//     * Params: value
//     * Response: bool
//   */
//   static Future<bool?>? setRegisterLocalNetworkPer({required bool value}) async {
//     final result = await SharedPrefUtils.saveBool(key: REGISTER_LOCAL_NETWORK_PER, value: value);
//     return result;
//   }

//   /** 
//     * Set key app version update ignored
//     * Params: version
//     * Response: bool
//   */
//   static Future<bool?>? setKeyAppVerUpdateIgnored({required String version}) async {
//     final result = await SharedPrefUtils.saveString(key: KEY_APP_VER_UPDATE_IGNORED, value: version);
//     return result;
//   }

//   /** 
//     * Set device search guide
//     * Params: value
//     * Response: bool
//   */
//   static Future<bool?>? setDeviceSearchGuide({required String value}) async {
//     final result = await SharedPrefUtils.saveString(key: DEVICE_SEARCH_GUIDE, value: value);
//     return result;
//   }

//   /** 
//     * Set dashboard guild
//     * Params: value
//     * Response: bool
//   */
//   static Future<bool?>? setDashBoardGuide({required String value}) async {
//     final result = await SharedPrefUtils.saveString(key: DASH_BOARD_GUIDE, value: value);
//     return result;
//   }

//   /** 
//     * Set user login info
//     * Params: value
//     * Response: bool
//   */
//   static Future<bool?>? setUserLoginInfo({required String value}) async {
//     final result = await SharedPrefUtils.saveString(key: USER_LOGIN_INFO, value: value);
//     return result;
//   }

//   /** 
//     * Set user login denied
//     * Params: userName, value
//     * Response: bool
//   */
//   static Future<bool?>? setUserLoginDenied({required String userName, required String value}) async {
//     final result = await SharedPrefUtils.saveString(key: '${USER_LOGIN_DENIED}_$userName', value: value);
//     return result;
//   }

//   /** 
//     * Set first open time
//     * Params: int
//     * Response: int
//   */
//   static Future<bool?>? setFirstOpenTime({required int timeStamp}) async {
//     final result = await SharedPrefUtils.saveInt(key: FIRST_OPEN_TIME, value: timeStamp);
//     return result;
//   }

//   /** 
//     * setSpeedTest
//     * Params: value
//     * Response: bool
//   */
//   static Future<bool?>? setSpeedTest({required List<String> value}) async {
//     final result = await SharedPrefUtils.saveStringList(key: SPEED_TEST, value: value);
//     return result;
//   }

//   /**
//     * getSpeedTest
//     * Params: none
//     * Response: List<String>
//   */
//   static Future<List<String>?> getSpeedTest() async {
//     final result = await SharedPrefUtils.getStringList(key: SPEED_TEST);
//     return result;
//   }
// }
