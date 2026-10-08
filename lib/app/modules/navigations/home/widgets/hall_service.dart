import 'package:flutter/material.dart';
import 'package:m_booking/app/constants/image_app.dart';

class HallService extends StatelessWidget {
  const HallService({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: hallItem.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final data = hallItem[index];
          return Column(
            spacing: 5,
            children: [
              data['img'],
              Text(data['hall'], style: TextStyle(color: Colors.white)),
            ],
          );
        },
      ),
    );
  }
}

final List<Map<String, dynamic>> hallItem = [
  {"img": Image.asset(AppImage.imax, scale: 2), "hall": 'Imax'},
  {
    "img": ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Image.asset(AppImage.screenx, width: 80, height: 80),
    ),
    "hall": 'ScreenX',
  },
  {"img": Image.asset(AppImage.retal, scale: 2), "hall": 'Retal'},
  {"img": Image.asset(AppImage.dx, scale: 2), "hall": '4DX'},
  {"img": Image.asset(AppImage.sweetbox, scale: 2), "hall": 'Sweetbox'},
];