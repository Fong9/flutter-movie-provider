import 'package:flutter/material.dart';
import 'package:m_booking/app/constants/color_app.dart';
import 'package:m_booking/app/constants/image_app.dart';
import 'package:m_booking/app/modules/navigations/home/widgets/carousel_slide.dart';
import 'package:m_booking/app/modules/navigations/home/widgets/comming_soon.dart';
import 'package:m_booking/app/modules/navigations/home/widgets/hall_service.dart';
import 'package:m_booking/app/modules/navigations/home/widgets/home_pin_header.dart';
import 'package:m_booking/app/modules/navigations/home/widgets/movie_news.dart';
import 'package:m_booking/app/widget/app_textfield.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Hi, Angelina 👋', style: TextStyle(color: Colors.white)),
                          const Text(
                            'Welcome back',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                      const Icon(Icons.notifications, color: Colors.white),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: PinnedHomeHeaderDelegate(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: Column(
                      spacing: 16,
                      children: [
                        const AppTextfield(),
                        _rowSeeMore('Now playing'),
                        CarouselSlide(),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    Column(
                      spacing: 16,
                      children: [
                        _rowSeeMore('Coming soon'),
                        CommingSoon(),
                      ],
                    ),

                    const SizedBox(height: 24),

                    Column(
                      spacing: 16,
                      children: [
                        _rowSeeMore('Promo & Discount'), 
                        Image.asset(AppImage.promotion)
                      ],
                    ),

                    const SizedBox(height: 24),

                    Column(
                      spacing: 16,
                      children: [
                        _rowSeeMore('Service'),
                        HallService(),
                      ],
                    ),

                    Column(
                      spacing: 16,
                      children: [
                        _rowSeeMore('Movie News'),
                        MovieNews(),
                      ],
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rowSeeMore(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Row(
          spacing: 3,
          children: [
            GestureDetector(
              onTap: () {},
              child: const Text('See all', style: TextStyle(color: AppColor.primary, fontSize: 14)),
            ),
            const Icon(Icons.arrow_forward_ios, color: AppColor.primary, size: 14),
          ],
        ),
      ],
    );
  }
}