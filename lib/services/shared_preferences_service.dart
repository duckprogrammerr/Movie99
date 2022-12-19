import 'package:movie99/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  Future<void> setIntro() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(Constants.introK, true);
  }

  Future<bool> getIntro() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(Constants.introK) ?? false;
  }

  Future<void> setFavoriteList(List<String> favorite) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList(Constants.favoriteK, favorite);
  }

  Future<List<String>?> getFavoriteList() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList(Constants.favoriteK);
  }
  // get favorite list

}
