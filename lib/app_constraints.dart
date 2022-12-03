import 'package:flutter/material.dart';

class AppConstraints {
  static const String BASE_URL = "https://api.themoviedb.org/3/";
  static const String IMAGE_BASE_URL = "https://image.tmdb.org/t/p/";
  static const String API_KEY = "e98243705c2481d38f734b4ab62c6c59";

  static const String MOVIE_URL =
      "movie/now_playing?api_key=$API_KEY&language=en-US&page=1";
  static const String GENRE_URL =
      "genre/movie/list?api_key=$API_KEY&language=en-US";

  static const String USER_PHOTO = "storage/user-photo/";

  //Color
  static Color lightestColor = Color(0xffeff5f5);
  static Color lighterColor = Color(0xffd6e4e5);
  static Color darkerColor = Color(0xff090a0e);
  static Color darkestColor = Color(0xff090A0E);
  static Color loader = Colors.grey.withOpacity(.8);
  static Color button = Color(0xff9ca4ad);
  static Color textColorWhite = Color(0xffeceded);

  static String about1 =
      "I am a fresh graduate from Universitas Negeri Malang. I am majoring in English Language Education with a GPA of 3.65. I am very interested in technology, especially in software development. I am a self-taught software developer. I developed a grocery app using Flutter Framework as my first app, and  I used Laravel as the back end. I am looking for a job as an entry-level flutter developer. I believe that my skills will help the company.";

  static String about2 =
      "Anyway, about the movie, I like action and science fiction movies.";
}
