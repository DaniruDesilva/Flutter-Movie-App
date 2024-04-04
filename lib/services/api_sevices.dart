import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:movie_hub/models/actor_model.dart';
import 'package:movie_hub/models/movie_model.dart';

class ApiServices {
  final apiKey = 'api_key=779367828f1066fd727af8e85d1dddee';
  final popularMovies = 'https://api.themoviedb.org/3/movie/popular?';
  final nowplaying = 'https://api.themoviedb.org/3/movie/now_playing?';
  final topRatedMovies = 'https://api.themoviedb.org/3/movie/top_rated?';
  final upComingMovies = 'https://api.themoviedb.org/3/movie/upcoming?';
  final movieData = "https://api.themoviedb.org/3/movie/";
  final cast = "https://api.themoviedb.org/3/movie/";

  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final response = await http.get(Uri.parse('$popularMovies$apiKey'));
      if (response.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(response.body);
        List<dynamic> results = body['results'];
        List<MovieModel> movies = results
            .map((movie) => MovieModel.fromJson(movie as Map<String, dynamic>))
            .toList();
        return movies;
      } else {
        Logger().e('Error - ${response.statusCode}');
        return [];
      }
    } catch (e) {
      Logger().e(e);
      return [];
    }
  }

  Future<List<MovieModel>> getNowPlayingMovies() async {
    try {
      final response = await http.get(Uri.parse('$nowplaying$apiKey'));
      if (response.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(response.body);
        List<dynamic> results = body['results'];
        List<MovieModel> movies = results
            .map((movie) => MovieModel.fromJson(movie as Map<String, dynamic>))
            .toList();
        return movies;
      } else {
        Logger().e('Error - ${response.statusCode}');
        return [];
      }
    } catch (e) {
      Logger().e(e);
      return [];
    }
  }

  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse('$topRatedMovies$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> results = body['results'];
      List<MovieModel> movies = results
          .map((movie) => MovieModel.fromJson(movie as Map<String, dynamic>))
          .toList();
      return movies;
    } else {
      Logger().e('Error - ${response.statusCode}');
      return [];
    }
  }

  Future<List<MovieModel>> getUpComingMovies() async {
    final response = await http.get(Uri.parse('$upComingMovies$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> results = body['results'];
      List<MovieModel> movies = results
          .map((movie) => MovieModel.fromJson(movie as Map<String, dynamic>))
          .toList();
      return movies;
    } else {
      Logger().e('Error - ${response.statusCode}');
      return [];
    }
  }

  Future<MovieModel?> getMovieDetails(int id) async {
    final response = await http.get(Uri.parse('$movieData$id?$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      MovieModel movie = MovieModel.fromJson(body);
      Logger().e(body['tagline']);
      return movie;
    } else {
      Logger().e('Error -  ${response.statusCode}');
      return null;
    }
  }

  Future<List<ActorModel>> getCast(int id) async {
    final response = await http.get(Uri.parse('$cast$id/credits?$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> cast = body['cast'];
      List<ActorModel> actors = cast
          .map((actor) => ActorModel.fromJson(actor as Map<String, dynamic>))
          .toList();

      return actors;
    } else {
      Logger().e('error - ${response.statusCode}');
      return [];
    }
  }
}
