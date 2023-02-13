import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:movie_app/core/extensions/extensions.dart';
import 'package:movie_app/features/favorites/favorites.dart';
import 'package:movie_app/features/movies/movies.dart';
import 'package:movie_app/features/trending/trending.dart';

import '../../core/contstants/assets.dart';
import '../../core/theme/theme_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  int currentTab = 0;

  bool isSelected = false;

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children:  const <Widget>[
        Movies(),
        Trending(),
        Favorites(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      currentTab = index;
      isSelected = !isSelected;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      currentTab = index;
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: blackColor,
      body: buildPageView(),
      bottomNavigationBar: GlassmorphicContainer(
        width: context.w,
        height: context.h * 0.08,
        borderRadius: 0,
        linearGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            whiteColor.withOpacity(0.1),
            whiteColor.withOpacity(0.1),
          ],
        ),
        border: 0,
        blur: 30,
        borderGradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            pinkColor,
            greenColor,
          ],
        ),
        child: Center(
          child: BottomAppBar(
            color: Colors.transparent,
            notchMargin: 4,
            elevation: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: IconButton(
                    iconSize: 32.0,
                    icon: SvgPicture.asset(
                      Assets.movieIcon,
                      color: currentTab == 0
                          ? cyanColor.withOpacity(0.85)
                          : whiteColor.withOpacity(0.30),
                      width: 40.0,
                    ),
                    onPressed: () {
                      bottomTapped(0);
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    iconSize: 32.0,
                    icon: SvgPicture.asset(
                      Assets.trendIcon,
                      color: currentTab == 1
                          ? cyanColor.withOpacity(0.85)
                          : whiteColor.withOpacity(0.30),
                      width: 40.0,
                    ),
                    onPressed: () {
                      bottomTapped(1);
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    iconSize: 32.0,
                    icon: SvgPicture.asset(
                      Assets.favIcon,
                      color: currentTab == 2
                          ? cyanColor.withOpacity(0.85)
                          : whiteColor.withOpacity(0.30),
                      width: 26.0,
                    ),
                    onPressed: () {
                      bottomTapped(2);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
