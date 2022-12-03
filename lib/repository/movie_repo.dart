import 'package:get/get.dart';
import 'package:movie_app/app_constraints.dart';
import 'package:movie_app/data/api/api_client.dart';

class MovieRepo {
  final ApiClient apiClient;

  MovieRepo({required this.apiClient});

  Future<Response> getMovieList() async {
    return await apiClient.getData(AppConstraints.MOVIE_URL);
  }

   Future<Response> getGenreMovie() async {
    return await apiClient.getData(AppConstraints.GENRE_URL);
  }
  
  Future<Response> getMovieDetail(int movie_id) async {
    return await apiClient.getData("/movie/$movie_id?api_key=e98243705c2481d38f734b4ab62c6c59&language=en-US");
  }

  
}
