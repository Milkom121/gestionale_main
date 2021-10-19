import 'package:gestionale_main/models/real_items/inventory_item.dart';

/// uqi andiamo a definire gli strumenti di servizio, dagli attrezzi ai materiali da costruzione

class ServiceTool extends InventoryItem {
  String id;
  final String title;
  final String variety; // da eliminare
  int actualAvailability;
  final String imageReference;
  final String dealer;

  ServiceTool({
    required this.id,
    required this.imageReference,
    required this.title,
    required this.variety,
    required this.actualAvailability,
    required this.dealer
  }) : super(title, dealer , imageReference, actualAvailability);

  static Map<String, dynamic> returnAServiceToolAsMap(ServiceTool serviceTool) {
    return {
      'id': serviceTool.id,
      'title': serviceTool.title,
      'actualAvailability': serviceTool.actualAvailability,
      'imageReference': serviceTool.imageReference,
      'dealer': serviceTool.dealer
    };
  }

  static ServiceTool returnAServiceToolFromMap(serviceToolMap) {
    return ServiceTool(
      id: serviceToolMap['id'],
      imageReference: serviceToolMap['imageReference'],
      title: serviceToolMap['title'],
      dealer: serviceToolMap['dealer'],

      variety: serviceToolMap['variety'],
      actualAvailability: int.parse(serviceToolMap['actualAvailability']),
    );
  }
}
