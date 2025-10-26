import 'package:finance_app/common/constants/app_colors.dart';
import 'package:finance_app/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const PrimaryButton({super.key, this.onPressed, required this.text});

  final BorderRadius _borderRadius = const BorderRadius.all(
    Radius.circular(32.0),
  );

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 64.0,
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: onPressed != null
              ? AppColors.greenGradient
              : AppColors.greyGradient,
        ),
      ),
      child: InkWell(
        borderRadius: _borderRadius,
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(borderRadius: _borderRadius),
          alignment: Alignment.center,
          height: 64.0,
          child: Text(
            text,
            style: AppTextStyles.mediumText18.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
