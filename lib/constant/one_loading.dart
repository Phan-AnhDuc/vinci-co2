import 'package:MoveGreen/constant/one_colors.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class OneLoading {
  static void showLoading([String? content]) async {
    EasyLoading.instance.backgroundColor = OneColors.buttonBlue;
    await EasyLoading.show(status: content);
  }

  static void hideLoading() async {
    await EasyLoading.dismiss();
  }
}
