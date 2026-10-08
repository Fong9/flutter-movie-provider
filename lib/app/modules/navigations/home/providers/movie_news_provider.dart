import 'package:flutter/material.dart';
import 'package:m_booking/app/exception/status.dart';
import 'package:m_booking/models/movie_news_model.dart';
import 'package:m_booking/repositories/movie_news_repo.dart';

class MovieNewsProvider extends ChangeNotifier{
  final MovieNewsRepo movieNewsRepository;

  MovieNewsProvider({required this.movieNewsRepository});
  
  List<MovieNewsModel> movieNews = [];

  Status status = Status.loading;

  Future<void> fetchMovieNews() async {
    try{
      status = Status.loading;
      notifyListeners();

      movieNews = await movieNewsRepository.getMovieNews();
    }catch(e) {
      debugPrint('$e');
      status = Status.error;
    }finally{
      notifyListeners();
    }
  }
}