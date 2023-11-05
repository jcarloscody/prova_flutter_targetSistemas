// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeController, Store {
  late final _$listViewAtom =
      Atom(name: '_HomeController.listView', context: context);

  @override
  List<String> get listView {
    _$listViewAtom.reportRead();
    return super.listView;
  }

  @override
  set listView(List<String> value) {
    _$listViewAtom.reportWrite(value, super.listView, () {
      super.listView = value;
    });
  }

  late final _$indexAtom =
      Atom(name: '_HomeController.index', context: context);

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$getAllAsyncAction =
      AsyncAction('_HomeController.getAll', context: context);

  @override
  Future<void> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  late final _$editeItemStatusAsyncAction =
      AsyncAction('_HomeController.editeItemStatus', context: context);

  @override
  Future<void> editeItemStatus({required int index}) {
    return _$editeItemStatusAsyncAction
        .run(() => super.editeItemStatus(index: index));
  }

  late final _$editeItemAsyncAction =
      AsyncAction('_HomeController.editeItem', context: context);

  @override
  Future<void> editeItem({required int index, required String item}) {
    return _$editeItemAsyncAction
        .run(() => super.editeItem(index: index, item: item));
  }

  late final _$_HomeControllerActionController =
      ActionController(name: '_HomeController', context: context);

  @override
  void unEditeItemStatus() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.unEditeItemStatus');
    try {
      return super.unEditeItemStatus();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listView: ${listView},
index: ${index}
    ''';
  }
}
