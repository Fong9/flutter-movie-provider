import 'package:flutter/material.dart';
import 'package:m_booking/app/constants/color_app.dart';
import 'package:m_booking/app/constants/image_app.dart';
import 'package:m_booking/app/on-boarding/onboarding_provider.dart';
import 'package:m_booking/app/routes/route.dart';
import 'package:m_booking/app/widget/app_button.dart';
import 'package:m_booking/data/onboard_data.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OnboardingProvider>().onScroll(pageController);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OnboardingProvider>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppImage.logo, scale: 2),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.navbar);
                        },
                        child: Text('Skip', style: TextStyle(color: Colors.white, fontSize: 16))),
                      Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
                    ],
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 36),
                child: PageView.builder(
                  controller: pageController,
                  itemCount: onboardData.length,
                  onPageChanged: provider.onPageChange,
                  itemBuilder: ((context, index) {
                    final data = onboardData[index];
                    return Column(
                      spacing: 8,
                      children: [
                        ClipRRect(
                          borderRadius: .circular(10),
                          child: Image.asset(data['image'], height: 400, fit: BoxFit.contain),
                        ),
                        Text(
                          data['text'],
                          style: TextStyle(color: Colors.white, fontWeight: .bold, fontSize: 24),
                        ),
                        Text(data['label'], style: TextStyle(color: Colors.white)),
                      ],
                    );
                  }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
              child: Column(
                spacing: 16,
                children: [
                  AppButton(
                    onTap: () {
                      // oAuthLogin
                    },
                    color: Colors.transparent,
                    child: Row(
                      spacing: 8,
                      mainAxisAlignment: .center,
                      children: [
                        Image.asset(AppImage.facebook, width: 32),
                        Text(
                          'Sign in with Facebook',
                          style: TextStyle(color: Colors.white, fontWeight: .w500, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  AppButton(
                    onTap: () {
                      // oAuthLogin
                    },
                    color: Colors.transparent,
                    child: Row(
                      spacing: 8,
                      mainAxisAlignment: .center,
                      children: [
                        Image.asset(AppImage.google, width: 48),
                        Text(
                          'Sign in with Google',
                          style: TextStyle(color: Colors.white, fontWeight: .w500, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
