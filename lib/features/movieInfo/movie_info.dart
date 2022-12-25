// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/core/extensions/extensions.dart';
import 'package:movie_app/core/theme/text_style.dart';
import 'package:movie_app/core/theme/theme_colors.dart';
import 'package:movie_app/services/api_services.dart';

import '../../core/contstants/assets.dart';
import '../components/masked_image.dart';

class MovieInfo extends StatefulWidget {
  final data;
  const MovieInfo({super.key, required this.data});

  @override
  State<MovieInfo> createState() => _MovieInfoState();
}

class _MovieInfoState extends State<MovieInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Color(0xFF19191B),
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  height: context.h * 0.5,
                  width: context.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500${widget.data["poster_path"]}'),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: context.h * 0.05,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: IconButton(
                      icon: const Icon(Icons.arrow_circle_left_outlined),
                      color: whiteColor,
                      iconSize: 50.0,
                      onPressed: (() {
                        Navigator.pop(context);
                      })),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: context.h * 0.5,
                  transform: Matrix4.translationValues(0, -context.h * 0.05, 0),
                  child: ListView(
                    children: [
                      SizedBox(
                        width: context.w * 0.7,
                        child: Column(children: [
                          Text('${widget.data["original_title"]}',
                              textAlign: TextAlign.center, style: headingStyle),
                          SizedBox(
                            height: context.h <= 667 ? 5 : 10,
                          ),
                          Text(
                              '${widget.data["release_date"]}        ${widget.data["vote_count"]} reviews         ${widget.data['vote_average']} ',
                              textAlign: TextAlign.center,
                              style: subtitleStyle.copyWith(fontSize: 13.0)),
                          const SizedBox(
                            height: 15,
                          ),
                          RatingBar.builder(
                            itemSize: 14,
                            initialRating:
                                (widget.data['vote_average'].round() /
                                        10 *
                                        100) *
                                    5 /
                                    100,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 1),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber.shade400,
                            ),
                            onRatingUpdate: (rating) {
                              debugPrint(rating.toString());
                            },
                            unratedColor: whiteColor,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 60.0),
                            child: Text(
                              '${widget.data["overview"]}',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              maxLines: context.h <= 667 ? 2 : 4,
                              style: subtitleStyle.copyWith(fontSize: 14.0),
                            ),
                          ),
                          SizedBox(
                            height: context.h * 0.01,
                          ),
                          Container(
                            height: 2,
                            width: context.w * 0.8,
                            color: whiteColor.withOpacity(0.15),
                          ),
                          SizedBox(
                            height: context.h * 0.03,
                          ),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 23.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text('Casts',
                                    style:
                                        headingStyle.copyWith(fontSize: 20.0)),
                              ],
                            ),
                            SizedBox(
                              height: context.h <= 667 ? 10 : 18,
                            ),
                            SizedBox(
                              height: 80,
                              child: FutureBuilder(
                                  future: getMovies(
                                      '/3/movie/${widget.data['id']}}/credits'),
                                  builder: (context, AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      return ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: snapshot.data['cast'].length,
                                        itemBuilder: (context, index) {
                                          return SizedBox(
                                            width: 180,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor: greenColor,
                                                  minRadius: 16.0,
                                                  maxRadius: context.w <= 375
                                                      ? 24
                                                      : 30,
                                                  backgroundImage: NetworkImage(
                                                      'https://image.tmdb.org/t/p/w500${snapshot.data["cast"][index]["profile_path"]}'),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    constraints:
                                                        const BoxConstraints(
                                                      maxHeight: 50,
                                                      maxWidth: 112,
                                                    ),
                                                    transform: Matrix4
                                                        .translationValues(
                                                            -10, 0, 0),
                                                    child: Stack(
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        const MaskedImage(
                                                          asset:
                                                              Assets.castMask,
                                                          mask: Assets.castMask,
                                                          local: true,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            left: 16.0,
                                                          ),
                                                          child: Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              '${snapshot.data["cast"][index]["original_name"]}',
                                                              style: subtitleStyle
                                                                  .copyWith(
                                                                      fontSize:
                                                                          13.0),
                                                              maxLines: 2,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }
                                    return const Center(
                                      child: CircularProgressIndicator(
                                        color: cyanColor,
                                      ),
                                    );
                                  }),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
