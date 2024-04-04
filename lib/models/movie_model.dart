import 'package:movie_hub/models/company_model.dart';

class MovieModel {
  String title;
  String overview;
  String backdropPath;
  String posterPath;
  double voteAverage;
  int id;
  bool isadult;
  String releaseDate;
  String? tagline;
  List<CompanyModel>? companies;

  MovieModel({
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.posterPath,
    required this.voteAverage,
    required this.id,
    required this.isadult,
    required this.releaseDate,
    this.tagline,
    this.companies,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    List<CompanyModel>? companies = json['production_companies'] != null
        ? (json['production_companies'] as List<dynamic>)
            .map((company) =>
                CompanyModel.fromJson(company as Map<String, dynamic>))
            .toList()
        : null;

    return MovieModel(
      title: json['title'],
      overview: json['overview'],
      backdropPath: "https://image.tmdb.org/t/p/w500${json['backdrop_path']}",
      posterPath: "https://image.tmdb.org/t/p/w500${json['poster_path']}",
      voteAverage: json['vote_average'],
      id: json['id'],
      isadult: json['adult'],
      releaseDate: json['release_date'],
      tagline: json['tagline'],
      companies: companies,
    );
  }
}
