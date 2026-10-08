import 'package:flutter/material.dart';
import 'package:m_booking/data/movie_news.dart';

class MovieNews extends StatelessWidget {
  const MovieNews({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: .horizontal,
        separatorBuilder: (_, _) => SizedBox(width: 16),
        itemCount: movieNews.length,
        itemBuilder: (context, index) {
          final data = movieNews[index];
          return Column(
            spacing: 8,
            crossAxisAlignment: .start,
            children: [
              ClipRRect(
                borderRadius: .circular(10),
                child: Image.asset('${data['img']}', width: 250),
              ),
              SizedBox(
                width: 250,
                child: Text(
                  data['about'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
