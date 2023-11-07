// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TextStore on _TextStore, Store {
  Computed<ObservableList<String>>? _$textsComputed;

  @override
  ObservableList<String> get texts =>
      (_$textsComputed ??= Computed<ObservableList<String>>(() => super.texts,
              name: '_TextStore.texts'))
          .value;

  late final _$_textsAtom = Atom(name: '_TextStore._texts', context: context);

  @override
  ObservableList<String> get _texts {
    _$_textsAtom.reportRead();
    return super._texts;
  }

  @override
  set _texts(ObservableList<String> value) {
    _$_textsAtom.reportWrite(value, super._texts, () {
      super._texts = value;
    });
  }

  late final _$_TextStoreActionController =
      ActionController(name: '_TextStore', context: context);

  @override
  void add(String text) {
    final _$actionInfo =
        _$_TextStoreActionController.startAction(name: '_TextStore.add');
    try {
      return super.add(text);
    } finally {
      _$_TextStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void edit(int index, String newValue) {
    final _$actionInfo =
        _$_TextStoreActionController.startAction(name: '_TextStore.edit');
    try {
      return super.edit(index, newValue);
    } finally {
      _$_TextStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void delete(int index) {
    final _$actionInfo =
        _$_TextStoreActionController.startAction(name: '_TextStore.delete');
    try {
      return super.delete(index);
    } finally {
      _$_TextStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
texts: ${texts}
    ''';
  }
}
