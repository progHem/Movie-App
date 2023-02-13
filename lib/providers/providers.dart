import 'package:flutter/widgets.dart';

class MovieProvider with ChangeNotifier {
  int genreId = 28;
  List favorites = [];

  updateId(newId) {
    genreId = newId;
    notifyListeners();
  }

  get getId {
    return genreId;
  }

  addFavorite(var movie) {
    if (!searchForFavorite(movie['id'])) {
      favorites.add(movie);
    }

    notifyListeners();
  }

  removeFavorite(int movieId) {
    favorites.removeWhere((e) => e["id"] == movieId);
    notifyListeners();
  }

  searchForFavorite(currentId) {
    if ((favorites.any((e) => e['id'] == currentId))) {
      return true;
    } else {
      return false;
    }
  }

  get favoritesList {
    return favorites;
  }
}