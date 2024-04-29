import 'package:clean_arc_project/presentation/resources/language_manger.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefsLangKey = 'prefsLangKey';

class AppPrefs {
  AppPrefs(
    this._sharedPreferences,
  );

  final SharedPreferences _sharedPreferences;

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(prefsLangKey);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.english.getValue();
    }
  }
}