import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:prova_flutter/app/services/item/item_service.dart';
import 'package:url_launcher/url_launcher.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  @observable
  List<String> listView = [];

  @observable
  int index = -1;

  final ItemService _itemService;

  _HomeController({
    required ItemService itemService,
  }) : _itemService = itemService;

  @action
  Future<void> getAll() async {
    var lista = await _itemService.getAll();
    listView = lista;
  }

  Future<void> inserir({required String item}) async {
    await _itemService.criarItem(item: item);
    await getAll();
  }

  @action
  Future<void> editeItemStatus({required int index}) async {
    this.index = index;
  }

  @action
  void unEditeItemStatus() {
    index = -1;
  }

  @action
  Future<void> editeItem({required int index, required String item}) async {
    await _itemService.editarItem(item: item, index: index);
    await getAll();
  }

  void limparInput({required TextEditingController editingController}) {
    editingController.text = "";
  }

  Future<void> abrirAplicativo({required String urlParam}) async {
    var url = Uri.parse(urlParam);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  Future<void> excluir({required int index}) async {
    await _itemService.excluirItem(index: index);
    await getAll();
  }
}
