import 'package:prova_flutter/app/repositories/item/item_repositorie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IitemRepositorie extends ItemRepositorie {
  @override
  Future<void> criarItem({required String item}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var lista = prefs.getStringList("lista");
    if (lista != null) {
      lista.add(item);
      await prefs.setStringList("lista", lista);
    } else {
      await prefs.setStringList("lista", [item]);
    }
  }

  @override
  Future<void> editarItem({required String item, required int index}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var lista = prefs.getStringList("lista");
    lista![index] = item;
    await prefs.setStringList("lista", lista);
    lista = prefs.getStringList("lista");
  }

  @override
  Future<void> excluirItem({required int index}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var lista = prefs.getStringList("lista");
    lista!.removeAt(index);
    await prefs.setStringList("lista", lista);
  }

  @override
  Future<List<String>> getAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var lista = prefs.getStringList("lista");
    if (lista == null) {
      return [];
    }
    return lista;
  }
}
