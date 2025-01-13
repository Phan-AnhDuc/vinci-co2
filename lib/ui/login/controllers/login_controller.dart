// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'package:MoveGreen/component/repository/repository.dart';
import 'package:MoveGreen/constant/one_loading.dart';
import 'package:MoveGreen/model/response_user_microsoft.dart';
import 'package:MoveGreen/services/shared_preferences_manager.dart';
import 'package:MoveGreen/shared/app_route.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final FlutterAppAuth appAuth = const FlutterAppAuth();
  String tenantId = "d6afd889-cd24-4442-95b4-92cb305b82f8";
  String clientId = "96e3c684-0b86-4726-91d7-8c5791689466";
  String redirectUri = "com.example.testlogin://auth";
  List<String> scopes = ["openid", "profile", "email", "User.Read", "Contacts.Read"];
  ResponseUserMicrosoft? infoUser;

  final api = Api.instance.restClient;
  Future<void> signInWithMicrosoft() async {
    try {
      final AuthorizationTokenResponse result = await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          clientId,
          redirectUri,
          discoveryUrl: 'https://login.microsoftonline.com/${tenantId}/v2.0/.well-known/openid-configuration',
          scopes: scopes,
        ),
      );
      print('=====Access Token======: ${result.accessToken}');
      print('=======ID Token======: ${result.idToken}');
      await fetchMicrosoftUserProfile(result.accessToken ?? '');
    } catch (e) {
      print('=====Đăng nhập thất bại====: $e');
    }
  }

  Future<void> fetchMicrosoftUserProfile(String accessToken) async {
    final url = Uri.parse('https://graph.microsoft.com/v1.0/me');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    );
    if (response.statusCode == 200) {
      infoUser = ResponseUserMicrosoft.fromJson(json.decode(response.body));
      login();
    } else {
      print('Lỗi khi lấy thông tin người dùng: ${response.statusCode}');
    }
  }

  Future<void> login() async {
    try {
      final map = {
        "microsoftId": infoUser?.id,
        "displayName": infoUser?.displayName,
        "email": infoUser?.mail,
        "phoneNumber": infoUser?.mobilePhone,
        "givenName": infoUser?.givenName,
        "surname": infoUser?.surname,
        "jobTitle": infoUser?.jobTitle,
        "officeLocation": infoUser?.officeLocation,
        "avatar": null,
      };
      OneLoading.showLoading();
      final response = await api.login(map);
      final String token = response.data['accessToken'];
      SharedPrefManager.setKeyToken(token: token);
      OneLoading.hideLoading();
      if (token.isNotEmpty) {
        Get.offAllNamed(AppRoute.HOME_PAGE.name);
      }
    } catch (e) {}
  }
}
