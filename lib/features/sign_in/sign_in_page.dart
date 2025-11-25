import 'dart:developer';

import 'package:finance_app/common/constants/routes.dart';
import 'package:finance_app/common/utils/validator.dart';
import 'package:finance_app/common/widgets/password_form_field.dart';
import 'package:finance_app/features/sign_in/sign_in_controller.dart';
import 'package:finance_app/features/sign_in/sign_in_state.dart';
import 'package:flutter/material.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_styles.dart';
import '../../common/widgets/custom_bottom_sheet.dart';
import '../../common/widgets/custom_circular_progress_indicator.dart';
import '../../common/widgets/custom_text_form_field.dart';
import '../../common/widgets/multi_text_button.dart';
import '../../common/widgets/primary_button.dart';
import '../../locator.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = locator.get<SignInController>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is SignInStateLoading) {
        showDialog(
          context: context,
          builder: (context) =>
              const Center(child: CustomCircularProgressIndicator()),
        );
      }

      if (_controller.state is SignInStateSuccess) {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, NamedRoute.home);
      }

      if (_controller.state is SignInStateError) {
        final error = _controller.state as SignInStateError;
        Navigator.pop(context);
        customModalBottomSheet(
          context,
          content: error.message,
          buttonText: "Tentar Novamente.",
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text(
            'Bem-vindo de volta!',
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumText.copyWith(color: AppColors.greenTwo),
          ),
          //Expanded(
          // child:
          Image.asset('assets/images/sign_in_image.png'),
          //),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _emailController,
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
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 16.0),
            child: PrimaryButton(
              text: 'Entrar na Conta',
              onPressed: () {
                final valid =
                    _formKey.currentState != null &&
                    _formKey.currentState!.validate();
                if (valid) {
                  _controller.signIn(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                } else {
                  log("erro ao logar");
                }
              },
            ),
          ),
          const SizedBox(height: 16.0),
          MultiTextButton(
            onPressed: () =>
                Navigator.popAndPushNamed(context, NamedRoute.signUp),
            children: [
              Text(
                'Não tem uma conta?',
                style: AppTextStyles.smallText.copyWith(color: AppColors.grey),
              ),
              Text(
                ' Criar conta',
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
