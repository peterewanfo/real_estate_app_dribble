import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepoint_dribble_task/presentation/styles/custom_colors.dart';
import 'package:moniepoint_dribble_task/presentation/styles/custom_style.dart';
import 'package:moniepoint_dribble_task/presentation/views/dashboard/components/custom_margin.dart';
import 'package:moniepoint_dribble_task/utils/extension.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 15.w,
            ),
            decoration: BoxDecoration(
              color: CustomColors.backgroundWhite,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("ic_location".svg)
                    .animate(
                      delay: const Duration(seconds: 1),
                    )
                    .fadeIn(),
                const XMargin(6),
                Text(
                  "Saint Petersburg",
                  style: CustomStyle.textStyleBody.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.textTertiary,
                  ),
                )
                    .animate(
                      delay: const Duration(seconds: 1),
                    )
                    .fadeIn(),
              ],
            ),
          ).animate().fadeIn().slideX(
                duration: const Duration(seconds: 1),
                curve: Curves.easeIn,
              ),
          const Spacer(),
          Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CustomColors.backgroundPrimary,
            ),
            child: Image.asset(
              "ic_profile_photo".png,
              fit: BoxFit.scaleDown,
            ),
          ).animate().scale(
                duration: const Duration(seconds: 1),
                curve: Curves.easeIn,
              ),
        ],
      ),
    );
  }
}
