import 'package:basegetxbloc/component/item_gridview.dart';
import 'package:basegetxbloc/component/item_work_schedule.dart';
import 'package:basegetxbloc/constant/one_colors.dart';
import 'package:basegetxbloc/constant/one_icons.dart';
import 'package:basegetxbloc/constant/one_images.dart';
import 'package:basegetxbloc/constant/one_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  final ValueNotifier<bool> _isShowTravel = ValueNotifier<bool>(true);

  List<String> iconGridView = [OneIcons.ic_location, OneIcons.ic_car_blue, OneIcons.ic_statistical, OneIcons.ic_foot];
  List<String> titleGridView = ['Mes voyages', 'Mon garage', 'Mes statistiques de mobilité', 'Mon activité physique'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.3, 1.5),
            end: Alignment(0.2, -1.4),
            colors: [
              OneColors.white,
              Color(0xFF82BDF2),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    _buildTotalCacbonAndAverage(),
                    _buildStatistiques(),
                    _buildWorkSchedule(),
                    const SizedBox(height: 16),
                    _buidBanner(),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              _buildGridView(),
              const SliverToBoxAdapter(child: SizedBox(height: 50)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTotalCacbonAndAverage() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFFB2DFFC),
              Color(0xFF82BDF2),
            ],
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: OneColors.white.withOpacity(0.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total CO2',
                style: OneTheme.of(context).s12w5Primary,
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '4.92 ',
                      style: OneTheme.of(context).s24w7primary,
                    ),
                    TextSpan(
                      text: 'tons CO2e',
                      style: OneTheme.of(context).s14w7TextGreyDark.copyWith(color: OneColors.buttonBlue),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(
                  color: Color(0xFF002B7A),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(32),
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  '12%',
                  style: OneTheme.of(context).s14w7TextGreyDark.copyWith(color: OneColors.white),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Average',
                style: OneTheme.of(context).s14w5TextGreyDark.copyWith(color: OneColors.buttonBlue),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatistiques() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Statistiques',
                style: OneTheme.of(context).s19w6greyBlur.copyWith(color: OneColors.buttonBlue, fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  _buildItemIcon(index: 1, icons: OneIcons.ic_co2_tab),
                  _buildItemIcon(index: 2, icons: OneIcons.ic_tree),
                  _buildItemIcon(index: 3, icons: OneIcons.ic_connect_location),
                  _buildItemIcon(index: 4, icons: OneIcons.ic_plane),
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: OneColors.white, borderRadius: BorderRadius.circular(15)),
          ),
        ],
      ),
    );
  }

  Widget _buildItemIcon({required int index, Function? callBack, required String icons}) {
    final bool isSelected = _selectedIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        callBack?.call();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        padding: const EdgeInsets.all(12),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? OneColors.greenLight : OneColors.white,
          border: Border.all(
            width: 1,
            color: Colors.white,
          ),
        ),
        child: SvgPicture.asset(
          icons,
          color: isSelected ? Colors.white : null,
        ),
      ),
    );
  }

  Widget _buildWorkSchedule() {
    return ValueListenableBuilder(
        valueListenable: _isShowTravel,
        builder: (context, value, child) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Calendrier de travail',
                    style: OneTheme.of(context).s19w6greyBlur.copyWith(color: OneColors.buttonBlue, fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  InkWell(
                    onTap: () {
                      _isShowTravel.value = !_isShowTravel.value;
                    },
                    child: Row(
                      children: [
                        Text(
                          'Août',
                          style: OneTheme.of(context).s14w7TextGreyDark.copyWith(color: OneColors.buttonBlue),
                        ),
                        Icon(
                          value ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_up_rounded,
                          color: OneColors.buttonBlue,
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              value ? _buildItemWorkSchedule() : const SizedBox(),
            ],
          );
        });
  }

  Widget _buildItemWorkSchedule() {
    return const Column(
      children: [
        ItemWorkSchedule(
          title: 'Jeudi',
          dateTime: '08.22',
          average: '3.45 mg/km',
          endLoaction: 'Bordeaux',
          endTime: '20:35',
          estimatedTime: '7h40m',
          startLocation: 'Paris',
          startTime: '10:44',
          vehicle: OneIcons.ic_car,
          vehicleName: 'Voiture',
          colorBackground: OneColors.greenLight,
        ),
        SizedBox(height: 16),
        ItemWorkSchedule(
          title: 'Mercredi',
          dateTime: '08.14',
          average: '5.45 mg/km',
          endLoaction: 'Barcelone',
          endTime: '12:44',
          estimatedTime: '2h',
          startLocation: 'Paris',
          startTime: '10:44',
          vehicle: OneIcons.ic_plane_vehicle,
          vehicleName: 'Avion',
          colorBackground: OneColors.yellowLight,
        ),
      ],
    );
  }

  Widget _buidBanner() {
    return Image.asset(
      OneImages.img_banner,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    );
  }

  Widget _buildGridView() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return ItemGridView(icon: iconGridView[index], title: titleGridView[index]);
        },
        childCount: 4,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
