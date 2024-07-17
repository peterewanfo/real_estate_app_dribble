import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepoint_dribble_task/presentation/styles/custom_colors.dart';
import 'package:moniepoint_dribble_task/utils/extension.dart';

class CustomMarkerWidget extends StatelessWidget {
  const CustomMarkerWidget({
    super.key,
    required this.showPrice,
    required this.price,
  });

  final bool showPrice;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: CustomColors.backgroundPrimary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 500),
        alignment: Alignment.centerLeft,
        child: Builder(builder: (context) {
          if (showPrice) {
            return Text(
              price,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            );
          } else {
            return SvgPicture.asset(
              "ic_building".svg,
              fit: BoxFit.scaleDown,
            ).animate().fade(
                  delay: (const Duration(milliseconds: 100)),
                  duration: const Duration(seconds: 1),
                );
          }
        }).animate().fade(
              delay: (const Duration(seconds: 1) * 1.9),
              duration: const Duration(seconds: 1),
            ),
      ),
    ).animate().scale(
          delay: const Duration(seconds: 1),
          duration: const Duration(seconds: 1),
          alignment: Alignment.bottomLeft,
        );
  }
}
