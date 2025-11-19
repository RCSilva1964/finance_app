import 'dart:developer';

import 'package:finance_app/common/constants/app_colors.dart';
import 'package:finance_app/common/constants/app_text_styles.dart';
import 'package:finance_app/common/constants/routes.dart';
import 'package:finance_app/common/widgets/multi_text_button.dart';
import 'package:finance_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60.0),
          Expanded(
            child: Container(
              color: AppColors.iceWhite,
              child: Image.asset('assets/images/onboarding_image.png'),
            ),
          ),
          Text(
            'Gaste sabiamente,',
            style: AppTextStyles.mediumText.copyWith(color: AppColors.greenTwo),
          ),
          Text(
            'Poupe mais!',
            style: AppTextStyles.mediumText.copyWith(color: AppColors.greenTwo),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 16.0),
            child: PrimaryButton(
              text: 'Vamos começar!',
              onPressed: () {
                Navigator.pushNamed(context, NamedRoute.signUp);
              },
            ),
          ),
          const SizedBox(height: 16.0),

          MultiTextButton(
            onPressed: () => log('Tap'),
            children: [
              Text(
                'Já tem uma conta?',
                style: AppTextStyles.smallText.copyWith(color: AppColors.grey),
              ),
              Text(
                ' Entrar',
                style: AppTextStyles.smallText.copyWith(
                  color: AppColors.greenTwo,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40.0),
        ],
      ),
    );
  }
}
