import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:movie_app/helper/route_helper.dart';
import 'package:movie_app/model/genre_model.dart';
import 'package:movie_app/model/movie_detail_model.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/pages/no_internet_page.dart';
import 'package:movie_app/repository/movie_repo.dart';

class MovieController extends GetxController {
  final MovieRepo movieRepo;

  MovieController({required this.movieRepo});

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  List<MovieModel> _movieList = [];
  List<MovieModel> get movieList => _movieList;

  Future<void> getMovieList(Function callback) async {
    Response response = await movieRepo.getMovieList();

    if (response.statusCode == 200) {
      _movieList = [];
      _movieList.addAll(Movie.fromJson(response.body).movieModel!);
      _isLoaded = true;
      callback(true);

      update();
    } else {
      callback(false);
    }
  }

  List<GenreModel> _genreList = [];
  List<GenreModel> get genreList => _genreList;

  Future<void> getGenreList(Function callback) async {
    Response response = await movieRepo.getGenreMovie();

    if (response.statusCode == 200) {
      _genreList.addAll(Genre.fromJson(response.body).genres!);
      callback(true);
      update();
    } else {
      callback(true);
    }
  }

  List _genre = [];
  List get genre => _genre;

  void getGenre(List<int> id) {
    List _genre = [];
    List<GenreModel> genreMovie = [];

    for (var i = 0; i < id.length; i++) {
      genreMovie.addAll(_genreList.where((genre) => genre.id == id[i]));
    }
  }

  late MovieDetail _movieDetail;
  MovieDetail get movieDetail => _movieDetail;

  Future<void> getMovieDetail(movie_id, Function callback) async {
    _isLoaded = false;
    Response response = await movieRepo.getMovieDetail(movie_id);

    if (response.statusCode == 200) {
      _movieDetail = MovieDetail.fromJson(response.body);
      _isLoaded = true;
      callback(true);
      update();
    } else {
      callback(false);
    }
  }
}
