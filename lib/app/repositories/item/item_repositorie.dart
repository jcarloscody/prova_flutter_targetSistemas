abstract class ItemRepositorie {
  Future<void> criarItem({required String item});
  Future<List<String>> getAll();
  Future<void> editarItem({required String item, required int index});
  Future<void> excluirItem({required int index});
}
