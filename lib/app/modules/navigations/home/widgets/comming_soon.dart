import 'package:flutter/material.dart';
import 'package:m_booking/app/constants/color_app.dart';
import 'package:m_booking/app/exception/status.dart';
import 'package:m_booking/app/modules/navigations/home/providers/movie_provider.dart';
import 'package:m_booking/app/routes/route.dart';
import 'package:provider/provider.dart';

class CommingSoon extends StatelessWidget {
  const CommingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MovieProvider>();

    return SizedBox(
      height: 280,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: provider.commingSoon.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          if (provider.status == Status.error) {
            return const Center(
              child: Text('Failed to load movies', style: TextStyle(color: Colors.white)),
            );
          }
          final data = provider.commingSoon[index];
          return SizedBox(
            width: 140,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.homeDetail, arguments: data);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      data.image,
                      height: 180,
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    data.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: AppColor.primary, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.movie, color: Colors.white, size: 16),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          data.genre,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, color: Colors.white, size: 16),
                      const SizedBox(width: 4),
                      Text(data.timestamp, style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
