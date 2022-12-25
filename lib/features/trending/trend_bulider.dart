import 'package:flutter/material.dart';
import 'package:movie_app/core/extensions/extensions.dart';
import 'package:movie_app/core/theme/theme_colors.dart';
import 'package:movie_app/features/components/favorite_icon.dart';

class TrendBuilder extends StatefulWidget {
  final Future getFunc;
  const TrendBuilder({super.key, required this.getFunc});

  @override
  State<TrendBuilder> createState() => _TrendBuilderState();
}

class _TrendBuilderState extends State<TrendBuilder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: context.h * 0.69,
        child: FutureBuilder(
            future: widget.getFunc,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data['results'].length,
                  itemBuilder: (context, index) {
                    return trendItem(context, snapshot.data['results'][index]);
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
    );
  }

  Widget trendItem(BuildContext context, dynamic item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: GestureDetector(
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500${item['backdrop_path']}",
                  height: 200,
                  width: context.w,
                  fit: BoxFit.cover,
                )),
            FavoriteIcon(data: item)
          ],
        ),
      ),
    );
  }
}
