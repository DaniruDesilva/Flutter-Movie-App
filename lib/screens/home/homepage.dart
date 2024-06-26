import 'package:flutter/material.dart';
import 'package:movie_hub/services/api_sevices.dart';

import 'widgets/custom_tool_bar.dart';
import 'widgets/movies_list_view.dart';
import 'widgets/popular_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomToolBar(),
                  const SizedBox(
                    height: 10,
                  ),
                  PopularSlider(size: size),
                  const SizedBox(
                    height: 10,
                  ),
                  MoviesListView(
                    title: "Now Playing",
                    future: ApiServices().getNowPlayingMovies(),
                  ),
                  MoviesListView(
                    title: "Top Rated Movies",
                    future: ApiServices().getTopRatedMovies(),
                  ),
                  MoviesListView(
                    title: "Up Coming Movies",
                    future: ApiServices().getUpComingMovies(),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
