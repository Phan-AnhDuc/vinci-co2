import 'package:basegetxbloc/constant/one_colors.dart';
import 'package:basegetxbloc/constant/one_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemGridView extends StatelessWidget {
  const ItemGridView({
    super.key,
    required this.icon,
    required this.title,
  });

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: OneColors.white, borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: 32,
              width: 32,
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
    );
  }
}
