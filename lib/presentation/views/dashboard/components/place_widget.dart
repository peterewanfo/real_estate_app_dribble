import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_dribble_task/presentation/styles/custom_colors.dart';

class PlaceWidget extends StatelessWidget {
  const PlaceWidget({
    super.key,
    required this.image,
    required this.isFullView,
    required this.title,
  });

  final String image;
  final bool isFullView;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(
              left: 10.w,
              right: 10.w,
              bottom: 10.h,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: isFullView
                            ? Alignment.center
                            : Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: isFullView ? 0 : 8.0),
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: CustomColors.textPrimary,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ).animate().fadeIn(
                                delay: ((const Duration(seconds: 1) * 0.5) +
                                    const Duration(seconds: 1)),
                                duration: const Duration(seconds: 1),
                              ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: const EdgeInsets.only(
                            right: 4,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20,
                          ),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 12,
                            color: CustomColors.backgroundTertiary3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ).animate().scaleX(
                  delay: const Duration(seconds: 1) * 0.5,
                  duration: const Duration(seconds: 1),
                  alignment: Alignment.centerLeft,
                  curve: Curves.easeIn,
                ),
          ),
        ),
      ],
    );
  }
}
