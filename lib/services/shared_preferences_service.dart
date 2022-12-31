import 'package:movie99/core/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  Future<void> setWalkThrough() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(AppConstants.walkThroughK, true);
  }

  Future<bool> getWalkThrough() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(AppConstants.walkThroughK) ?? false;
  }

  Future<void> setFavoriteList(List<String> movies) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setStringList(AppConstants.favoriteK, movies);
  }

  Future<List<String>> getFavoriteList() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList(AppConstants.favoriteK) ?? [];
  }
  // get favorite list

}
