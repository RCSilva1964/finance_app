import 'dart:developer';

import 'package:finance_app/common/utils/uppercase_text_formatter.dart';
import 'package:finance_app/common/utils/validator.dart';
import 'package:finance_app/common/widgets/password_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_styles.dart';
import '../../common/widgets/custom_text_form_field.dart';
import '../../common/widgets/multi_text_button.dart';
import '../../common/widgets/primary_button.dart';

class SigUpPage extends StatefulWidget {
  const SigUpPage({super.key});

  @override
  State<SigUpPage> createState() => _SigUpPageState();
}

class _SigUpPageState extends State<SigUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text(
            'Gaste sabiamente,',
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumText.copyWith(color: AppColors.greenTwo),
          ),
          Text(
            textAlign: TextAlign.center,
            'Poupe mais!',
            style: AppTextStyles.mediumText.copyWith(color: AppColors.greenTwo),
          ),
          //Expanded(
          // child:
          Image.asset('assets/images/sign_up_image.png'),
          //),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: "Nome:",
                  hintText: "Digite seu Nome:",
                  // inputFormatters: [UpperCaseTextInputFormatter()],
                  validator: Validator.validateName,
                ),
                CustomTextFormField(
                  labelText: "E-mail:",
                  hintText: "Digite seu e-mail:",
                  validator: Validator.validateEmail,
                ),

                PasswordFormField(
                  controller: _passwordController,
                  labelText: "Digite sua senha:",
                  hintText: "********",
                  validator: Validator.validatePassword,
                  helperText:
                      "Deve ter ao menos 8 caracteres, sendo ao menos uma letra maiúscula e um número",
                ),

                PasswordFormField(
                  labelText: "Confirme sua senha:",
                  hintText: "********",
                  validator: (value) => Validator.validateConfirmPassword(
                    value,
                    _passwordController.text,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 16.0),
            child: PrimaryButton(
              text: 'Criar Conta',
              onPressed: () {
                final valid = _formKey.currentState?.validate();
                log(valid.toString());
              },
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
                  color: AppColors.greenTwo,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
