import 'package:flutter/material.dart';
import 'package:movie_app/features/intro/intro.dart';
import 'package:movie_app/providers/providers.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Open sans',
          ),
          home: const IntroPage()),
    );
  }
}
