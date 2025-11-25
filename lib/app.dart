// import 'package:finance_app/features/sign_up/sign_up_page.dart';
import 'package:finance_app/features/home/home_page.dart';
import 'package:finance_app/features/onboarding/onboarding_page.dart';
import 'package:finance_app/features/sign_in/sign_in_page.dart';
import 'package:finance_app/features/sign_up/sign_up_page.dart';
import 'package:finance_app/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'common/constants/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: defaultTheme,
      initialRoute: NamedRoute.splash,
      routes: {
        NamedRoute.initial: (context) => const OnboardingPage(),
        NamedRoute.splash: (context) => const SplashPage(),
        NamedRoute.signUp: (context) => SignUpPage(),
        NamedRoute.signIn: (context) => SignInPage(),
        NamedRoute.home: (context) => HomePage(),
      },
    );
  }
}
