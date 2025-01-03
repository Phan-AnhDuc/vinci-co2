import 'package:basegetxbloc/component/button/one_button.dart';
import 'package:basegetxbloc/component/textfield/one_textfield.dart';
import 'package:basegetxbloc/constant/one_colors.dart';
import 'package:basegetxbloc/constant/one_icons.dart';
import 'package:basegetxbloc/constant/one_images.dart';
import 'package:basegetxbloc/constant/one_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final OneTextFieldController _userNameController = OneTextFieldController();
  final OneTextFieldController _passwordController = OneTextFieldController();
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
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Column(
                children: [
                  const SizedBox(height: 170),
                  Text('Welcome to', style: OneTheme.of(context).s23w6GreyBlur),
                  Text('Aide à la mobilite', style: OneTheme.of(context).s23w6GreyBlur),
                  const SizedBox(height: 30),
                  OneTextField(
                    titleText: 'E-mail',
                    hintText: '',
                    hintStyle: OneTheme.of(context).s14w4SteelGrey.copyWith(color: OneColors.neutral70),
                    textStyle: OneTheme.of(context).s16w6GreyBlur,
                    controller: _userNameController,
                    errorMaxLines: 2,
                    onChanged: (value) {},
                    style: OneTextFieldStyle.border,
                    isRequired: true,
                  ),
                  const SizedBox(height: 10),
                  OneTextField(
                    titleText: 'Mot de passe',
                    hintText: '',
                    hintStyle: OneTheme.of(context).s14w4SteelGrey.copyWith(color: OneColors.neutral70),
                    textStyle: OneTheme.of(context).s16w6GreyBlur,
                    controller: _passwordController,
                    errorMaxLines: 2,
                    onChanged: (value) {},
                    style: OneTextFieldStyle.border,
                    isRequired: true,
                  ),
                  const SizedBox(height: 30),
                  OneButton(
                    padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 10),
                    borderRadius: BorderRadius.circular(60),
                    label: 'Login',
                    onPressed: () {
                      _passwordController.shake(errorText: 'test rung');
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
