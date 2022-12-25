import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/theme_colors.dart';
import 'package:movie_app/services/api_services.dart';
import 'package:provider/provider.dart';

import '../../core/theme/text_style.dart';
import '../../providers/providers.dart';
import '../common_widgets/custom_outline.dart';

class MoviesTypes extends StatelessWidget {
  const MoviesTypes({super.key});

  // int selectedId = 28;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 35.0,
        child: FutureBuilder(
            future: getMovies('/3/genre/movie/list'),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: snapshot.data['genres'].length,
                  itemBuilder: (context, index) {
                    return mType(
                        context,
                        snapshot.data['genres'][index]['name'],
                        snapshot.data['genres'][index]['id']);
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: cyanColor,
                ),
              );
            }));
  }

  Widget mType(BuildContext context, String type, int id) {
    final moviesProvider = Provider.of<MovieProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: GestureDetector(
        onTap: () {
          moviesProvider.updateId(id);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: moviesProvider.genreId == id
                ? pinkColor.withOpacity(0.25)
                : Colors.transparent,
          ),
          child: CustomOutline(
            strokeWidth: 2.0,
            radius: 20.0,
            padding: const EdgeInsets.all(4),
            width: 110,
            height: 30.0,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                pinkColor,
                pinkColor.withOpacity(0),
                greenColor,
                greenColor.withOpacity(0.1),
              ],
              stops: const [0.2, 0.4, 0.6, 1],
            ),
            child: Center(
                child: Text(
              type,
              overflow: TextOverflow.fade,
              maxLines: 1,
              style: subtitleStyle.copyWith(fontWeight: FontWeight.w700),
            )),
          ),
        ),
      ),
    );
  }
}
