import 'package:gestionale_main/data/inventory.dart';
import 'package:provider/provider.dart';

class InventoryJson {

  Map<String, Map<String, String>> allItemsMap = {};

  void updateInventoryJson(Map<String, Map<String, String>> updatedMap) {
    allItemsMap = updatedMap;
  }
}
