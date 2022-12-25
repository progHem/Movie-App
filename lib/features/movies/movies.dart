import 'package:flutter/material.dart';
import 'package:movie_app/core/extensions/extensions.dart';
import 'package:movie_app/core/theme/text_style.dart';
import 'package:movie_app/features/movies/movies_bulider_widget.dart';
import 'package:movie_app/features/movies/movies_types_widget.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';
import '../../services/api_services.dart';
import '../common_widgets/scaffold_background.dart';

class Movies extends StatelessWidget {
  const Movies({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBackground(
      child: Column(
        children: [
          SizedBox(height: context.h * 0.03),
          Text('What would you\nlike to watch?',
              style: headingStyle.copyWith(fontSize: 28.0),
              textAlign: TextAlign.center),
          SizedBox(height: context.h * 0.06),
          // const SearchField(),
          // SizedBox(height: context.h * 0.04),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: SizedBox(
              width: context.w,
              height: context.h * 0.68,
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Now playing',
                          style: subtitleStyle.copyWith(
                              fontWeight: FontWeight.w400, fontSize: 17.5)),
                      SizedBox(height: context.h * 0.04),
                      MovieBuilder(getFunc:getMovies('/3/movie/now_playing'))
                    ],
                  ),
                  SizedBox(height: context.h * 0.04),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Upcoming movies',
                          style: subtitleStyle.copyWith(
                              fontWeight: FontWeight.w400, fontSize: 17.5)),
                      SizedBox(height: context.h * 0.04),
                      MovieBuilder(getFunc: getMovies('/3/movie/upcoming'))
                    ],
                  ),
                  SizedBox(height: context.h * 0.04),
                  Text('Movies',
                      style: subtitleStyle.copyWith(
                          fontWeight: FontWeight.w400, fontSize: 17.5)),
                  SizedBox(height: context.h * 0.02),
                  const MoviesTypes(),
                  SizedBox(height: context.h * 0.04),
                  MovieBuilder(getFunc: getMovies('/3/discover/movie', params: {
                    'api_key': 'bf9baac7c63a927457be5ccfa15fd766',
                    'with_genres':'${context.watch<MovieProvider>().getId}'
                  }))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
