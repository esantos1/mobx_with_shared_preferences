import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStoreService {
  final _keyTexts = 'texts';

  static late SharedPreferences _sharedPreferences;

  static Future<void> init() async =>
      _sharedPreferences = await SharedPreferences.getInstance();

  ObservableList<String> getTexts() {
    final textsStorage =
        _sharedPreferences.getStringList(_keyTexts)?.toList() ?? [];

    return ObservableList<String>.of(textsStorage);
  }

  void setTexts(ObservableList<String> texts) async =>
      await _sharedPreferences.setStringList(_keyTexts, texts.toList());
}
