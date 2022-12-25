import 'package:flutter/material.dart';
import 'package:movie_app/core/extensions/extensions.dart';
import 'package:movie_app/features/components/favorite_icon.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';

class FavoritesBuilder extends StatelessWidget {
  const FavoritesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = Provider.of<MovieProvider>(context, listen: false);
    return Container(
      height: context.h * 0.69,
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
            childAspectRatio: 3 / 3.2),
        itemCount: movies.favoritesList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${movies.favoritesList[index]['backdrop_path']}',
                      height: 200,
                      width: context.w,
                      fit: BoxFit.cover,
                    )),
                FavoriteIcon(data: movies.favoritesList[index])
              ],
            ),
          );
        },
      ),
    );
  }
}
