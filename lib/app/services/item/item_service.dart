abstract class ItemService {
  Future<void> criarItem({required String item});
  Future<void> editarItem({required String item, required int index});
  Future<void> excluirItem({required int index});
  Future<List<String>> getAll();
}
