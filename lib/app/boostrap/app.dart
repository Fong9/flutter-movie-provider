import 'package:flutter/material.dart';
import 'package:m_booking/app/on-boarding/onboarding.dart';
import 'package:m_booking/app/routes/route.dart';
import 'package:m_booking/app/routes/route_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.onboarding,
      routes: AppRoute.routes,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
        )
      ),
      home: OnboardingScreen(),
    );
  }
}