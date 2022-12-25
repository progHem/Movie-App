import 'package:flutter/material.dart';
import 'package:movie_app/core/extensions/extensions.dart';
import 'package:movie_app/core/theme/text_style.dart';
import 'package:movie_app/core/theme/theme_colors.dart';
import 'package:movie_app/features/home/home_page.dart';

import '../../core/contstants/assets.dart';
import '../common_widgets/custom_outline.dart';
import '../components/ellipse.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    _animationController!.repeat(reverse: true);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController!)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SizedBox(
        width: context.w,
        height: context.h,
        child: Stack(
          children: [
            Positioned(
                top: context.h * 0.1,
                left: -88,
                child: const Ellipse(
                    color: pinkColor, width: 200.0, height: 166.0)),
            Positioned(
                top: context.h * 0.3,
                right: -100,
                child: const Ellipse(
                    color: greenColor, width: 200.0, height: 200.0)),
            SafeArea(
              child: SizedBox(
                width: context.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: context.h * 0.07,
                    ),
                    CustomOutline(
                      strokeWidth: 4,
                      radius: context.w * 0.8,
                      padding: const EdgeInsets.all(4),
                      width: context.w * 0.8,
                      height: context.w * 0.8,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          pinkColor,
                          pinkColor.withOpacity(0),
                          greenColor,
                          greenColor.withOpacity(0.1),
                        ],
                        // stops: const [0.2, 0.4, 0.6, 1],
                        stops: [
                          _animation?.value - 0.5,
                          _animation?.value,
                          _animation?.value + 0.5,
                          _animation?.value - 0.5
                        ],
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            alignment: Alignment.bottomLeft,
                            image: AssetImage(Assets.introPhoto),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: context.h * 0.07),
                    Text('Watch movies in\nVirtual Reality',
                        textAlign: TextAlign.center, style: headingStyle),
                    SizedBox(height: context.h * 0.04),
                    Text('Download and watch offline\nwherever you are',
                        textAlign: TextAlign.center, style: subtitleStyle),
                    SizedBox(height: context.h * 0.04),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      },
                      child: CustomOutline(
                        strokeWidth: 2.0,
                        radius: 20.0,
                        padding: const EdgeInsets.all(4),
                        width: 130.0,
                        height: 35.0,
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
                          'Start',
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          style: subtitleStyle.copyWith(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
