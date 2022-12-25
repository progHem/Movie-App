
// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';

class FavoriteIcon extends StatelessWidget {
  final data;
  const FavoriteIcon({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final movies = Provider.of<MovieProvider>(context);
    final bool isClicked = movies.searchForFavorite(data['id']);
    return Positioned(
      right: 0,
      child: IconButton(
          icon: Icon(
            movies.searchForFavorite(data['id'])
                ? Icons.favorite
                : Icons.favorite_outline,
          ),
          onPressed: () {
            
            if (!isClicked) {
              movies.addFavorite(data);
            } else {
              movies.removeFavorite(data['id']);
            }

          },
          iconSize: 22.0,
          color: Colors.redAccent),
    );
  }
}
