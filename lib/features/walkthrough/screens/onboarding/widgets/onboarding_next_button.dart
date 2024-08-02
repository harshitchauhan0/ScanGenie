import 'package:flutter/material.dart';
import 'package:scangenie/features/walkthrough/providers/onboarding/onboarding_provider.dart';
import 'package:scangenie/utils/constants/colors.dart';
import 'package:scangenie/utils/constants/sizes.dart';
import 'package:scangenie/utils/device/device_utility.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: AppSizes.defaultSpace,
      bottom: AppDeviceUtils.of(context).getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingProvider.instance.nextPage(context),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
          backgroundColor: AppColors.primary,
        ),
        child: const Icon(
          Icons.arrow_forward,
          color: AppColors.white,
        ),
      ),
    );
  }
}