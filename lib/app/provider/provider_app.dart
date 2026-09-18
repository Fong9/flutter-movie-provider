import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppProvider {
  AppProvider._();

  static Widget setup({required Widget child}) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (_) => OnboardingScreen())
      ]
    );
  } 
}