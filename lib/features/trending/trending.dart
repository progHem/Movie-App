import 'package:flutter/material.dart';
import 'package:movie_app/core/contstants/assets.dart';
import 'package:movie_app/core/extensions/extensions.dart';
import 'package:movie_app/features/trending/trend_bulider.dart';
import 'package:movie_app/services/api_services.dart';

import '../../core/theme/text_style.dart';
import '../common_widgets/scaffold_background.dart';

class Trending extends StatelessWidget {
  const Trending({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBackground(
      child: Column(
        children: [
          SizedBox(height: context.h * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Trending',
                  style: headingStyle.copyWith(fontSize: 28.0),
                  textAlign: TextAlign.center),
              Image.asset(Assets.animatedFire)
            ],
          ),
          SizedBox(height: context.h * 0.04),
          TrendBuilder(getFunc: getMovies('/3/trending/all/day'))
        ],
      ),
    );
  }
}
