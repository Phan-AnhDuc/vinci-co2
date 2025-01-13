import 'package:MoveGreen/component/repository/repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final api = Api.instance.restClient;

  RxString displayName = ''.obs;
  RxString phone = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getMe();
  }

  Future<void> getMe() async {
    try {
      final response = await api.getMe();
      print('==============${response.data}');
    } catch (e) {}
  }
}
