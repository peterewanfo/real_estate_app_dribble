import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepoint_dribble_task/presentation/styles/custom_colors.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({
    super.key,
    required this.isSelected,
    required this.activeIconUrl,
    required this.inactiveIconUrl,
    required this.onTap,
  });

  final bool isSelected;
  final String activeIconUrl;
  final String inactiveIconUrl;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        margin: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color: isSelected
              ? CustomColors.backgroundPrimary
              : CustomColors.backgroundTertiary3,
          shape: BoxShape.circle,
        ),
        duration: const Duration(milliseconds: 500),
        child: SizedBox(
          height: 48.h,
          width: 46.w,
          child: SvgPicture.asset(
            isSelected
              ? activeIconUrl : inactiveIconUrl,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
