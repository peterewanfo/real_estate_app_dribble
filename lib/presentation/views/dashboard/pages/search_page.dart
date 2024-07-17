import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moniepoint_dribble_task/presentation/styles/custom_colors.dart';
import 'package:moniepoint_dribble_task/presentation/styles/custom_style.dart';
import 'package:moniepoint_dribble_task/presentation/views/dashboard/components/custom_margin.dart';
import 'package:moniepoint_dribble_task/presentation/views/dashboard/components/search_header_widget.dart';
import 'package:moniepoint_dribble_task/utils/extension.dart';

import '../components/custom_markers_widget.dart';
import '../components/variant_list_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool showPrice = true;
  bool showVariants = false;
  AnimationController? variantAnimationController;
  String? _customMapStyle;
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(59.927430, 30.363810);

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  @override
  void initState() {
    rootBundle.loadString('assets/custom_map.json').then((string) {
      _customMapStyle = string;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          GoogleMap(
            style: _customMapStyle,
            onMapCreated: _onMapCreated,
            zoomControlsEnabled: false,
            scrollGesturesEnabled: false,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 13.0,
            ),
          ).animate().fadeIn(
                duration: const Duration(seconds: 1) * 0.8,
              ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: SearchHeaderWidget(),
            ),
          ),
          Positioned(
            left: 100,
            top: 200,
            child: CustomMarkerWidget(
              showPrice: showPrice,
              price: "10,3 mn P",
            ),
          ),
          Positioned(
            left: 115,
            top: 250,
            child: CustomMarkerWidget(
              showPrice: showPrice,
              price: "11 mn P",
            ),
          ),
          Positioned(
            right: 20,
            top: 280,
            child: CustomMarkerWidget(
              showPrice: showPrice,
              price: "7,8 mn P",
            ),
          ),
          Positioned(
            right: 20,
            top: 430,
            child: CustomMarkerWidget(
              showPrice: showPrice,
              price: "13,3 mn P",
            ),
          ),
          Positioned(
            left: 50,
            top: 480,
            child: CustomMarkerWidget(
              showPrice: showPrice,
              price: "8,5 mn P",
            ),
          ),
          Positioned(
            right: 50,
            top: 570,
            child: CustomMarkerWidget(
              showPrice: showPrice,
              price: "6,95 mn P",
            ),
          ),
          Positioned(
            bottom: 0,
            child: SafeArea(
              child: Container(
                margin: EdgeInsets.only(
                  left: 20.w,
                  bottom: 10.h,
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          showVariants = !showVariants;
                        });
                      },
                      child: Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomColors.backgroundWhite.withOpacity(0.6),
                        ),
                        child: SvgPicture.asset(
                          "ic_wallet".svg,
                          fit: BoxFit.scaleDown,
                        ),
                      ).animate().scale(
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeIn,
                          ),
                    ).noShadow,
                    const YMargin(4),
                    Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomColors.backgroundWhite.withOpacity(0.6),
                      ),
                      child: SvgPicture.asset(
                        "ic_send".svg,
                        fit: BoxFit.scaleDown,
                      ),
                    ).animate().scale(
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeIn,
                        ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 85,
            left: 25,
            child: SafeArea(
              child: Visibility(
                visible: showVariants,
                child: Container(
                  decoration: BoxDecoration(
                    color: CustomColors.backgroundTertiary4,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  height: 160.h,
                  width: 160.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      VariantListWidget(
                        iconUrl: "ic_cozy",
                        iconUrlSelected: "ic_cozy",
                        title: "Cosy areas",
                        isActive: false,
                        onTap: () {},
                      ),
                      VariantListWidget(
                        iconUrl: "ic_wallet_default",
                        iconUrlSelected: "ic_wallet_active",
                        title: "Price",
                        isActive: showPrice,
                        onTap: () async {
                          await variantAnimationController!.reverse();
                          setState(() {
                            showPrice = showPrice = true;
                            showVariants = !showVariants;
                            
                          });
                        },
                      ),
                      VariantListWidget(
                        iconUrl: "ic_infrastructure",
                        iconUrlSelected: "ic_infrastructure_active",
                        title: "Infrastructure",
                        isActive: false,
                        onTap: () {},
                      ),
                      VariantListWidget(
                        iconUrl: "ic_layer",
                        iconUrlSelected: "ic_layer_active",
                        title: "Without any layer",
                        isActive: !showPrice,
                        onTap: () async {
                          await variantAnimationController!.reverse();
                          setState(() {
                            showPrice = false;
                            showVariants = !showVariants;
                            
                          });
                        },
                      ),
                    ],
                  ),
                ).animate(onInit: (controller) {
                  variantAnimationController = controller;
                }).scale(
                  duration: const Duration(milliseconds: 420),
                  alignment: Alignment.bottomLeft,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SafeArea(
              child: Container(
                margin: EdgeInsets.only(
                  right: 20.w,
                  bottom: 10.h,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: CustomColors.backgroundWhite.withOpacity(0.6),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 10.h,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "ic_list".svg,
                        fit: BoxFit.scaleDown,
                      ),
                      const XMargin(10),
                      Text(
                        "List of variants",
                        style: CustomStyle.textStyleBody.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: CustomColors.textSecondary,
                        ),
                      )
                    ],
                  ),
                ).animate().scale(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeIn,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
