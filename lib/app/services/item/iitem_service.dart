import 'package:prova_flutter/app/repositories/item/item_repositorie.dart';
import 'package:prova_flutter/app/services/item/item_service.dart';

class IitemService extends ItemService {
  final ItemRepositorie _itemRepositorie;

  IitemService({
    required ItemRepositorie itemRepositorie,
  }) : _itemRepositorie = itemRepositorie;

  @override
  Future<void> criarItem({required String item}) async {
    await _itemRepositorie.criarItem(item: item);
  }

  @override
  Future<void> editarItem({required String item, required int index}) async {
    await _itemRepositorie.editarItem(item: item, index: index);
  }

  @override
  Future<void> excluirItem({required int index}) async {
    await _itemRepositorie.excluirItem(index: index);
  }

  @override
  Future<List<String>> getAll() async {
    return _itemRepositorie.getAll();
  }
}
