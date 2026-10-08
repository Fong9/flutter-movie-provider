import 'package:flutter/material.dart';
import 'package:m_booking/app/modules/navigations/home/providers/movie_news_provider.dart';
import 'package:m_booking/app/modules/navigations/home/providers/movie_provider.dart';
import 'package:m_booking/app/modules/navigations/navbar/navbar_provider.dart';
import 'package:m_booking/app/on-boarding/onboarding_provider.dart';
import 'package:m_booking/repositories/movie_news_repo.dart';
import 'package:m_booking/repositories/movie_repo.dart';
import 'package:provider/provider.dart';

class AppProvider {
  AppProvider._();

  static Widget setup({required Widget child}) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
        ChangeNotifierProvider(create: (_) => NavbarProvider()),
        ChangeNotifierProvider(create: (_) => MovieProvider(movieRepository: MovieRepository())..fetchMovie()),
        ChangeNotifierProvider(create: (_) => MovieNewsProvider(movieNewsRepository: MovieNewsRepo())..fetchMovieNews()),
      ],
      child: child,
    );
  } 
}