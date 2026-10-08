import 'package:m_booking/data/movie_news.dart';
import 'package:m_booking/models/movie_news_model.dart';

class MovieNewsRepo {
  Future<List<MovieNewsModel>> getMovieNews() async {
    return movieNews.map((json) => MovieNewsModel.fromJson(json)).toList();
  }
}