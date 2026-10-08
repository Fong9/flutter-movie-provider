import 'package:m_booking/data/comming_soon_movie.dart';
import 'package:m_booking/data/now_playing.dart';
import 'package:m_booking/models/movie_model.dart';

class MovieRepository {
  Future<List<MovieModel>> getNowPlaying() async {
    return nowPlaying.map((json) => MovieModel.fromJson(json)).toList();
  }

  Future<List<MovieModel>> getCommingSoon() async {
    return commingSoon.map((json) => MovieModel.fromJson(json)).toList();
  }
}
