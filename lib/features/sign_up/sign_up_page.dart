import 'dart:developer';

import 'package:finance_app/common/utils/validator.dart';
import 'package:finance_app/common/widgets/password_form_field.dart';
import 'package:finance_app/features/sign_up/sign_up_controller.dart';
import 'package:finance_app/features/sign_up/sign_up_state.dart';
import 'package:finance_app/service/mock_auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_styles.dart';
import '../../common/widgets/custom_bottom_sheet.dart';
import '../../common/widgets/custom_circular_progress_indicator.dart';
import '../../common/widgets/custom_text_form_field.dart';
import '../../common/widgets/multi_text_button.dart';
import '../../common/widgets/primary_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = SignUpController(MockAuthService());

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is SignUpLoadingState) {
        showDialog(
          context: context,
          builder: (context) =>
              const Center(child: CustomCircularProgressIndicator()),
        );
      }

      if (_controller.state is SignUpSucessState) {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Scaffold(body: Center(child: Text("Nova Tela"))),
          ),
        );
      }

      if (_controller.state is SignUpErrorState) {
        final error = _controller.state as SignUpErrorState;
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
                  controller: _nameController,
                  labelText: "Nome:",
                  hintText: "Digite seu Nome:",
                  // inputFormatters: [UpperCaseTextInputFormatter()],
                  validator: Validator.validateName,
                ),
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
                final valid =
                    _formKey.currentState != _formKey.currentState!.validate();
                if (valid) {
                  _controller.signUp(
                    name: _nameController.text,
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
