import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_styles.dart';
import '../../common/widgets/multi_text_button.dart';
import '../../common/widgets/primary_button.dart';

class SigUpPage extends StatelessWidget {
  const SigUpPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text(
            'Gaste sabiamente,',
            style: AppTextStyles.mediumText.copyWith(
              color: AppColors.greenlightTwo,
            ),
          ),
          Text(
            'Poupe mais!',
            style: AppTextStyles.mediumText.copyWith(
              color: AppColors.greenlightTwo,
            ),
          ),
          Expanded(
            child: Image.asset(
                'assets/images/sign_up_image.png'
            ),
          ),
          TextFormField(),
          const TextField(),

          Padding(
            padding: const EdgeInsets.only(
                left: 32.0,
                right: 32.0,
                top: 16.0
            ),
            child: PrimaryButton(
              text: 'Criar Conta',
              onPressed: () => log('Criar Conta'),
            ),
          ),
          const SizedBox(height: 16.0),
          MultiTextButton(
            onPressed: () => log('Entrar'),
            children: [
              Text(
                'Já tem uma conta?',
                style: AppTextStyles.smallText.copyWith(color: AppColors.grey),
              ),
              Text(
                ' Entrar',
                style: AppTextStyles.smallText.copyWith(
                  color: AppColors.greenlightTwo,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}