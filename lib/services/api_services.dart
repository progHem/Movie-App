import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String _baseUrl = 'api.themoviedb.org';

Future getMovies(String path, {Map<String, dynamic> params = const {'api_key': 'bf9baac7c63a927457be5ccfa15fd766'}}) async {
  final uri = Uri(
      scheme: 'https',
      host: _baseUrl,
      path: path,
      queryParameters: params);
  try {
    final resposne = await http.get(uri);
    if (resposne.statusCode == 200 || resposne.statusCode == 201) {
      final data = json.decode(resposne.body);
      final result = Map<String, dynamic>.from(data);
      return result;
    }
  } catch (e) {
    debugPrint('getMovies');
    debugPrint(e.toString());
  }
  return [];
}
