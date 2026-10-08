import 'package:flutter/cupertino.dart';
import 'package:m_booking/app/modules/navigations/home/screens/home_detail_screen.dart';
import 'package:m_booking/app/modules/navigations/home/screens/home_screen.dart';
import 'package:m_booking/app/modules/navigations/navbar/navbar.dart';
import 'package:m_booking/app/on-boarding/onboarding_screen.dart';
import 'package:m_booking/app/routes/route.dart';

class AppRoute {
  AppRoute._();

  static final Map<String, WidgetBuilder> routes = {
    Routes.onboarding: (context) => const OnboardingScreen(),
    Routes.navbar: (context) => const Navbar(),
    Routes.home: (context) => const HomeScreen(),
    Routes.homeDetail: (context) {
      final movieData = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      return HomeDetailScreen(movieData: movieData);
    }
  };
}