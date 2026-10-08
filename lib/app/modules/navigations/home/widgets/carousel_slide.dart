import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:m_booking/app/constants/color_app.dart';
import 'package:m_booking/app/constants/image_app.dart';
import 'package:m_booking/app/on-boarding/onboarding_provider.dart';
import 'package:provider/provider.dart';

class CarouselSlide extends StatefulWidget {
  const CarouselSlide({super.key});

  @override
  State<CarouselSlide> createState() => _CarouselSlideState();
}

class _CarouselSlideState extends State<CarouselSlide> {
    final carouselController = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        SizedBox(
          height: 180,
          child: CarouselSlider(
            items: slideItems,
            carouselController: carouselController,
            options: CarouselOptions(
              height: 400,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              onPageChanged: (index, reason) {
                context.read<OnboardingProvider>().onHomePageChange(index, reason);
              },
            ),
          ),
        ),
        _indicator(context, carouselController),
      ],
    );
  }

  Widget _indicator(BuildContext context, CarouselSliderController carouselController) {
    final provider = context.watch<OnboardingProvider>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 5,
      children: List.generate(slideItems.length, (index) {
        return GestureDetector(
          onTap: () {
            carouselController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: provider.currentCarouselPage == index ? 16 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: provider.currentCarouselPage == index ? AppColor.primary : Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }),
    );
  }
}

final List<Widget> slideItems = [
  ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset(AppImage.slide1)),
  ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset(AppImage.slide2)),
  ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset(AppImage.slide3)),
];