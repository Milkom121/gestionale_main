import 'package:flutter/material.dart';
import 'package:gestionale_main/back_end/database/inventory_json.dart';
import 'package:gestionale_main/models/real_items/disposable.dart';
import 'package:gestionale_main/models/real_items/ingredient.dart';
import 'package:gestionale_main/models/real_items/reselling_product.dart';
import 'package:gestionale_main/models/real_items/servicies_tools.dart';
import 'package:gestionale_main/models/real_items/work_tools.dart';
import 'package:gestionale_main/screens/inventory/items_screens/disposable_item_screens/disposable_detail_screen.dart';
import 'package:gestionale_main/screens/inventory/items_screens/ingredient_item_screens/ingredients_detail_screen.dart';
import 'package:gestionale_main/screens/inventory/items_screens/reselling_product_item_screen/reselling_product_detail_screen.dart';
import 'package:gestionale_main/screens/inventory/items_screens/service_tool_item_screens/service_tool_detail_screen.dart';
import 'package:gestionale_main/screens/inventory/items_screens/work_tool_item_screen/work_tool_detail_screen.dart';
import 'package:gestionale_main/data/inventory.dart';
import 'package:provider/provider.dart';

class WarehouseItemTile extends StatelessWidget {
  WarehouseItemTile({
    required this.inventoryObject,
    required this.imageReference,
    required this.title,
    required this.sellingPrice,
    required this.actualAvailability,
    // required this.navigateTo,
  });

  final String imageReference;
  final String title;
  final String sellingPrice;

  // final String navigateTo;

  final String actualAvailability;

  final inventoryObject;

  @override
  Widget build(BuildContext context) {

    final _inventoryProvider = Provider.of<Inventory>(context);

    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (_){
        _inventoryProvider.removeElementById(inventoryObject);
        InventoryJson().deleteItemOnFirebase(inventoryObject);
        },
      child: Card(
        child: ListTile(
          onTap: () {
            ///a seconda del tipo dell'oggetto passato in costruzione del widget, creo una pagina ad hoc e ci navigo verso
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) {
                  if (inventoryObject is Disposable) {
                    return DisposableDetailScreen(inventoryObject);
                  } else if (inventoryObject is Ingredient) {
                    return IngredientDetailScreen(inventoryObject);
                  } else if (inventoryObject is ResellingProduct) {
                    return ResellingProductDetailScreen(inventoryObject);
                  } else if (inventoryObject is ServiceTool) {
                    return ServiceToolDetailScreen(inventoryObject);
                  } else if (inventoryObject is WorkTool) {
                    return WorkToolDetailScreen(inventoryObject);
                  } else {
                    return Container(
                      child: Text('No Route for this item'),
                    );
                  }
                },
              ),
            );
          },



          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          leading: CircleAvatar(
            radius: 30,
            //TODO: riattivare la riga seguente quando avrò impostato tutto il discorso delle immagini
            //child: Image.asset(imageReference),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text('€ $sellingPrice'),
          trailing: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Text('Availability'),
              SizedBox(
                height: 10,
              ),
              Text(actualAvailability),
            ],
          ),
        ),
      ),
      background: Card(
        color: Colors.red,
        child: ListTile(trailing: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Icon(Icons.delete_forever, size: 35,),
        ),),)
    );
  }
}

// class WarehouseItemTile extends StatelessWidget {
//   WarehouseItemTile({
//     required this.imageReference,
//     required this.title,
//     required this.sellingPrice,
//     required this.dealer,
//     required this.actualAvailability,
//     required this.maxSupply,
//   });
//
//   final String imageReference;
//   final String title;
//   final String sellingPrice;
//   final String dealer;
//   final String actualAvailability;
//   final String maxSupply;
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15.0),
//       ),
//       elevation: 10,
//       child: Expanded(
//         child: Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: CircleAvatar(
//                 radius: 30,
//                 child: Image.asset(imageReference),
//               ),
//             ),
//             SizedBox(width: 20,),
//
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//
//                 SizedBox(height: 10,),
//
//                 Text('€ $sellingPrice'),
//
//
//               ],
//             ),
//
//             Expanded(child: SizedBox()),
//
//
//
//             Column(
//
//               children: [
//                 SizedBox(height: 8,),
//                 Text('Availability'),
//                 SizedBox(height: 10,),
//                 Text(actualAvailability),
//               ],
//             ),
//
//             SizedBox(width: 20,)
//           ],
//         ),
//       ),
//     );
//   }
// }
// Container(
// color: Colors.red,
// margin: EdgeInsets.symmetric(horizontal: 15),
// alignment: Alignment.centerRight,
// child: Padding(
// padding: const EdgeInsets.only(right:12.0),
// child: Icon(
// Icons.delete,
// color: Colors.white,
// ),
// ),
// ),