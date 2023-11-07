import 'package:mobx/mobx.dart';
import 'package:mobxtest/services/app_store_service.dart';
part 'text_store.g.dart';

// ignore: library_private_types_in_public_api
class TextStore = _TextStore with _$TextStore;

abstract class _TextStore with Store {
  final _appStoreService = AppStoreService();

  _TextStore() {
    _texts.addAll(_appStoreService.getTexts());
  }

  void _saveTexts() => _appStoreService.setTexts(_texts);

  @observable
  // ignore: prefer_final_fields
  ObservableList<String> _texts = ObservableList<String>();

  @computed
  ObservableList<String> get texts => _texts;

  @action
  void add(String text) {
    _texts.add(text);

    _saveTexts();
  }

  @action
  void edit(int index, String newValue) {
    _texts[index] = newValue;

    _saveTexts();
  }

  @action
  void delete(int index) {
    _texts.removeAt(index);

    _saveTexts();
  }
}
