import 'package:MoveGreen/constant/one_colors.dart';
import 'package:MoveGreen/constant/one_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemWorkSchedule extends StatelessWidget {
  const ItemWorkSchedule({
    super.key,
    this.title,
    this.dateTime,
    this.vehicleName,
    this.vehicle,
    this.average,
    this.startTime,
    this.endTime,
    this.startLocation,
    this.endLoaction,
    this.estimatedTime,
    required this.colorBackground,
  });

  final String? title;
  final String? dateTime;
  final String? vehicleName;
  final String? vehicle;
  final String? average;
  final String? startTime;
  final String? endTime;
  final String? startLocation;
  final String? endLoaction;
  final String? estimatedTime;
  final Color colorBackground;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? '',
                style: OneTheme.of(context).s14w5TextGreyDark.copyWith(color: OneColors.greyBlue.withOpacity(0.5)),
              ),
              const SizedBox(height: 4),
              Text(dateTime ?? '', style: OneTheme.of(context).s19w6greyBlur.copyWith(color: OneColors.buttonBlue, fontWeight: FontWeight.w700)),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: colorBackground,
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              vehicle ?? '',
                            )),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              vehicleName ?? '',
                              style: OneTheme.of(context).s14w5TextGreyDark.copyWith(color: OneColors.buttonBlue),
                            ),
                          ],
                        ),
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'CO2: ',
                            style: OneTheme.of(context).s12w5Primary.copyWith(color: OneColors.greyBlue.withOpacity(0.7)),
                          ),
                          TextSpan(
                            text: average,
                            style: OneTheme.of(context).s12w5Primary.copyWith(color: OneColors.buttonBlue),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Thông tin giờ đi và giờ đến
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          startTime ?? '',
                          style: OneTheme.of(context).s16w7TextGreyDark.copyWith(color: OneColors.buttonBlue),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          startLocation ?? '',
                          style: OneTheme.of(context).s14w5TextGreyDark.copyWith(color: OneColors.greyBlue.withOpacity(0.5)),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      "------ ${estimatedTime ?? ''} ------",
                      style: OneTheme.of(context).s16w7TextGreyDark.copyWith(color: OneColors.greyBlue.withOpacity(0.5)),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          endTime ?? '',
                          style: OneTheme.of(context).s16w7TextGreyDark.copyWith(color: OneColors.buttonBlue),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          endLoaction ?? '',
                          style: OneTheme.of(context).s14w5TextGreyDark.copyWith(color: OneColors.greyBlue.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
