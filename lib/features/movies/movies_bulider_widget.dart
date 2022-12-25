import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/theme_colors.dart';
import 'package:movie_app/features/movies/single_movie_widget.dart';

import '../../core/contstants/assets.dart';

class MovieBuilder extends StatefulWidget {
  final Future getFunc;
  const MovieBuilder({super.key, required this.getFunc});

  @override
  State<MovieBuilder> createState() => _MovieBuilderState();
}

class _MovieBuilderState extends State<MovieBuilder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: FutureBuilder(
          future: widget.getFunc,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data['results'].length,
                itemBuilder: (context, index) {
                  String mask;
                  if (index == 0) {
                    mask = Assets.maskFirst;
                  } else if (index == 5 - 1) {
                    mask = Assets.maskLast;
                  } else {
                    mask = Assets.mask;
                  }
                  return SingleMovieWidget(data:snapshot.data['results'][index], mask: mask);
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: cyanColor,
              ),
            );
          }),
    );
  }
}

