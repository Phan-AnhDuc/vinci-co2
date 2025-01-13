import 'package:MoveGreen/component/button/one_button.dart';
import 'package:MoveGreen/constant/one_colors.dart';
import 'package:MoveGreen/constant/one_icons.dart';
import 'package:MoveGreen/constant/one_images.dart';
import 'package:MoveGreen/constant/one_theme.dart';
import 'package:MoveGreen/services/shared_preferences_manager.dart';
import 'package:MoveGreen/shared/app_route.dart';
import 'package:MoveGreen/ui/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: OneColors.white,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 50,
              child: Center(
                child: SvgPicture.asset(
                  OneIcons.ic_logo_vinci_blue,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                OneImages.img_login,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Column(
                children: [
                  const SizedBox(height: 170),
                  Text('Bienvenue chez', style: OneTheme.of(context).s23w6GreyBlur.copyWith(fontWeight: FontWeight.w700, color: OneColors.buttonBlue, fontSize: 24)),
                  Text('GreenMove', style: OneTheme.of(context).s23w6GreyBlur.copyWith(fontWeight: FontWeight.w700, color: OneColors.buttonBlue, fontSize: 24)),
                  const SizedBox(height: 30),
                  OneButton(
                    label: 'Connectez-vous avec Microsoft Entra ID',
                    color: OneColors.buttonBlue,
                    prefixIconAssetPath: OneIcons.ic_microsoft_id,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                    borderRadius: BorderRadius.circular(70),
                    onPressed: () async {
                      final token = await SharedPrefManager.getKeyToken();
                      if (token == null) {
                        controller.signInWithMicrosoft();
                      } else {
                        Get.offAllNamed(AppRoute.HOME_PAGE.name);
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
