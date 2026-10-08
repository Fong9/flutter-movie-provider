import 'dart:async';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:m_booking/data/onboard_data.dart';

class OnboardingProvider extends ChangeNotifier{
  Timer? timer;
  Timer? carouselTimer;

  int currentPage = 0;
  int currentCarouselPage = 0;
  
  void onScroll(PageController pageController) {
    timer?.cancel();

    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if(!pageController.hasClients) {
        return;
      }
      if (currentPage < onboardData.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    });
  }

  void onCarouselScroll(CarouselController carouselController, int itemCount) {
    carouselTimer?.cancel();

    carouselTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      if(!carouselController.hasClients) {
        return;
      }
      if (currentCarouselPage < onboardData.length - 1) {
        currentCarouselPage++;
      } else {
        currentCarouselPage = 0;
      }

      carouselController.animateTo(
        currentCarouselPage as double,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    });
  }

  void onPageChange(int index) {
    currentPage = index;
    notifyListeners();
  }
  void onHomePageChange(int index, CarouselPageChangedReason reason) {
    currentCarouselPage = index;
    notifyListeners();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}