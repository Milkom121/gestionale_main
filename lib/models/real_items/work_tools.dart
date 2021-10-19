import 'package:gestionale_main/models/real_items/inventory_item.dart';

/// tutti quelli che possono essere gli attrezzi da lavoro, dagli shaker ai coltelli di chef

class WorkTool extends InventoryItem {
  String id;
  final String title;
  final String category; // TODO da eliminare
  final String imageReference;
  int actualAvailability;
  final String dealer;

  WorkTool(
      {required this.dealer,
      required this.id,
      required this.imageReference,
      required this.title,
      required this.category,
      required this.actualAvailability,
      }) : super(title, dealer , imageReference, actualAvailability)  ;

  static Map<String, dynamic> returnAWorkToolAsMap(WorkTool workTool) {
    return {
      'id': workTool.id,
      'title': workTool.title,
      'actualAvailability': workTool.actualAvailability,
      'imageReference': workTool.imageReference,
      'dealer': workTool.dealer
    };
  }

  static WorkTool returnAWorkToolFromMap(workToolMap) {
    return WorkTool(
      id: workToolMap['id'],
      imageReference: workToolMap['imageReference'],
      dealer: workToolMap['dealer'],
      title: workToolMap['title'],
      category: workToolMap['category'],
      actualAvailability: int.parse(workToolMap['actualAvailability']),
    );
  }
}
