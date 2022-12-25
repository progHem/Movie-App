
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/extensions/extensions.dart';
import 'package:movie_app/features/favorites/favorites_builder.dart';
import 'package:provider/provider.dart';

import '../../core/theme/text_style.dart';
import '../../providers/providers.dart';
import '../common_widgets/scaffold_background.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    
    return ScaffoldBackground(
      child: Column(
        children: [
          SizedBox(height: context.h * 0.03),
          Text('Favorites',
              style: headingStyle.copyWith(fontSize: 28.0),
              textAlign: TextAlign.center),
          SizedBox(height: context.h * 0.04),
          context.watch<MovieProvider>().favoritesList.length > 0
              ? const FavoritesBuilder()
              : Center(
                  child: Text(
                  "You don't have any movies in your favorites list",
                  style: subtitleStyle,
                ))
          
        ],
      ),
    );
  }
}
