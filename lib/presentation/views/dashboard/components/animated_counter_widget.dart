import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_dribble_task/presentation/styles/custom_style.dart';

class AnimatedCounterWidget extends StatefulWidget {
  final double start;
  final double end;
  final Duration duration;
  final Color textColor;

  const AnimatedCounterWidget({
    super.key,
    required this.start,
    required this.end,
    required this.duration,
    required this.textColor,
  });

  @override
  _AnimatedCounterWidgetState createState() => _AnimatedCounterWidgetState();
}

class _AnimatedCounterWidgetState extends State<AnimatedCounterWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = Tween<double>(
      begin: widget.start,
      end: widget.end,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _animation.value
          .toStringAsFixed(0)
          .replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ' '),
      style: CustomStyle.textStyleBody.copyWith(
        fontSize: 30.sp,
        color: widget.textColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
