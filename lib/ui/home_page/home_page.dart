import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:basegetxbloc/constant/one_colors.dart';
import 'package:basegetxbloc/constant/one_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<String> defaultIcons = [
    OneIcons.ic_home,
    OneIcons.ic_calendar,
    OneIcons.ic_co2,
    OneIcons.ic_profile,
  ];

  final List<String> activeIcons = [
    OneIcons.ic_home_current,
    OneIcons.ic_calendar_current,
    OneIcons.ic_co2_current,
    OneIcons.ic_profile_current,
  ];

  final List<String> titles = ["Home", "Schedule", "Carbon Chart", "Profile"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OneColors.kScreenBackgroundColor,
      body: Center(
        child: Text(
          'Selected Tab: ${titles[_currentIndex]}',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: OneColors.buttonBlue,
        onPressed: () {},
        child: const Icon(
          Icons.add_outlined,
          color: OneColors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        rightCornerRadius: 20,
        leftCornerRadius: 20,
        borderColor: OneColors.white,
        splashColor: OneColors.white,
        itemCount: 4,
        activeIndex: _currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        tabBuilder: (int index, bool isActive) {
          final icon = isActive ? activeIcons[index] : defaultIcons[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(icon),
              const SizedBox(height: 4),
              Text(
                titles[index],
                style: TextStyle(
                  color: OneColors.buttonBlue,
                  fontSize: 12,
                ),
              ),
            ],
          );
        },
        height: 70, // Tăng chiều cao
      ),
    );
  }
}
