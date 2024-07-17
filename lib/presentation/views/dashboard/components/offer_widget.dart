import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_dribble_task/presentation/styles/custom_style.dart';
import 'package:moniepoint_dribble_task/presentation/views/dashboard/components/animated_counter_widget.dart';
import 'package:moniepoint_dribble_task/presentation/views/dashboard/components/custom_margin.dart';

class OfferWidget extends StatelessWidget {
  final String title;
  final Color titleColor;
  final double amount;
  final double height;
  final Decoration? decoration;
  const OfferWidget({
    super.key,
    required this.title,
    required this.titleColor,
    required this.amount,
    required this.height,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: decoration,
      child: Column(
        children: [
          const YMargin(10),
          Text(
            title,
            style: CustomStyle.textStyleBody.copyWith(
              color: titleColor,
              fontSize: 10.sp,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedCounterWidget(
                  start: 0,
                  end: amount,
                  textColor: titleColor,
                  duration: const Duration(
                        seconds: 1,
                      ) *
                      1.4,
                ),
                Text(
                  "Offers",
                  style: CustomStyle.textStyleBody.copyWith(
                    color: titleColor,
                    fontSize: 12.sp,
                  ),
                )
              ],
            ),
          ),
          const YMargin(10),
        ],
      ),
    ).animate().scale(
          duration: const Duration(seconds: 1),
          curve: Curves.easeIn,
        );
  }
}
