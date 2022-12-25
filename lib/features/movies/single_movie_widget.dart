// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:movie_app/features/components/favorite_icon.dart';
import '../components/masked_image.dart';
import '../movieInfo/movie_info.dart';

class SingleMovieWidget extends StatefulWidget {
  final data;
  final mask;
  const SingleMovieWidget({super.key, required this.data, required this.mask});

  @override
  State<SingleMovieWidget> createState() => _SingleMovieWidgetState();
}

class _SingleMovieWidgetState extends State<SingleMovieWidget> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MovieInfo(data: widget.data)),
        );
      }),
      child: Stack(
        children: [
          SizedBox(
            height: 160,
            width: 143,
            child: MaskedImage(
                asset:
                    'https://image.tmdb.org/t/p/w500${widget.data['backdrop_path']}',
                mask: widget.mask),
          ),
          FavoriteIcon(data: widget.data)
        ],
      ),
    );
  }
}
