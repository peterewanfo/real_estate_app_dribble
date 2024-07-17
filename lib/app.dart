import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_dribble_task/presentation/styles/custom_colors.dart';
import 'package:moniepoint_dribble_task/presentation/views/dashboard/home_screen.dart';

import 'presentation/styles/custom_style.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 720),
      builder: (context, child) {
        return MaterialApp(
          title: 'Moniepoint Task',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: const ColorScheme.light(
              primary: Colors.white,
              secondary: Colors.white,
              onSecondary: Colors.white,
              onSurface: Colors.white,
            ),
            primaryColorLight: Colors.white,
            primaryColorDark: Colors.white,
            unselectedWidgetColor: Colors.white,
            useMaterial3: true,
            hintColor: Colors.white,
            canvasColor: Colors.white,
            iconTheme: IconThemeData(
              color: CustomColors.textPrimary,
            ),
            fontFamily: 'Euclid',
            textTheme: TextTheme(
              labelLarge: CustomStyle.textStyleBody,
              labelMedium: CustomStyle.textStyleBody,
              labelSmall: CustomStyle.textStyleBody,
              titleLarge: CustomStyle.textStyleBody,
              titleMedium: CustomStyle.textStyleBody,
              titleSmall: CustomStyle.textStyleBody,
              bodyLarge: CustomStyle.textStyleBody,
              bodyMedium: CustomStyle.textStyleBody,
              bodySmall: CustomStyle.textStyleBody,
            ),
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}
