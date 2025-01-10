import 'package:basegetxbloc/constant/one_colors.dart';
import 'package:basegetxbloc/constant/one_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemGridView extends StatelessWidget {
  const ItemGridView({
    super.key,
    required this.icon,
    required this.title,
    this.heightIcon = 32,
    this.widthIcon = 32,
    this.width,
    this.height,
    required this.onTap,
  });

  final String icon;
  final String title;
  final double? widthIcon;
  final double? heightIcon;
  final double? width;
  final double? height;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call();
      },
      child: Container(
        height: width,
        width: height,
        decoration: BoxDecoration(color: OneColors.white, borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                height: widthIcon,
                width: heightIcon,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: OneTheme.of(context).s16w6GreyBlur.copyWith(color: OneColors.buttonBlue),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
