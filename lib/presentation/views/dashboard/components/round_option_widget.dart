import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepoint_dribble_task/utils/extension.dart';

import '../../../../utils/ripple_animation_painter.dart';

class RoundOptionWidget extends StatefulWidget {
  const RoundOptionWidget({
    super.key,
    required this.iconUrl,
    required this.iconUrlActive,
    this.isActive = false,
    required this.height,
    required this.width,
    required this.backgroundColor,
    required this.onTap,
    this.animationCompletionEvent,
    this.awaitAnimationBeforeClick = true,
  });

  final String iconUrl;
  final String iconUrlActive;
  final bool isActive;
  final double width;
  final double height;
  final Color backgroundColor;
  final bool awaitAnimationBeforeClick;
  final Function() onTap;
  final Function()? animationCompletionEvent;

  @override
  State<RoundOptionWidget> createState() => _RoundOptionWidgetState();
}

class _RoundOptionWidgetState extends State<RoundOptionWidget>
    with TickerProviderStateMixin {
  late AnimationController firstRippleController;
  late Animation<double> firstRippleRadiusAnimation;
  late Animation<double> firstRippleOpacityAnimation;
  late Animation<double> firstRippleWidthAnimation;

  late AnimationController centerCircleController;
  late Animation<double> centerCircleRadiusAnimation;
  late Animation<double> transparentCenterCircleRadiusAnimation;

  @override
  void initState() {
    firstRippleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    firstRippleRadiusAnimation = Tween<double>(begin: 0, end: 30).animate(
      CurvedAnimation(
        parent: firstRippleController,
        curve: Curves.ease,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // firstRippleController.repeat();
          firstRippleController.reverse().then((v) {
            if (widget.animationCompletionEvent != null) {
              widget.animationCompletionEvent!.call();
            }
          });
        } else if (status == AnimationStatus.dismissed) {
          // firstRippleController.forward();
        }
      });

    firstRippleOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: firstRippleController,
        curve: Curves.ease,
      ),
    )..addListener(() {
        setState(() {});
      });

    firstRippleWidthAnimation = Tween<double>(begin: 10, end: 0).animate(
      CurvedAnimation(
        parent: firstRippleController,
        curve: Curves.ease,
      ),
    )..addListener(() {
        setState(() {});
      });

    /// CENTER
    centerCircleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    centerCircleRadiusAnimation = Tween<double>(begin: 0, end: 16.r).animate(
      CurvedAnimation(
        parent: centerCircleController,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // centerCircleController.repeat();
          centerCircleController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          // centerCircleController.forward();
        }
      });

    transparentCenterCircleRadiusAnimation =
        Tween<double>(begin: 0, end: 12.r).animate(
      CurvedAnimation(
        parent: centerCircleController,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    )
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              // centerCircleController.repeat();
              centerCircleController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              // centerCircleController.forward();
            }
          });

    super.initState();
  }

  @override
  void dispose() {
    firstRippleController.dispose();
    centerCircleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        /// START ANIMATION
        firstRippleController.forward();

        if (widget.awaitAnimationBeforeClick) {
          await centerCircleController.forward();
        } else {
          centerCircleController.forward();
        }

        widget.onTap.call();
      },
      child: Center(
        child: CustomPaint(
          painter: AnimationPainter(
            firstRippleRadiusAnimation.value,
            firstRippleOpacityAnimation.value,
            firstRippleWidthAnimation.value,
            centerCircleRadiusAnimation.value,
            transparentCenterCircleRadiusAnimation.value,
          ),
          child: Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.backgroundColor,
            ),
            child: SvgPicture.asset(
              widget.isActive ? widget.iconUrlActive.svg : widget.iconUrl.svg,
              fit: BoxFit.scaleDown,
            ),
          ).animate().scale(
                duration: const Duration(seconds: 1),
                curve: Curves.easeIn,
              ),
        ),
      ),
    ).noShadow;
  }
}
