import 'package:flutter/material.dart';
import 'package:sarmad_task/Core/Theme/colors.dart';

class AdaptiveCircularIndicator extends StatelessWidget {
  const AdaptiveCircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(
          backgroundColor: AppColors.primaryColor,
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.secondaryColor)),
    );
  }
}
