import 'package:basegetxbloc/constant/one_colors.dart';
import 'package:basegetxbloc/constant/one_icons.dart';
import 'package:basegetxbloc/constant/one_images.dart';
import 'package:basegetxbloc/shared/app_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildBackground(context),
            _buildTutorial(context),
            _buildLogo(),
          ],
        ),
      ),
    );
  }

  Widget _buildBackground(BuildContext context) {
    return Image.asset(
      OneImages.img_splash,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    );
  }

  Widget _buildLogo() {
    return Positioned(
      top: 50,
      child: SvgPicture.asset(
        OneIcons.ic_logo_vinci,
        width: 105,
      ),
    );
  }

  Widget _buildTutorial(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: MediaQuery.of(context).size.width * 0.05,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27),
          color: OneColors.blur.withOpacity(0.6),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Căn trái các text
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 37, bottom: 7),
              child: Text(
                'Track and optimize your carb footprint',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 49),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(61),
                    color: OneColors.buttonBlue,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: const Center(
                    child: Text(
                      'Start',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 6,
                  child: InkWell(
                    onTap: () {
                      Get.offAllNamed(AppRoute.HOME_PAGE.name);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        border: Border.all(color: OneColors.neutral70, width: 1),
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [
                            Color(0x66FFFFFF),
                            Color(0xFFAFBCCB),
                          ],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                        ),
                      ),
                      child: SvgPicture.asset(
                        OneIcons.ic_arrow_forward,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
