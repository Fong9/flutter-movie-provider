import 'package:flutter/material.dart';
import 'package:m_booking/app/exception/status.dart';
import 'package:m_booking/models/movie_model.dart';
import 'package:m_booking/repositories/movie_repo.dart';

class MovieProvider extends ChangeNotifier {
  final MovieRepository movieRepository;

  MovieProvider({required this.movieRepository});

  List<MovieModel> nowPlaying = [];
  List<MovieModel> commingSoon = [];

  Status status = Status.loading;

  Future<void> fetchMovie() async {
    try {
      status = Status.loading;
      notifyListeners();

      await Future.delayed(const Duration(seconds: 2));

      nowPlaying = await movieRepository.getNowPlaying();
      commingSoon = await movieRepository.getCommingSoon();
      notifyListeners();
      
    } catch (e) {
      debugPrint('$e');
      status = Status.error;
    } finally {
      notifyListeners();
    }
  }
}
