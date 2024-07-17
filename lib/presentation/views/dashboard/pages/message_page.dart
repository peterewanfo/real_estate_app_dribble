import 'package:flutter/material.dart';

import '../../../styles/custom_colors.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            CustomColors.bacgroundWhite2,
            CustomColors.backgroundPrimary.withOpacity(0.3),
          ],
          stops: const [0.3, 1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
