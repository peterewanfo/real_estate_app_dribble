import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepoint_dribble_task/presentation/styles/custom_colors.dart';
import 'package:moniepoint_dribble_task/presentation/styles/custom_style.dart';
import 'package:moniepoint_dribble_task/presentation/views/dashboard/components/custom_margin.dart';
import 'package:moniepoint_dribble_task/utils/extension.dart';

class SearchHeaderWidget extends StatefulWidget {
  const SearchHeaderWidget({super.key});

  @override
  State<SearchHeaderWidget> createState() => _SearchHeaderWidgetState();
}

class _SearchHeaderWidgetState extends State<SearchHeaderWidget> {

  TextEditingController mapSearchTextController =
      TextEditingController(text: "Saint Petersburg");
  
  @override
  void dispose() {
    mapSearchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10.h,
        left: 20.w,
        right: 20.w,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 4.h,
                horizontal: 15.w,
              ),
              decoration: BoxDecoration(
                color: CustomColors.backgroundWhite,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset("ic_search_outline".svg)
                      .animate(
                        delay: const Duration(seconds: 1),
                      )
                      .fadeIn(),
                  const XMargin(6),
                  Expanded(
                    child: TextFormField(
                      controller: mapSearchTextController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        height: 1.0,
                      ),
                      textAlign: TextAlign.left,
                      decoration: const InputDecoration(
                        fillColor: Colors.transparent,
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 2),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn().scale(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeIn,
                ),
          ),
          const XMargin(20),
          Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CustomColors.backgroundWhite,
            ),
            child: SvgPicture.asset(
              "ic_filter".svg,
              fit: BoxFit.scaleDown,
            ),
          ).animate().scale(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeIn,
              ),
        ],
      ),
    );
  }
}
