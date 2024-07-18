import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/enums.dart';
import '../../styles/custom_colors.dart';
import 'components/bottom_nav_widget.dart';
import 'pages/__export__.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomePages _currentActiveHomePageIndex = HomePages.home;

  void changeActiveHomePageIndex(HomePages newPage) {
    setState(() {
      _currentActiveHomePageIndex = newPage;
    });
  }

  final List<Widget> pages = [
    const SearchPage(),
    const MessagePage(),
    const HomePage(),
    const FavouritePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentActiveHomePageIndex.index],
      extendBody: true,
      bottomNavigationBar: Container(
        height: 57.h,
        margin: const EdgeInsets.only(
          left: 50,
          right: 50,
          bottom: 35,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 6,),
        decoration: BoxDecoration(
          color: CustomColors.backgroundTertiary2,
          boxShadow: [
            BoxShadow(
              blurRadius: 55,
              color: Colors.black.withOpacity(0.15),
            ),
            BoxShadow(
              blurRadius: 100,
              color: Colors.black.withOpacity(0.15),
            ),
          ],
          borderRadius: BorderRadius.circular(45),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavWidget(
              isSelected: _currentActiveHomePageIndex == HomePages.search,
              activeIconUrl: "ic_search",
              inactiveIconUrl: "ic_search",
              onTap: () {
                changeActiveHomePageIndex(HomePages.search);
              },
            ),
            BottomNavWidget(
              isSelected: _currentActiveHomePageIndex == HomePages.message,
              activeIconUrl: "ic_message",
              inactiveIconUrl: "ic_message",
              onTap: () {
                changeActiveHomePageIndex(HomePages.message);
              },
            ),
            BottomNavWidget(
              isSelected: _currentActiveHomePageIndex == HomePages.home,
              activeIconUrl: "ic_home",
              inactiveIconUrl: "ic_home_inactive",
              onTap: () {
                changeActiveHomePageIndex(HomePages.home);
              },
            ),
            BottomNavWidget(
              isSelected: _currentActiveHomePageIndex == HomePages.favourite,
              activeIconUrl: "ic_favourite",
              inactiveIconUrl: "ic_favourite",
              onTap: () {
                changeActiveHomePageIndex(HomePages.favourite);
              },
            ),
            BottomNavWidget(
              isSelected: _currentActiveHomePageIndex == HomePages.profile,
              activeIconUrl: "ic_profile",
              inactiveIconUrl: "ic_profile",
              onTap: () {
                changeActiveHomePageIndex(HomePages.profile);
              },
            ),
          ],
        ),
      )
          .animate(
            delay: const Duration(seconds: 1) * 1.8,
          )
          .slideY(
            begin: 1,
            end: 0,
            curve: Curves.easeOut,
            duration: const Duration(seconds: 1),
          ),
    );
  }
}
