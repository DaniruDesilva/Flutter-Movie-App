import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/screens/movie_view/movie_view.dart';
import 'package:shimmer/shimmer.dart';

import '../../../models/movie_model.dart';
import '../../../services/api_sevices.dart';

class PopularSlider extends StatelessWidget {
  const PopularSlider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiServices().getPopularMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Shimmer.fromColors(
                baseColor: Colors.grey.shade900,
                highlightColor: Colors.grey.shade800,
                child: Container(
                  width: size.width * 0.95,
                  height: size.height * 0.22,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20)),
                ));
          }
          if (snapshot.hasError) {
            return const Text(
              "Something went wrong",
              style: TextStyle(color: Colors.white),
            );
          }
          List<MovieModel>? movies = snapshot.data;
          return CarouselSlider(
            options: CarouselOptions(
              height: size.height * 0.22,
              autoPlay: true,
            ),
            items: movies!.map((movie) {
              return Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MovieView(
                                      movie: movie,
                                    )));
                      },
                      child: Container(
                        width: size.width,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(movie.backdropPath))),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 3,
                              left: 3,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  movie.title,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 3,
                              right: 3,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                    color: Colors.green.shade800,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    Text(
                                      movie.voteAverage
                                          .toString()
                                          .substring(0, 3),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow.shade600,
                                      size: 12,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        });
  }
}
