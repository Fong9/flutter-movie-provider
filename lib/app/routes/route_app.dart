import 'package:flutter/cupertino.dart';
import 'package:m_booking/app/on-boarding/onboarding.dart';
import 'package:m_booking/app/routes/route.dart';

class AppRoute {
  AppRoute._();

  static final Map<String, WidgetBuilder> routes = {
    Routes.onboarding: (context) => const OnboardingScreen(),
  };
}