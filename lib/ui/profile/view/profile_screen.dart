import 'package:MoveGreen/constant/one_colors.dart';
import 'package:MoveGreen/constant/one_theme.dart';
import 'package:MoveGreen/ui/profile/controllers/proflie_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OneColors.kScreenBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  controller.getMe();
                },
                child: Container(
                  height: 50,
                  width: 50,
                  color: OneColors.bHA,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Nicolas Du Pont',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Text(
                '+33 626635975',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              _buildTotalCacbon(context),
              const SizedBox(height: 20),
              _buildMenuOption(context, 'Gérer les documents'),
              _buildMenuOption(context, 'Gérer le véhicule'),
              _buildMenuOption(context, 'Paramètres'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTotalCacbon(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: OneColors.buttonBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        children: [
          Icon(
            Icons.cloud, // CO2 icon
            color: Colors.white,
            size: 40,
          ),
          SizedBox(height: 10),
          Text(
            'Total CO2',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '0.92 tons CO2e',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            '0.33 CO2/km',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuOption(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            offset: const Offset(0, 4),
            blurRadius: 30,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: OneTheme.of(context).s14w5GreyBlur.copyWith(color: OneColors.greyBlue),
          ),
          Icon(
            Icons.arrow_forward_rounded,
            color: OneColors.buttonBlue.withOpacity(0.4),
            size: 26,
          ),
        ],
      ),
    );
  }
}
