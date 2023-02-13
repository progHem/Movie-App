import 'package:shared_preferences/shared_preferences.dart';

saveFavoritesList() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  List<String> savedList = [];

  await prefs.setStringList('favorites', savedList);
}

appendToPref(item) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  final savedList = prefs.getStringList('favorites');
  savedList?.add(item);
  await prefs.setStringList('favorites', savedList!);
}
removeItemFromPref(item) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  final savedList = prefs.getStringList('favorites');
  savedList?.remove(item);
  await prefs.setStringList('favorites', savedList!);
}

// getSavedFavoritesList() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();

//   final savedList = prefs.getStringList('favorites');
//   // return savedList;
//   print('${savedList?.length}');
// }
removeFromPref(key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove(key);
}
