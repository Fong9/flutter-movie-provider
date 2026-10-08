import 'package:flutter/material.dart';
import 'package:m_booking/app/constants/color_app.dart';
import 'package:m_booking/app/constants/icon_app.dart';
import 'package:m_booking/app/modules/navigations/home/screens/home_screen.dart';
import 'package:m_booking/app/modules/navigations/navbar/navbar_provider.dart';
import 'package:provider/provider.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NavbarProvider>();

    List<Widget> screen = [HomeScreen()];

    return Scaffold(
      body: IndexedStack(index: provider.currentIndex, children: screen),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: Colors.black),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _navbarColIndex(context, 0, AppIcon.home, 'Home'),
              _navbarColIndex(context, 1, AppIcon.ticket, 'Ticket'),
              _navbarColIndex(context, 2, AppIcon.movie, 'Movie'),
              _navbarColIndex(context, 3, AppIcon.profile, 'Profile'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navbarColIndex(BuildContext context, int index, String icon, String text) {
    final provider = context.watch<NavbarProvider>();
    final bool isSelected = provider.currentIndex == index;

    return GestureDetector(
      onTap: () {
        provider.changeScreen(index);
      },
      child: Column(
        spacing: 5,
        children: [
          Image.asset(icon, scale: 2.5, color: isSelected ? AppColor.primary : Colors.white),
          Text(
            text,
            style: TextStyle(color: isSelected ? AppColor.primary : Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
